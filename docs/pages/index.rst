
.. Desarrollo de Aplicaciones en Internet, materiales, documentation master file

Materiales de Desarrollo de Aplicaciones en Internet
====================================================

Universitat d'Alacant, curso 2023–2024
--------------------------------------

*«The web is more a social creation than a technical one», Tim Berners-Lee*

.. raw:: html

  <p xmlns:cc="http://creativecommons.org/ns#">Materiales con licencia <a href="https://creativecommons.org/licenses/by-nc-sa/4.0/?ref=chooser-v1" target="_blank" rel="license noopener noreferrer" style="display:inline-block;">CC BY-NC-SA 4.0<img style="height:22px!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/cc.svg?ref=chooser-v1" alt=""><img style="height:22px!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/by.svg?ref=chooser-v1" alt=""><img style="height:22px!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/nc.svg?ref=chooser-v1" alt=""><img style="height:22px!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/sa.svg?ref=chooser-v1" alt=""></a></p>


.. |ss| raw:: html

   <strike>

.. |se| raw:: html

   </strike>

.. role:: strike
    :class: strike

Novedades
---------

.. list-table::
    :widths: 10 90
    :header-rows: 0
    :class: tablita

    * - 22 dic
      - Ya puedes consultar en la `web del departamento`_ las notas de la práctica 4. Los apartados marcados con un asterisco cuentan la cuarta parte que los otros.
    * - 05 dic
      - Lo siguiente son algunas normas y recomendaciones para los exámenes de la asignatura de enero de 2024. El examen de teoría y el de prácticas de la convocatoria de enero tendrán lugar el 10 de enero por la mañana en el horario y aulas que se indica en la `guía docente`_. Ambos exámenes se realizarán en el mismo laboratorio: el de teoría comenzará a las 9.00 y el de prácticas cuando termine este, con un pequeño descanso entre ambos. El examen de teoría tendrá una duración aproximada de 100 minutos y el de prácticas de 120 minutos. El examen de prácticas se realizará en el ordenador del laboratorio sin conexión a internet. En previsión de posibles problemas con estos ordenadores, ven al examen con tu portátil si lo tienes. Asegúrate de traer una versión funcional de tu práctica 4 en una unidad de almacenamiento externa, ya que el examen de prácticas consistirá en una ampliación de esta. Es recomendable llevar una par de memorias USB para evitar *disgustos* por fallos inesperados en el dispositivo. Los resultados de la evaluación de la práctica 4 se publicarán previsiblemente varios días antes del examen, pero probablemente no necesitarás el informe del profesor para saber qué cosas no funcionan de la práctica que entregaste y corregirlas antes del examen. El examen de teoría constará de unos 10 problemas similares a algunos de los de la página ":ref:`label-problemas`"; se pedirá que cada respuesta vaya acompañada de una pequeña justificación, la mínima necesaria para que el profesor, que también conoce la materia, pueda concluir que eres capaz de defender tu respuesta y que esta no es consecuencia del azar. Recuerda que puedes traer al examen teórico una chuleta de tamaño máximo A5. Al examen práctico puedes traer otra chuleta del mismo tamaño, pero dado que también traerás tu propio código de la práctica 4 en una memoria USB, puedes añadir allí cualquier información suplementaria en ficheros adicionales. En esta misma página, más abajo, se explica cómo crear una versión offline de los materiales de la asignatura con ``wget``. Inmediatamente antes del inicio examen práctico, tendrás 5 minutos para copiar desde tu memoria USB al ordenador del laboratorio el código de tu práctica 4 (que no tiene por qué coincidir al cien por cien con el que entregaste en diciembre, ya que probablemente le hayas hecho alguna mejora o corregido algunos errores) y preparar el entorno de trabajo; después de ese momento, no será posible tener conectado ningún dispositivo externo al ordenador durante la realización del examen. Solo habrá conexión a internet durante los minutos previos al examen de prácticas para que puedas preparar tu programa, como ya se ha comentado. En ese momento puedes ejecutar ``npm install``, ya que esta orden necesita acceso a internet; hay, sin embargo, una opción mejor: que traigas tu carpeta ``node_modules`` obtenida en una máquina con Linux y la copies directamente en tu directorio de trabajo. El examen se realizará en el sistema operativo Linux de los ordenadores del laboratorio; asegúrate de que el sistema de ficheros de tu memoria USB es compatible con el Linux de los laboratorios para no tener problemas al copiar tu código. En los ordenadores del laboratorio están instalados ``SQLite3`` y ``Node.js``, pero la versión de Node es anterior a la 20 que estamos usando en la asignatura.  Para poder usar la versión 20 de Node.js instálala con el script contenido en nuestro paquete ``dai-bundle``, asegurándote de que pones antes a falso las variables correspondientes a SQLite3 (que ya está instalado) y al cliente de línea de órdenes de Google Cloud en el script ``install.sh``.
    * - 05 dic
      - Ya puedes consultar en la `web del departamento`_ las notas de la práctica 3. Los apartados marcados con un asterisco cuentan la mitad que los otros.
    * - 14 nov
      - Ya puedes consultar en la `web del departamento`_ las notas de la práctica 2. Los apartados marcados con un asterisco cuentan la cuarta parte que los otros.
    * - 17 oct
      - Ya puedes consultar en la `web del departamento`_ las notas de la práctica 1.
    * - 06 sep
      - En la sección ":ref:`label-actividades`" podrás ir encontrando cada semana las actividades a realizar antes de la clase siguiente. Habrá también un enlace a un pequeño cuestionario que tienes que rellenar antes de las 23.59 del día anterior. Recuerda que estos cuestionarios contribuyen a la nota final. Consulta tras cada clase la sección ":ref:`label-actividades`" para comprobar si esa semana hay que realizar actividades antes de la clase siguiente. Ya tienes disponible las actividades y el cuestionario a realizar antes de la clase del 19 de septiembre de 2023.
    * - 05 sep
      - Ya está publicado el enunciado de la primera práctica. De hecho, están publicados los enunciados de todas las prácticas. Las clases de teoría y prácticas comienzan el día 12 de septiembre.

