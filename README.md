README

TITULO PROYECTO: Therapy Manager

Nota: Al final los detalles por hito del proyecto

Therapy Manager es una plataforma que tiene por objetivo apoyar tecnológicamente la práctica de terapias alternativas, facilitando a los terapeutas el manejo de sus pacientes y las respectivas atenciones. Dentro de las terapias alternativas podemos encontrar: Flores de Bach, Naturopatia, Constelaciones Familiares, Reiki, Masoterapia, Biomagnetismo, entre otras.
Habitualmente los terapeutas que realizan terapias alternativas no manejan plataformas tecnológicas donde guarden registros de sus pacientes y atenciones, por lo que esta plataforma viene a cubrir ese espacio para facilitar sus actividades.

INSTRUCCIONES:
Se puede realizar una copia del proyecto de manera local, principalmente para familiarizarse con la plataforma y realizar pruebas:
Requisitos para instalar la aplicación:
Ruby 2.6.0 o superior (realizado con Ruby 2.6.6), Rails 5.2.3
Gemas:
Devise
Activeadmin
Omniauth-google-oauth2
Chartkick
Groupdate
FullCalendar
Momentjs
Rollbar
Mailgun-ruby
Dotenv

INSTALACIÓN:

Descargar proyecto o hacer Fork mediante Git
Posicionarse en carpeta del proyecto
Abrir termina, eliminar gemfile.lock
Validar versiones de Ruby y Rails mencionadas anteriormente
Correr bundle install
Ejecutar rails db:setup para crear la base de datos y ejecutar las migraciones respectivas
Ejecutar rails s estando ubicados en el directorio de la aplicación
Abrir un browser de internet (Edge, Chrome, etc) para visualizar la aplicación

HERRAMIENTAS USADAS:
Visual Studio Code, Bootstrap, Jquery, Javascript, Ajax, FontAwesome, Rails, Ruby

ADMINISTRADOR DE VERSIONES
Git (versionamiento) y Github (Repositorios)

Autor: Matias Acevedo C.

HITO 1: DISEÑO
-	Necesidad:
o	Las terapias alternativas son practicadas por terapeutas que habitualmente no manejan plataformas tecnológicas, y por lo tanto, llevan los registros de sus pacientes, sesiones, terapias, etc de manera manual.
o	El objetivo de este proyecto es facilitar las actividades de los practicantes de terapias alternativas y proveerles una plataforma moderna, responsiva y confiable para el manejo de la información de sus pacientes y sus respectivas atenciones
o	Ejemplos de terapias alternativas: Flores de Bach, Naturopatía, Constelaciones Familiares, Reiki, Registros Akashicos, masoterapia, biomagnetismo, entre otros.
Historias:
DUS001:
El usuario (terapeuta) debe poder registrarse o ingresar en la plataforma
Se debe considerar como información de registro para el usuario, nombre, apellido, nombre de usuario, password, e-mail y especialidad.
Luego de ingresar, el usuario debe tener la posibilidad de agregar pacientes, incluyendo sus datos personales (nombre, apellido, rut, teléfono, e-mail, fecha de nacimiento, profesión o actividad, estado civil), antecedentes familiares, enfermedades importantes, alergias, intervenciones quirúrgicas, actividades deportivas o hobbies.
Tasks:
-	Definir entidades, propiedades y sus dependencias
-	Crear base de datos y migraciones
-	Incluir gema devise para implementación de autenticación de usuarios
-	Crear las páginas de registro, ingreso y la de inicio
-	Incorporar en la página de inicio las siguientes funciones:
o	Pacientes (Crear, Ver, Modificar, Eliminar)
o	Perfil de usuario (Modificar)
o	Cerrar sesión 
DUS002:
El usuario (terapeuta) debe poder registrar información por cada sesión o atención de un paciente, registrando síntomas y/o dolencias, fecha, terapias realizadas, tratamiento si aplica y notas adicionales
Tasks:
-	Crear las migraciones que permitan manejar la información de las sesiones para cada paciente
-	Habilitar opción en “Ver paciente” para crear nueva sesión de atención
DUS003:
El usuario (terapeuta) debe poder ver las atenciones realizadas a sus pacientes y detalles.
Tasks:
-	En menú de pacientes el usuario debe poder ver los datos generales de los pacientes, sus detalles y crear atenciones asociadas a estos
DUS004:
El usuario (terapeuta) debe poder registrar detalles del tratamiento y terapia realizada
Tasks:
-	Habilitar formulario para registrar detalles de tratamiento y terapia realizada

