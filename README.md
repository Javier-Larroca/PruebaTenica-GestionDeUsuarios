# Prueba Técnica - Gestión de Usuarios

Repositorio generado como entrega de prueba técnica **ASP.NET WebForms - Atica SRL**.

Los requerimientos de este desarrollo se encuentran en el archivo **`PruebaTecnica_ATICA.pdf`**.

---

## Puesta en marcha

1. **Ejecutar el script de base de datos**  
   Antes de correr la aplicación, ejecutar el archivo **`ScriptDatabase.sql`** en tu servidor SQL.

2. **Configurar la cadena de conexión**  
   Editar el archivo **`Web.config`** y ajustar el `connectionString` con los datos de tu servidor.

3. **Ejecutar la aplicación**  
   Una vez realizados los pasos anteriores, la aplicación estará lista para ejecutarse.

---

## Acceso

- Usuario administrador preconfigurado:  
  - **Email:** `admin@mail.com`  
  - **Contraseña:** `adminadmin`

- También se puede **registrar un nuevo usuario** desde la pantalla de registro sin necesidad de iniciar sesión.  
  Posteriormente, se podrá acceder con ese usuario creado.

---

## Funcionalidades

### Home de usuarios
Al iniciar sesión se accede al **Home**, desde donde se puede navegar a:

- **Administrar usuarios**  
  - Listar usuarios registrados.  
  - Habilitar o deshabilitar usuarios.  
  - Acceder a la edición de un usuario.  
  - Eliminar usuarios.  

- **Crear usuarios**  
  - Completar un formulario para crear un nuevo usuario.  
  - La contraseña se **autogenera** y debería enviarse por correo electrónico.  
  - *Nota:* El servicio de envío de emails aún no fue implementado.

---

## Estructura del proyecto

- **`ScriptDatabase.sql`** → Script para generar la base de datos.  
- **`Web.config`** → Archivo de configuración (connectionString).  
- **`PruebaTecnica_ATICA.pdf`** → Documento con los requerimientos de la prueba técnica.  

---

## Tecnologías utilizadas

- **ASP.NET WebForms (.NET Framework)**  
- **SQL Server**  

---

## Notas

- El servicio de envío de emails está pendiente de implementación.  

---