..    * - 23 dic
..      - Ya puedes consultar en la `web del departamento`_ las notas de la práctica 4. Los apartados marcados con un asterisco cuentan la cuarta parte que los otros.
..    * - 20 dic
..      - Lo siguiente son algunas normas y recomendaciones para los exámenes de la asignatura de enero de 2024. El examen de teoría y el de prácticas de la convocatoria de enero tendrán lugar el 10 de enero por la mañana en el horario y aulas que se indica en la `guía docente`_. Ambos exámenes se realizarán en el mismo laboratorio: el de teoría comenzará a las 9.00 y el de prácticas cuando termine este, con un pequeño descanso entre ambos. El examen de teoría tendrá una duración aproximada de 100 minutos y el de prácticas de 120 minutos. El examen de prácticas se realizará en el ordenador del laboratorio sin conexión a internet. En previsión de posibles problemas con estos ordenadores, ven al examen con tu portátil si lo tienes. Asegúrate de traer una versión funcional de tu práctica 4 en una unidad de almacenamiento externa, ya que el examen de prácticas consistirá en una ampliación de esta. Es recomendable llevar una par de memorias USB para evitar *disgustos* por fallos inesperados en el dispositivo. Los resultados de la evaluación de la práctica 4 se publicarán previsiblemente varios días antes del examen, pero probablemente no necesitarás el informe del profesor para saber qué cosas no funcionan de la práctica que entregaste y corregirlas antes del examen. El examen de teoría constará de unos 10 problemas similares a algunos de los de la página ":ref:`label-problemas`"; se pedirá que cada respuesta vaya acompañada de una pequeña justificación, la mínima necesaria para que el profesor, que también conoce la materia, pueda concluir que eres capaz de defender tu respuesta y que esta no es consecuencia del azar. Recuerda que puedes traer al examen teórico una chuleta de tamaño máximo A5. Al examen práctico puedes traer otra chuleta del mismo tamaño, pero dado que también traerás tu propio código de la práctica 4 en una memoria USB, puedes añadir allí cualquier información suplementaria en ficheros adicionales. En esta misma página, más abajo, se explica cómo crear una versión offline de los materiales de la asignatura con ``wget``. Inmediatamente antes del inicio examen práctico, tendrás 5 minutos para copiar desde tu memoria USB al ordenador del laboratorio el código de tu práctica 4 (que no tiene por qué coincidir al cien por cien con el que entregaste en diciembre, ya que probablemente le hayas hecho alguna mejora o corregido algunos errores) y preparar el entorno de trabajo; después de ese momento, no será posible tener conectado ningún dispositivo externo al ordenador durante la realización del examen. Solo habrá conexión a internet durante los minutos previos al examen de prácticas para que puedas preparar tu programa, como ya se ha comentado. Es especialmente importante que ejecutes ``npm install`` en ese momento, ya que esta orden necesita acceso a internet. El examen se realizará en el sistema operativo Linux de los ordenadores del laboratorio; asegúrate de que el sistema de ficheros de tu memoria USB es compatible con el Linux de los laboratorios para no tener problemas al copiar tu código. En los ordenadores del laboratorio están instalados ``SQLite3`` y ``Node.js``. Para poder usar la versión 16 de Node.js que hay en el laboratorio, edita ``package.json`` y cambia la versión de ``node`` a ``16.x``, la de ``knex`` a ``^2.3.0`` y la de ``sqlite3`` a ``^5.1.4``. 
..    * - 29 nov
..      - Ya puedes consultar en la `web del departamento`_ las notas de la práctica 3. Los apartados marcados con un asterisco cuentan la mitad que los otros.
..    * - 08 nov
..      - Ya puedes consultar en la `web del departamento`_ las notas de la práctica 2. Los apartados marcados con un asterisco cuentan la cuarta parte que los otros.
..    * - 25 oct
..      - En UACloud se ha publicado un anuncio referente a las clases de la semana que viene que, recuerda, serán el lunes 31 de octubre.
..    * - 24 oct
..      - Hace unos días se publicó un anuncio en UACloud respecto a la obtención de créditos educativos para usar Google Cloud Platform. Asegúrate de ir configurando tu cuenta para poder usarla dentro de pocas semanas en las prácticas.
..    * - 18 oct
..      - Ya puedes consultar en la `web del departamento`_ las notas de la práctica 1.
    * - 06 sep
      - En la sección ":ref:`label-actividades`" podrás ir encontrando cada semana las actividades a realizar antes de la clase siguiente. Habrá también un enlace a un pequeño cuestionario que tienes que rellenar antes de las 23.59 del día anterior. Recuerda que estos cuestionarios contribuyen a la nota final. Consulta tras cada clase la sección ":ref:`label-actividades`" para comprobar si esa semana hay que realizar actividades antes de la clase siguiente. Ya tienes disponible las actividades y el cuestionario a realizar antes de la clase del 20 de septiembre de 2023.
    * - 05 sep
      - Ya está publicado el enunciado de la primera práctica. Las clases de teoría y prácticas comienzan el día 13 de septiembre.

