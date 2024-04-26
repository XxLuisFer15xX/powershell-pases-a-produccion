# ===========================
# Section to save script path
# ===========================
$UNDO_PATH_DROP_DDL = "UNDO/scripts/ddl/!RUN_DROP_DDL.sql"
$UNDO_PATH_DROP_FUNCTIONS = "UNDO/scripts/functions/!RUN_DROP_FUNCTIONS.sql"
$UNDO_PATH_DROP_SP = "UNDO/scripts/sp/!RUN_DROP_SP.sql"


# ==========================
# Section to run the scripts
# ==========================
# Preparing the scripts
Import-Module "SqlServer"
sqlcmd -S $DB_SERVER_NAME -d $DB_DATABASE_NAME -U $DB_USERNAME -P $DB_PASSWORD -v FullScriptDir=`"$PATH`" DataBaseName=$DB_DATABASE_NAME -i $UNDO_PATH_DROP_DDL -b -f 65001
Write-Host
sqlcmd -S $DB_SERVER_NAME -d $DB_DATABASE_NAME -U $DB_USERNAME -P $DB_PASSWORD -v FullScriptDir=`"$PATH`" DataBaseName=$DB_DATABASE_NAME -i $UNDO_PATH_DROP_FUNCTIONS -b -f 65001
Write-Host
sqlcmd -S $DB_SERVER_NAME -d $DB_DATABASE_NAME -U $DB_USERNAME -P $DB_PASSWORD -v FullScriptDir=`"$PATH`" DataBaseName=$DB_DATABASE_NAME -i $UNDO_PATH_DROP_SP -b -f 65001
Write-Host

