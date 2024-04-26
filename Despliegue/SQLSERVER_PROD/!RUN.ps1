# =======================================
# Section to obtain environment variables
# =======================================
# Getting environment variables.
Write-Host "Enter the name of the SQL Server. For example: EXAMPLE.com"
$DB_SERVER_NAME = Read-Host "DB_SERVER_NAME"
Write-Host
Write-Host "Enter the name of the database. For example: EXAMPLE"
$DB_DATABASE_NAME = Read-Host "DB_DATABASE_NAME"
Write-Host
Write-Host "Enter the username. For example: adminEXAMPLE"
$DB_USERNAME = Read-Host "DB_USERNAME"
Write-Host
Write-Host "Enter the password."
$DB_PASSWORD = Read-Host "DB_PASSWORD"
Write-Host

# Verifying that the connection data to the database were entered.
$count = 0
if (-not $DB_SERVER_NAME) {
    $count = $count + 1
}
if (-not $DB_DATABASE_NAME) {
    $count = $count + 1
}
if (-not $DB_USERNAME) {
    $count = $count + 1
}
if (-not $DB_PASSWORD) {
    $count = $count + 1
}
if ($count -gt 0) {
    Write-Host
    Write-Host "ERROR: Some environment variables were not entered."
    Write-Host
    break
}

# ===========================
# Section to choose an option
# ===========================
# Loading options.
Clear-Host
$menuTitle = "Select the option:"
$menuOptions = @{
    0 = "DO: Update the database."
    1 = "UNDO: Revert changes."
}
$maxValue = $menuOptions.count - 1
$selection = 0
$enterPressed = $False
while($enterPressed -eq $False){
    Write-Host "$menuTitle"
    for ($i=0; $i -le $maxValue; $i++){
        if ($i -eq $selection){
            Write-Host -BackgroundColor Cyan -ForegroundColor Black "[ $($menuOptions[$i]) ]"
        } else {
            Write-Host "  $($menuOptions[$i])  "
        }
    }
    $keyInput = $host.ui.rawui.readkey("NoEcho,IncludeKeyDown").virtualkeycode
    switch($keyInput){
        13{
            $enterPressed = $True
            break
        }
        38{
            if ($selection -eq 0){
                $selection = $maxValue
            } else {
                $selection -= 1
            }
            Clear-Host
            break
        }
        40{
            if ($selection -eq $maxValue){
                $selection = 0
            } else {
                $selection +=1
            }
            Clear-Host
            break
        }
        default{
            Clear-Host
        }
    }
}

# Confirming the selected option.
Write-Host
Write-Host "Your selected answer was:"
Write-Host ">" $menuOptions.get_Item($selection)

$confirm = Read-Host "Are you sure you want to execute this operation? (YES/NO)"
if ($confirm -ne "YES") {
    Write-Host
    Write-Host "Your response was:" $confirm
    Write-Host "The operation was aborted."
    Write-Host
    break
}
Clear-Host
Write-Host
Write-Host "Starting the action."
Write-Host "Type Ctrl + C to abort the action."
Write-Host
pause

# ==========================
# Section to run the scripts
# ==========================
# Preparing the scripts
Clear-Host
if ($selection -eq 0){
    Start-Transcript -Path .\!RUN_DO_PROD_APLI_2024.log
    Write-Host ">" $menuOptions.get_Item($selection)
    Write-Host
    Write-Host "Updating the database..."
    Write-Host

    $PATH = "$($pwd)\DO"
    .\DO\!RUN_DO.ps1

    Write-Host
    Write-Host "Database updated successfully."
    Stop-Transcript
}
if ($selection -eq 1){
    Start-Transcript -Path .\!RUN_UNDO_PROD_APLI_2024.log
    Write-Host ">" $menuOptions.get_Item($selection)
    Write-Host
    Write-Host "Reversing changes in the database..."
    Write-Host

    $PATH = "$($pwd)\UNDO"
    .\UNDO\!RUN_UNDO.ps1

    Write-Host
    Write-Host "Database updated successfully."
    Stop-Transcript
}
Write-Host
