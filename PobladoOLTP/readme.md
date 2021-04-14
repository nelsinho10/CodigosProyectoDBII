# Aplicación Para Poblado de Base de Datos OLTP

*Asignatura* : 
---
IS601-Bases de Datos II

*Integrantes*:
---
1. Maria Fernanda Zuniga
2. Héctor José Vásquez
3. Henry Mauricio Espinoza 
4. Nelson Jafet Sambula 

*Tecnologias Utilizadas*:
---
* Gestor de Base de Datos: SQL Server
* Lenguaje de Programacion: NodeJS
* Modulo de Conexióna a SQL Server: 
    - rest-mssql-nodejs
    - Documentacion: https://www.npmjs.com/package/rest-mssql-nodejs
* Modulo de Generacion de Datos Aleatorios: 
    - Faker
    - Documentacion: https://www.npmjs.com/package/faker

*Descripción*:
---
Esta aplicación esta construida mediante Nodejs con el objetivo de poblar la Base de Datos OLTP la cual esta realizada para el proyecto final de la asignatura de Bases de Datos II.

*Instrucciones*:
---
* Clonar el repositorio en su equipo local.
* Instalar las dependencias de Node con el comando => `npm install`.
* Cambiar las credenciales por la de su Base de Datos en el objeto => `rest-mssql-nodejs`.
* Ejecutar el archivo principal para poder comprobar que se obtiene conexion con la Base de Datos =>`node. index.js`.
* Ejectar el modulo correspondiente a la tabla que se va a poblar y establecer el numero de Registros que se requieren, en la carpeta */helpers* se encuentran dichos modulos antes mencionados.

*Observaciones*:
---
En ocasiones el llenado de alguna tabla requería traer datos de la OLTP como por ejemplo el id de alguna tabla, en estos casos se realizaron algoritmos más complejos para el llenado de las tablas.