..    * - 11 ene
..      - Ya puedes consultar en la `web del departamento`_ las notas de la práctica 4. Los apartados marcados con un asterisco cuentan una cuarta parte que los otros.
..    * - 21 dic
..      - La fecha de entrega de la práctica 4 se ha retrasado hasta el 30 de diciembre a las 23.59.
..    * - 18 dic
..      - El examen de teoría y el de prácticas de la convocatoria de enero tendrán lugar el 18 de enero por la mañana en el horario y aulas que se indica en la `guía docente`_. Ambos exámenes se realizarán en el mismo laboratorio: el de teoría comenzará a las 9.00 y el de prácticas cuando termine este, con un pequeño descanso entre ambos. El examen de teoría tendrá una duración aproximada de 100 minutos y el de prácticas de 120 minutos. El examen de prácticas lo podrás realizar bien con tu portátil bien con el ordenador del laboratorio. Asegúrate de traer una versión funcional de tu práctica 4, ya que el examen de prácticas consistirá en una ampliación de esta. Los resultados de la evaluación de la práctica 4 se publicarán previsiblemente unos días antes del examen, pero probablemente no necesitarás el informe del profesor para saber qué cosas no funcionan de la práctica que entregaste y corregirlas antes del examen.
..    * - 14 dic
..      - Ya puedes consultar en la `web del departamento`_ las notas de la práctica 3. Los apartados marcados con un asterisco cuentan la octava parte que los otros.
..    * - 23 nov
..      - Se ha retrasado el plazo de entrega de la práctica 3 hasta el domingo 28 de noviembre de 2023 a las 23.59.
..    * - 21 sep
..      - Recuerda mirar cada semana la sección ":ref:`label-actividades`" para ver las tareas a realizar antes de la clase de la semana siguiente.