DUS005:
Se debe tener una agenda con las horas disponibles y tomadas, y permitir al usuario (terapeuta) reservar horas al final de la sesión. El usuario debe poder cancelar reservas
Tasks:
-	Incorporar opción de Agendamiento de atención
-	Incorporar gema Full Calendar para manejo de agenda, la cual debe permitir crear o eliminar reservas de atención
-	El usuario debe poder crear o eliminar reservas de atención


UUS001:
Se debe implementar un panel de administración para que el administrador pueda manejar los roles de los usuarios, tales como administrador y usuario.
El administrador debe poder ingresar nuevas terapias
El administrador debe poder eliminar usuarios
Tasks:
-	Incorporar gema Active Admin para incorporar panel de control de manejo de roles de la aplicación y los permisos
-	Agregar campo a usuarios para definir rol de administrador o usuario
-	Modificar vistas, modelos y controladores según se requiera para implementar la funcionalidad
-	Probar panel de administración
-	Personalizar panel de control siguiendo colores y logo establecido
UUS002:
El usuario debe poder buscar pacientes por RUT luego de ingresar a la plataforma
Tasks:
-	Habilitar opción de búsqueda para que el usuario pueda buscar pacientes por rut para revisar sus sesiones previas y los tratamientos realizados
Link de Trello: 
https://trello.com/invite/b/7l2qOfNj/fcc77876f84a8dad932f3baf853e4da2/design-project-board-template


HITO 2: DESARROLLO
-	Login y registro realizado con Devise
-	Permisos de Administrador y usuario definidos. A diferencia de un usuario normal, el administrador puede agregar nuevas especialidades, realizar cambios a los usuarios, etc mediante un panel de control para el cual se utilizó la gema Active Admin. Al probar la aplicación de manera local no hay usuario administrador por default, por lo que se debe cambiar el campo Admin del usuario a True desde la consola
-	El usuario puede editar sus datos de perfil y puede agregar o eliminar especialidades asociadas a su usuario
- El usuario puede ver en su perfil el listado de pacientes y sus atenciones realizadas, y tambien puede crear atenciones desde los registros desplegados. En el menu de Pacientes puede realizar busqueda por rut de pacientes y en el menu de Atenciones puede buscar por rut de tal manera de acceder a las atenciones realizadas a un paciente en particular 
-	El home de la plataforma está diferenciado para los usuarios que han hecho login vs los que no lo han hecho
-	Se incluye un sistema de calificación y en la página principal aparece el promedio de calificación. Dado que es una aplicación, se consideró que un usuario puede realizar más de una calificación y puede ver las calificaciones de otros
-	El usuario puede crear y eliminar reservas de atenciones, las cuales se despliegan en un calendario. En cada atención al lado derecho se despliega una letra X para poder eliminar cada atención en específico

HITO 3: INTEGRACIÓN
-	Se implementó registro y login usando OAuth (Google)
-	En el perfil de usuario se implementó un dashboard con dos gráficos con información de atenciones por especialidad y atenciones por paciente
-	Se implementó la posibilidad de enviar e-mail de Bienvenida al momento del registro de los usuarios. Para esto se usó el proveedor Mailgun. El servicio de mailing se encuentra implementado con API. Para el manejo de la API Key y el dominio se utilizó (en Development) la gema DOTENV y variables de entorno almacenadas en archivo .ENV, el cual fue excluido de Git (GitIgnore). En Heroku se maneja con variables de entorno en la plataforma. Es importante mencionar que la función que gatilla el envío del e-mail de Bienvenida se encuentra en la ruta app/models/user, su nombre es welcome_user (se probó y funciona perfectamente). Dado que Mailgun habilita un Sandbox domain y por lo tanto solo permite envío de e-mails a direcciones previamente registradas y confirmadas, al loguearse con cualquier direccion de e-mail no enviará el e-mail, pero en la consola del servidor se puede observar que el envío (delivery) se realiza.

HITO 4: DEPLOYMENT
-	La plataforma se encuentra desplegada en Heroku. Dirección: https://powerful-oasis-02752.herokuapp.com/
-	Dominio configurado apuntando a la plataforma: http://www.therapymgr.com
-	Servicio de reportes implementado y probado: Rollbar

