# ===========================
# Section to save script path
# ===========================
$DO_PATH_CREATE_DDL = "DO/scripts/ddl/!RUN_CREATE_DDL.sql"
$DO_PATH_CREATE_DML = "DO/scripts/dml/!RUN_CREATE_DML.sql"
$DO_PATH_CREATE_UPDATE_FUNCTIONS = "DO/scripts/functions/!RUN_CREATE_UPDATE_FUNCTIONS.sql"
$DO_PATH_CREATE_UPDATE_SP = "DO/scripts/sp/!RUN_CREATE_UPDATE_SP.sql"


# ==========================
# Section to run the scripts
# ==========================
# Preparing the scripts
Import-Module "SqlServer"
sqlcmd -S $DB_SERVER_NAME -d $DB_DATABASE_NAME -U $DB_USERNAME -P $DB_PASSWORD -v FullScriptDir=`"$PATH`" DataBaseName=$DB_DATABASE_NAME -i $DO_PATH_CREATE_DDL -b -f 65001
Write-Host
sqlcmd -S $DB_SERVER_NAME -d $DB_DATABASE_NAME -U $DB_USERNAME -P $DB_PASSWORD -v FullScriptDir=`"$PATH`" DataBaseName=$DB_DATABASE_NAME -i $DO_PATH_CREATE_DML -b -f 65001
Write-Host
sqlcmd -S $DB_SERVER_NAME -d $DB_DATABASE_NAME -U $DB_USERNAME -P $DB_PASSWORD -v FullScriptDir=`"$PATH`" DataBaseName=$DB_DATABASE_NAME -i $DO_PATH_CREATE_UPDATE_FUNCTIONS -b -f 65001
Write-Host
sqlcmd -S $DB_SERVER_NAME -d $DB_DATABASE_NAME -U $DB_USERNAME -P $DB_PASSWORD -v FullScriptDir=`"$PATH`" DataBaseName=$DB_DATABASE_NAME -i $DO_PATH_CREATE_UPDATE_SP -b -f 65001
Write-Host