.. _`web del departamento`: https://www.dlsi.ua.es/alumnes/index.cgi?id=val
.. _`entrega de prácticas`: https://pracdlsi.dlsi.ua.es/index.cgi?id=val

.. Créditos educativos para usar Google Cloud Platform. En algunos temas posteriores de la asignatura usaremos los servicios en la nube de Google Cloud Platform. Para poder hacerlo, tienes que darte de alta con tu cuenta de gcloud a través de un programa de créditos educativos. En ningún momento has de dar de indicar los datos de ninguna tarjeta de crédito; si el sistema te pide algo así, es que estás haciendo algo mal. Sigue el siguiente enlace e indica tu nombre y tu cuenta de correo electrónico de gcloud.ua.es: [...] Sigue las instrucciones y revisa tu bandeja de entrada (recibirás seguramente un primer mensaje para que valides tu cuenta) hasta recibir un mensaje de Google Cloud Notifications con un número de cupón y un enlace donde canjearlo. Importante: cuando abras este enlace, asegúrate en todo momento de estar usando tu cuenta de gcloud y no otras cuentas de Google; para ello, observa la cuenta que se está usando en la esquina superior derecha y cámbiala si es necesario. Solo se puede obtener un cupón por estudiante. Más adelante, aprenderemos qué cosas podemos hacer en Google Cloud Platform. Por ahora, basta con que accedas, una vez canjeado el cupón (no solo verificada tu cuenta), a https://console.cloud.google.com/billing/ y compruebes que tienes una cuenta con $50 a tu disposición. Es importante que sigas los pasos anteriores en los próximos días incluso aunque te hayas dejado la asignatura para la siguiente convocatoria, ya que los cupones caducan en unas semanas. Nota: si finalmente cargaras los créditos educativos en una cuenta de Google que no sea la de gcloud, tendrás posteriormente que añadir al profesor manualmente como propietario de tu proyecto a través de las opciones de administración de IAM de Google Cloud; pregunta al profesor cómo hacerlo.


.. _label-actividades:

Actividades previas a las clases
--------------------------------

