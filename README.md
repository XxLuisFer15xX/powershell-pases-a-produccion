# Automatización de Scripts SQL SERVER

## Descripción del Proyecto

El proyecto tiene como objetivo principal, mostrar un ejemplo básico y proporcionar una estructura base de como organizar un pase a producción con scripts de SQL Server. Este proyecto utiliza el método de la ejecución automática de archivos ".sql" en la base de datos SQL Server por me dio de un script principal de PowerShell.

Para más información sobre la ejeución automática de archivos ".sql" en la base de datos SQL Server, favor seguir la documentación de este repositorio:
https://github.com/XxLuisFer15xX/powershell-script-automation-transact-sql

## Código Fuente

### Estructura de archivos

1. **Anexos**
   - **docs:** Carpeta para incluir la documentación como manual de usuario o resumen de cambios
   - **logs:** Logs generados al ejecutar el pase a producción en la base de datos.
2. **Despliegue** Carpeta que contiene todo el código fuente necesario para realizar el despliegue.
   - **SQLSERVER_PROD:** Carpeta que contiene los scripts de base de datos de SQL Server
     - **DO:** Carpeta que contiene todos los scripts necesarios para realizar una actualización en la base de datos.
       - **scripts**
         - **ddl:** Scripts para gestionar los DDLs.
         - **dml:** Scripts para gestionar los DMLs.
         - **functions:** Scripts para gestionar las funciones.
         - **sp:** Scripts para gestionar las procedimientos almacenados.
       - **src**
         - **DDLs:** Scripts para create y alter.
         - **DMLs:** Scripts para insert tables.
         - **functions:** Scripts para funciones.
         - **sp:** Scripts para procedimientos almacenados.
       - **!RUN.ps1:** Script de PowerShell el cuál ejecuta todas las actualizaciones de los objetos de base de datos.
     - **UNDO:** Carpeta que contiene todos los scripts necesarios para realizar una reversión de la actualización en la base de datos.
       - **scripts**
         - **ddl:** Scripts para gestionar los DDLs.
         - **functions:** Scripts para gestionar las funciones.
         - **sp:** Scripts para gestionar las procedimientos almacenados.
       - **src**
         - **DDLs:** Scripts para drop tables.
         - **functions:** Scripts para funciones.
         - **sp:** Scripts para procedimientos almacenados.
       - **!RUN_UNDO.ps1:** Script de PowerShell el cuál ejecuta toda la reversión de los cambios aplicados en la base de datos.
     - **!RUN.ps1:** Script principal de PowerShell el cuál tome los valores iniciales y decide que acción realizar (DO o UNDO).
   - **MAT - 2024Abril25:** Guía de ejecución del pase a producción
3. **README.md:** Archivo que contiene la descripción del proyecto. (No es necesario incluirlo en los pases a producción)

### Ejecutar el Script Maestro

1. Abrir la Power Shell de Windows en la raíz del proyecto.
2. Ejecutar el siguiente comando `Set-ExecutionPolicy Unrestricted` solo UNA VEZ, para autorizar la ejecución de scripts de Power Shell.
3. Ejecutar el siguiente comando `Install-Module -Name SqlServer -AllowClobber` solo UNA VEZ y presione la tecla A para aceptar todo. Este comando descargará e instalará los módulos de SqlServer.
4. Navegar hacia la carpeta `Despliegue/SQLSERVER_PROD`.
5. Ejecutar el siguiente comando `.\!RUN.ps1` para correr el script maestro que ejecuta todos los scripts SQL.