- Antes de la clase del 19/12/2023: realiza la actividad ":ref:`label-extracss`" en la que has de ver un par de vídeos sobre características adicionales de CSS (duración total de los vídeos: unas 2 horas y media; un poco más de 1 hora y media a 1,5x). A continuación, contesta el `test sobre características adicionales de CSS`_ (plazo límite: 18/12/2023, 23:59 horas).
- Para la próxima sesión de clase (12/12/2023) no hay actividades previas a realizar. Se estudiará en clase la plataforma Docker, pero sin necesidad de una preparación anterior por parte del estudiante. Así podrás avanzar más en la práctica 4 o simplemente desconectar un poco durante los varios días festivos :-)
- Antes de la clase del 05/12/2023: realiza la actividad ":ref:`label-comp-nube`", que incluye la lectura de una definición concisa de lo que es la computación en la nube y el visionado de unos vídeos; a continuación, contesta el `test sobre computación en la nube`_ (plazo límite: 04/12/2023, 23:59 horas). Después, realiza la actividad ":ref:`label-appengine`", en la que aprenderás a desplegar en la nube la aplicación del carrito, lo que necesitarás saber hacer por ti mismo como paso final de la práctica 4.
- Antes de la clase del 28/11/2023: sigue (si no lo hiciste ya) la actividad ":ref:`label-gcloud`", donde se muestra cómo configurar tu entorno de trabajo para poder trabajar con la nube de Google, y, a continuación, la actividad ":ref:`label-gcp`" en la que tendrás que ver unos vídeos (duración: 40 minutos), leer unos tutoriales y realizar un pequeño ejercicio. A continuación, contesta el `test sobre Google Cloud Platform`_ (plazo límite: 27/11/2023, 23:59 horas)
- Antes de la clase del 21/11/2023: practica con lo que se comenta en las actividades siguientes: ":ref:`label-local`", ":ref:`label-prueba-carrito`", ":ref:`label-api-cambio`", ":ref:`label-gcp-deploy`" y ":ref:`label-cors`". A continuación, contesta el `test sobre despliegue de aplicaciones web`_ (plazo límite: 20/11/2023, 23:59 horas)
- Antes de la clase del 14/11/2023: lee detenidamente y practica con lo discutido en las actividades siguientes: ":ref:`label-curl`", ":ref:`label-cliente-rest`" y ":ref:`label-servidor-rest`"; la última incluye un vídeo con una traza de la aplicación del carrito (duración: 28 minutos; unos 20 a 1,5x). Para poder practicar con el código de esas actividades, tendrás que configurar tu entorno de trabajo como se indica en la actividad ":ref:`label-local`". A continuación, contesta el `test sobre implementación de servicios web`_ (plazo límite: 13/11/2023, 23:59 horas).
- Antes de la clase del 07/11/2023: lee detenidamente y practica con lo discutido en las actividades siguientes: ":ref:`label-intro-comp`", ":ref:`label-ejemplo-comp`" y ":ref:`label-avanzado-comp`". A continuación, contesta el `test sobre componentes web`_ (plazo límite: 06/11/2023, 23:59 horas).
- Antes de la clase del 31/10/2023: realiza las actividades ":ref:`label-servicios-http`", ":ref:`label-servicios-promesas`", ":ref:`label-servicios-xhr`" y ":ref:`label-servicios-fetch`". Todas las actividades menos la segunda consisten principalmente en el estudio de una serie de vídeos (duración total de los vídeos: 50 minutos; unos 35 a 1,5x). Para la la segunda actividad, sin embargo, tienes que leer su contenido (tiempo estimado de lectura: 30 minutos). A continuación contesta el `test sobre acceso a servicios web`_ (plazo límite: 30/10/2023, 23:59 horas).
- Antes de la clase del 24/10/2023: realiza la actividad ":ref:`label-js-objetos`" (en esta actividad tienes que leer un texto con un tiempo estimado de lectura de unos 80 minutos); después, lee y practica con lo que se discute en la actividad ":ref:`label-js-clausuras`" (tiempo estimado de lectura: 15 minutos). A continuación contesta el `test sobre prototipos y clausuras en JavaScript`_ (plazo límite: 23/10/2023, 23:59 horas). 
- Antes de la clase del 17/10/2023: estudia los vídeos de la actividad ":ref:`label-api-web-js`" (duración total de los vídeos: unos 55 minutos; unos 40 a 1,5x). A continuación, contesta el `test sobre la API de los navegadores para JavaScript`_ (plazo límite: 16/10/2023, 23:59 horas).
- Antes de la clase del 10/10/2023: estudia el código y los vídeos de la actividad ":ref:`label-app-web-sencilla`" (duración total de los vídeos: unos 50 minutos; unos 35 a 1,5x). A continuación, contesta el `test sobre la aplicación web sencilla con JavaScript`_ (plazo límite: 09/10/2023, 23:59 horas).
- Antes de la clase del 03/10/2023: estudia los vídeos de la actividad ":ref:`label-intro-js`" (duración total de los vídeos: unos 55 minutos; unos 40 a 1,5x). A continuación, contesta el `test sobre la introducción a JavaScript`_ (plazo límite: 02/10/2023, 23:59 horas). Utiliza tu cuenta de ``gcloud.ua.es`` para acceder a todos los materiales que requieran autenticación.
- Antes de la clase del 26/09/2023: lee detenidamente y practica con lo discutido en las actividades siguientes: ":ref:`label-inline-css`", ":ref:`label-caja-css`" y ":ref:`label-posicionamiento-css`". A continuación, contesta el `test sobre el modelo de caja de CSS`_ (plazo límite: 25/09/2023, 23:59 horas). Recuerda utilizar tu cuenta de ``gcloud.ua.es`` para acceder a los materiales que requieran autenticación.
- Antes de la clase del 19/09/2023: estudia los vídeos y practica con la actividad ":ref:`label-intro-css`" (duración total de los vídeos: unos 35 minutos; unos 25 a velocidad 1,5x). A continuación, contesta el `test sobre la introducción a CSS`_ (plazo límite: 18/09/2023, 23:59 horas). Utiliza tu cuenta de ``gcloud.ua.es`` para acceder a todos estos materiales. Si tu ancho de banda te lo permite, puedes elegir explícitamente una resolución de 1080 píxeles para el vídeo.

.. _`test sobre características adicionales de CSS`: https://forms.gle/VD6wtRTpVCwskoLo9
.. _`test sobre computación en la nube`: https://forms.gle/WUqR6Z3AaHKrqZ9J7
.. _`test sobre Google Cloud Platform`: https://forms.gle/6cCTbvJWTekiHGLc9
.. _`test sobre despliegue de aplicaciones web`: https://forms.gle/GUbu37fNwaYyfgPV7
.. _`test sobre implementación de servicios web`: https://forms.gle/H3pTR3LwudaJwE4b8 
.. _`test sobre componentes web`: https://forms.gle/DowYFoTLpv4BTCpcA
.. _`test sobre acceso a servicios web`: https://forms.gle/M9Hy9FxV8KRXiWNeA
.. _`test sobre prototipos y clausuras en JavaScript`: https://forms.gle/3Z4WfGQzZNx31Sui8
.. _`test sobre la API de los navegadores para JavaScript`: https://forms.gle/mmMFWaZP2dqy2juw9
.. _`test sobre la aplicación web sencilla con JavaScript`: https://forms.gle/mQw11xgGZCjzcSkp6
.. _`test sobre la introducción a JavaScript`: https://forms.gle/K5krpteo4L9qzSud8
.. _`Selectores y propiedades de CSS (parte 1)`: https://drive.google.com/file/d/1i3s-LKeMsCam5-kmD65G-BMGWsJjmaA8/view?usp=sharing
.. _`Selectores y propiedades de CSS (parte 2)`: https://drive.google.com/file/d/1XpPhulZBzbsS-ODtjuwZUzDNznKVphj6/view?usp=sharing
.. _`Selectores y propiedades de CSS (parte 3)`: https://drive.google.com/file/d/1PhItC2tHklcq82pHclsrt1sG5eD8PmNl/view?usp=sharing
.. _`test sobre la introducción a CSS`: https://forms.gle/YUznititAny8dagi8
.. _`test sobre el modelo de caja de CSS`: https://forms.gle/PNmsNUSdrYMUsj5d9


Guía docente y normas del curso
-------------------------------

Estos son los materiales de clase de la asignatura Desarrollo de Aplicaciones en Internet, coordinada por el profesor `Juan Antonio Pérez Ortiz`_ (`@japer3z`_) de la Universitat d'Alacant. Para obtener información sobre la evaluación de la asignatura puedes consultar la `guía docente`_. Algunos aspectos adicionales que no están recogidos en la guía son los siguientes:

.. _`Juan Antonio Pérez Ortiz`: https://www.dlsi.ua.es/~japerez/
.. _`@japer3z`: https://twitter.com/japer3z
.. _`guía docente`: http://cv1.cpd.ua.es/ConsPlanesEstudio/cvFichaAsiEEES.asp?wCodEst=C203&wcodasi=34063&wLengua=C&scaca=2023-24

- La asistencia a prácticas es obligatoria, aunque se puede tener un máximo de 4 faltas no justificadas. Si tienes alguna ocupación que te impide asistir a todas o gran parte de las prácticas incluso online, envía un justificante escaneado al profesor a través del sistema de tutoría de UACloud. Para justificar una falta puntual, envía al profesor el justificante por una tutoría de UACloud. Cada falta no justificada por encima de las permitidas, restará una parte de la nota final de prácticas.
- La visita al profesor durante sus horas de tutoría no puede ser obligatoria por cuestiones normativas, pero es muy recomendable, ya que es la oportunidad de recibir supervisión sobre tus conocimientos de la materia o la calidad del código que has desarrollado. Reserva turno a través de UACloud con anterioridad tanto para un encuentro bien virtual bien presencial. Si el horario no es compatible con tu agenda, escribe al profesor e intentará encontrar un hueco fuera de dicho horario para atenderte.
- Las prácticas se realizan individualmente. Lee lo que se comenta más abajo sobre plagios. Si tienes alguna duda sobre si algo que estás haciendo puede considerarse plagio, consulta al profesor.
- No se prohíbe explícitamente el uso de asistentes basados en inteligencia artificial (Github Copilot, ChatGPT, etc.), pero ten en cuenta varios potenciales problemas: por un lado, tanto durante el examen teórico como durante el práctico no estará permitido utilizar ningún asistente ni local ni disponible online (no habrá acceso a internet); por otro lado, los asistentes son recomendables cuando uno domina la materia y quiere ahorrar tiempo, pero no cuando uno está aprendiendo, ya que pueden inducir a errores difíciles de detectar o generar código perfecto que no entendemos o no intentamos entender; por último, no es descartable que el código generado por tu asistente sea considerado como plagio al coincidir con el de otro compañero que usa asistentes en aspectos que no son triviales. 
- Cada una de las cuatro prácticas contribuye según lo indicado en la sección de prácticas a la nota final.
- Para acceder a Google Cloud Platform necesitarás tu `cuenta de correo electrónico de GCloud`_ con dominio ``@gcloud.ua.es`` de la que dispones como alumno de la Universitat d'Alacant. Asegúrate antes de la cuarta semana de clase de que la tienes activada entrando en la sección *Servicios externos* de UACloud.

.. _`cuenta de correo electrónico de GCloud`: https://si.ua.es/es/manuales/uacloud/uacloudse/servicios-externos.html

.. .. _`punto del mapa`: https://goo.gl/maps/hU5oJbA7yD82

Puedes encontrar algo de información adicional en las diapositivas usadas en la `presentación del curso`_.

.. _`presentación del curso`: ./slides/000-presentacion-curso.html

El `código fuente`_ de estas páginas, escrito en reStructuredText, está disponible en Github.

.. _`código fuente`: https://github.com/jaspock/dai2324

Puedes obtener una copia local de estas páginas (por ejemplo, para poder consultarlas sin conexión) ejecutando::

  wget --mirror --no-parent --convert-links --page-requisites https://jaspock.github.io/dai2324/index.html

Contenidos
----------

La asignatura aborda el estudio de las tecnologías de desarrollo de aplicaciones web, tanto desde el punto de vista del cliente como del servidor, pero enfatizando los elementos más fundamentales y evitando centrarnos en un framework concreto en la medida de lo posible. Los frameworks pueden llegar a ser tremendamente útiles y ahorrar mucho trabajo, pero suelen ocultar detalles de bajo nivel que son necesarios si queremos poder adaptarnos rápidamente a otros frameworks o utilizar elementos del desarrollo web no cubiertos por el framework en cuestión. Sin ánimo de polarizar el debate y reconociendo la utilidad de los frameworks, algunos desarrolladores han alertado de potenciales problemas (como el llamado *hype driven development*) con argumentos como los que puedes leer en `este tweet`.

.. _`este tweet`: https://x.com/JaimeObregon/status/1724726104311669150

Cómo compartir código con el profesor
-------------------------------------

Si quieres que el profesor pueda ayudarte con algún código que estás desarrollando, mandar un pantallazo no es la mejor opción. Envíale el código completo, por ejemplo, compartiendo con `su usuario`_ un repositorio privado de Github.

.. _`su usuario`: https://github.com/jaspock
.. _carrito: https://repl.it/@jaspock/Carrito


Recomendaciones
---------------

Este prefacio es un buen lugar para decir unas palabras sobre integridad profesional y ética académica. Durante este cuatrimestre, la carga de trabajo producida por esta y otras asignaturas puede hacer que en ocasiones te sientas desbordado por la faena pendiente. Esta situación también se producirá frecuentemente en el ámbito profesional para el que te estás formando. Es muy importante que afrontes esos momentos de presión con integridad. El Massachusetts Institute of Technology (MIT) da una `serie de recomendaciones`_ a sus estudiantes al respecto que es importante que leas. Este tipo de universidades suelen tener bien especificado los `procedimientos y sanciones`_ posibles en caso de fraude académico; también la Universitat d'Alacant tiene un reglamento_ al respecto, que probablemente ya conoces. Además, la `Ley 3/2022 de Convivencia Universitaria`_ impone sanciones importantes ante faltas de este tipo. Todos estos aspectos también has de tenerlos en cuenta en esta asignatura: se pueden discutir soluciones en equipo pero nunca compartir código.

.. _`serie de recomendaciones`: http://integrity.mit.edu/
.. _`procedimientos y sanciones`: http://web.mit.edu/policies/10/10.2.html
.. _reglamento: https://dma.ua.es/es/documentos/pdf/actuacion-ante-copia-en-pruebas-de-evaluacion-de-la-eps.pdf
.. _`Ley 3/2022 de Convivencia Universitaria`: https://www.boe.es/buscar/doc.php?id=BOE-A-2022-2978

Este es el momento también en el que enfatizar la importancia de tomar apuntes para poder preparar la asignatura con garantías. Las diapositivas, por ejemplo, solo contienen una parte de lo estudiado en clase. Por si se nos ha olvidado mencionarlo, también es muy aconsejable que acudas de vez en cuando a una tutoría presencial; usa antes para ello el sistema electrónico de solicitud de cita de UACloud.

Por otro lado, es importante señalar que los vídeos que se publiquen no pretenden ser una fuente de información que tengas que ver una y otra vez para asimilar la materia. El profesor te aconseja que los veas quizás un par de veces y que tomes apuntes que te permitan afrontar el visionado como una tarea activa y consultar luego la información de forma mucho más rápida y eficiente. Busca en fuentes fiables de internet o pregunta todas aquellas cosas que no te hayan quedado claras e incorpora también tus conclusiones a tus apuntes. A la hora de preparar el examen, puede ser interesante realizar un visionado adicional (probablemente a velocidad 1,5x) para refrescar ideas y asegurarte de que no se dice nada en los vídeos que no sepas ya por tus apuntes.

.. directiva obligatoria
.. toctree::
    :maxdepth: 2
    :caption: Contenidos:
    :numbered:

    marcado
    estilo
    cliente
    servicios
    componentes
    rest
    nube
    problemas
    practicas
   
.. >>> add new documents here
