
Implementación de servicios web
===============================

Al estudiar anteriormente los servicios web, nos hemos centrado en el acceso a servicios ofrecidos por terceros; en este tema veremos cómo crear nuestros propios servicios web. Abordaremos el estudio de la arquitectura de servicios conocida como REST (por el inglés, *representation state transfer*), en la que los agentes proporcionan una interfaz con una semántica uniforme (que, básicamente, se corresponde con las operaciones para crear, recuperar, actualizar y borrar recursos), en lugar de interfaces arbitrarias o específicas de una aplicación concreta. 

.. Important::

  Las habilidades que deberías adquirir con este tema incluyen las siguientes:

  - Entender los fundamentos de la arquitectura REST.
  - Implementar servicios web con Node.js mediante Express.
  - Entender la *política del mismo origen* y cómo superarla con la técnica CORS.
  - Desplegar en la nube una aplicación web.


.. _label-curl:

La arquitectura REST
--------------------

REST es una arquitectura para implementar servicios web sobre el protocolo HTTP que es usada actualmente por la gran mayoría de APIs web. Bajo REST los recursos se representan mediante URLs y las acciones a realizar con ellos se indican mediante los correspondientes verbos de HTTP (principalmente, GET, POST, PUT y DELETE). 

.. admonition:: Hazlo tú ahora
  :class: hazlotu

  En esta actividad vamos a explorar una API REST *de juguete* para gestionar carritos de la compra que se encuentra ya desplegada en la nube. Para acceder a la API vamos a usar ``curl``, un programa que permite realizar peticiones HTTP desde la línea de órdenes y observar la respuesta devuelta por el servidor. Ve probando en tu ordenador todos los pasos siguientes.
  
En primer lugar, vamos a asignar a una variable de entorno el URL base de la API::

  export endpoint=https://dai2223-japerez-a8845521.ey.r.appspot.com/carrito/v1

.. cambiar enlace a GAE en dos sitios de esta página

*Nota:* la sintaxis que seguiremos aquí para manejar variables de entorno es la usada en sistemas basados en Unix. Para otros sistemas operativos, la sintaxis podría ser ligeramente diferente.

El primer paso con la API del carrito suele ser obtener un identificador de carrito válido, lo que haremos con el verbo POST::

  curl --request POST --header 'content-type:application/json' -v $endpoint/creacarrito

La opción ``--request`` indica el verbo a usar y la opción ``--header`` sirve para identificar las cabeceras de la petición; en este caso, usamos la cabecera ``content-type`` que se usa para indicar al servidor en qué formato (JSON, en este caso) queremos recibir los datos de la respuesta; el servidor podría ignorar nuestra solicitud si no soportara dicho formato, lo que no es el caso. Finalmente, la opción ``--v`` hace que ``curl`` muestre información más detallada sobre la petición y la respuesta. La petición anterior nos devolverá en formato JSON el nombre del carrito recién creado en el atributo ``result.nombre``. Asigna dicho valor (por ejemplo, ``fada6``) a la variable de entorno ``carrito``::

  carrito=fada6

Ten en cuenta que si ningún cliente ha realizado una petición a la API en los últimos minutos, la primera respuesta puede tardar unos segundos en producirse mientras se despierta el servidor. Vamos a añadir ahora un item al carrito. Para ello usamos el verbo POST sobre la ruta ``$endpoint/$carrito/productos``; los datos del nuevo item los pasaremos en JSON dentro del cuerpo (*payload*) del mensaje, al que damos valor con la opción ``--data`` de ``curl``::

  curl --request POST --data '{"item":"queso","cantidad":1}' --header 'content-type:application/json' $endpoint/$carrito/productos

El servidor nos devuelve un resultado en JSON con dos atributos, ``result`` y ``error``; el primero contiene información adicional si la petición pudo satisfacerse (el código de estado es 200 en ese caso); el atributo ``error`` contiene mas información sobre el error en caso de haberse producido (el código de estado es 404 en ese caso); si no procede dar valor a ``result`` o ``error``, estos atributos tomarán el valor ``null``. Vamos a añadir otro item al carrito::

  curl --request POST --data '{"item":"leche","cantidad":4}' --header 'content-type:application/json' $endpoint/$carrito/productos

Para obtener la composición de un carrito, usaremos el verbo GET::

  curl --request GET --header 'content-type:application/json' $endpoint/$carrito/productos

Obtendremos una respuesta como la siguiente::

  {
    "result": [{"item":"queso","cantidad":1},
               {"item":"leche","cantidad":4}],
    "error":null
  }

Para modificar la cantidad de un item ya existente en el carrito, usaremos la acción PUT e indicaremos la nueva cantidad en JSON en el bloque de datos::

  curl --request PUT --data '{"cantidad":2}' --header 'content-type:application/json' $endpoint/$carrito/productos/queso

Comprobamos que el carrito ha sido actualizado con la nueva cantidad::

  curl --request GET --header 'content-type:application/json' $endpoint/$carrito/productos/queso

Finalmente, podemos borrar un producto con la acción DELETE:: 

  curl --request DELETE --header 'content-type:application/json' $endpoint/$carrito/productos/queso
  curl --request DELETE --header 'content-type:application/json' $endpoint/$carrito/productos/queso

Con la segunda petición, el servidor devolverá un error indicando que el producto no existe.

Si quisiéramos añadir un nuevo item cuyo nombre lleve algún carácter especial (por ejemplo, la vocal con tilde de *jamón*), lo podemos hacer como en los casos anteriores::

  curl --request POST --data '{"item":"jamón","cantidad":2}' --header 'content-type:application/json' $endpoint/$carrito/productos

Pero a la hora de hacer una petición en la que el nombre del item forme parte del URL (y no del bloque de datos), es necesario convertir los caracteres especiales a aquellos que puedan formar parte de un URL a través de lo que se conoce como `codificación por ciento`_ (*percent-encoding*)::

  curl --request PUT --data '{"cantidad":5}' --header 'content-type:application/json' $endpoint/$carrito/productos/jam%C3%B3n

En JavaScript tenemos funciones como ``decodeURIComponent``, ``decodeURI``, ``encodeURIComponent`` y ``encodeURI`` que se encargan del trabajo de conversión. Para codificar un símbolo para el programa ``curl`` que se ejecuta en la línea de órdenes podemos usar `herramientas en línea`_.

.. _`codificación por ciento`: https://developer.mozilla.org/en-US/docs/Glossary/percent-encoding
.. _`herramientas en línea`: https://meyerweb.com/eric/tools/dencoder/


.. _label-cliente-rest:

Envío de peticiones desde JavaScript
------------------------------------

Ahora vamos a ver cómo interactuar con la API del carrito desde JavaScript (en concreto, usando la API Fetch que hemos estudiado antes) por medio de una aplicación web de `gestión de carritos de la compra`_. Abre las DevTools de Google Chrome y estudia cada una de las peticiones Fetch realizadas por la aplicación. El código de este cliente de la API es el siguiente, que apenas incorpora novedades:

.. literalinclude:: ../../code/carrito/public/carrito.html
  :language: html
  :linenos:

.. _`gestión de carritos de la compra`: https://dai2223-japerez-a8845521.ey.r.appspot.com/carrito.html

.. cambiar enlace a GAE en dos sitios de esta página

El código anterior muestra cómo hacer con ``fetch`` peticiones con verbos de HTTP diferentes a ``GET``, y que incluyen información tanto en las cabeceras como en el bloque de datos (*payload*).


.. _label-servidor-rest:

Programación de servicios web en Node.js
----------------------------------------

Los servicios web se pueden programar en prácticamente cualquier lenguaje de programación existente hoy día. Para implementar el servicio web al que hemos accedido desde el cliente mostrado en la actividad anterior hemos usado JavaScript con Node.js y el *framework* para desarrollo de aplicaciones web Express.js_. Lo siguiente es el código de la parte del servidor. Más abajo, después del código, se comentan sus principales elementos.

.. _Express.js: https://expressjs.com/

.. literalinclude:: ../../code/carrito/app.js
  :language: javascript
  :linenos:

Express es un *módulo* de Node.js que permite definir APIs de forma sencilla. La función de Node.js ``require`` carga un módulo (de forma similar a los *import* o *include* de otros lenguajes) y devuelve un objeto que representa los elementos que exporte el módulo. 

.. Note::

  En este caso, Express exporta una función de inicialización que permite usar el resto de funciones. El código de Express contendrá unas líneas similares a estas:

  .. code-block:: javascript 
    
    module.exports = createApplication;

    function createApplication() {
      ...
      var app= ...
      app.init();
      return app;
    }


El código registra o enlaza (llamando a ``app.use``) varias *funciones de middleware*, que serán invocadas incondicionalmente por el *framework* secuencialmente (en el orden en que aparecen en el código) para cada petición y que se encargan de diversos aspectos: 

- el *middleware* ``express.json``, ya incluido en Express, analiza el JSON de los bloques de datos de las peticiones y crea el objeto de JavaScript correspondientes en ``req.body``;
- el resto de funciones de *middleware* que se registran en este código llamando a ``app.use`` las definimos nosotros: la primera de ellas descodifica los caracteres que usen la notación *por ciento* (véase una actividad anterior en este tema); la siguiente añade a la respuesta las cabeceras necesarias para permitir peticiones CORS (como veremos más adelante); la última establece la conexión con el gestor de base de datos (como se comenta más abajo).

Todas estas funciones de *middleware* son llamadas por Express con tres parámetros convenientemente inicializados: un objeto que representa la solicitud (llamado ``req`` en nuestro código), un objeto que representa la respuesta que se devolverá al cliente (``res`` en el código) y un objeto que representa la siguiente función de *middleware* (``next`` en el código); cada función de *middleware* ejecuta un determinado código (que normalmente consultará o modificará los objetos ``req`` o ``res``) y llama a la siguiente función de *middleware*, excepto cuando se desea acabar inmediatamente el ciclo petición-respuesta y mandar una respuesta al cliente con la función ``res.send`` (porque la respuesta está lista o porque se detecta algún error como ocurre en la función ``creaEsquema``). La siguiente función de *middleware* recibirá sendas referencias a los mismos objetos de solicitud y respuesta que la actual función puede haber modificado. Aunque es más habitual ir modificando el objeto de la respuesta (con valores que finalmente se devolverán al cliente), en ocasiones puede ser de interés modificar datos de la petición (como en nuestra función de *middleware* que descodifica la URL).

El código principal de la aplicación está formado por una serie de llamadas a los métodos ``get``, ``post``, ``put`` y ``delete``, que registran o enlazan funciones de *middleware* adicionales sobre el objeto de la aplicación; estas funciones se conocen también como funciones *manejadoras* o de *callback*, y definen el *enrutamiento* vinculado con las peticiones en función de su verbo y su URL. Cada petición se realiza con un verbo de HTTP y un URL concreto (a la combinación de ambos se le conoce como *endpoint*). Estas funciones de *middleware*, por tanto, no se ejecutan sistemáticamente para cada petición, sino solo cuando la URL y el verbo de la petición casan con el método y ruta indicados.


.. Note::

  Express añade automáticamente algunas cabeceras a la respuesta. Por ejemplo, si usamos un objeto de JavaScript como argumento de la llamada a ``send``, los datos se convierten a JSON y la cabecera ``Content-Type`` se establece a ``application/json; charset=utf-8``.

Los diferentes métodos de enrutamiento permiten indicar la ruta del recurso como, por ejemplo, ``/:carrito/productos``. Observa cómo una subcadena del URL que comienza por el carácter de dos puntos (por ejemplo, ``:item``) no se interpreta literalmente, sino que la subcadena real puesta en el URL de la llamada se usa para dar valor a un atributo del objeto ``req.params`` ( en ese caso, ``req.params.item``). A los atributos de los datos en JSON que aparecen en el bloque de datos (*payload*) de la petición nos podemos referir mediante el objeto ``req.body``, como ya hemos comentado. A los atributos pasados en el propio URL tras el carácter de interrogación se puede acceder mediante el objeto ``req.query``.

Si una función de *middleware* no va a llamar a otra función de *middleware* posterior (porque devuelve la respuesta al servidor usualmente), no es necesario que declare el tercer parámetro (el que hemos llamado ``next`` en otros sitios de nuestro código) en la lista de parámetros del manejador.


.. Attention::

  Ten en cuenta que el orden en que se registran las funciones de *middleware* es relevante porque define el orden en que Express las irá llamando. Si el URL de una petición casa con dos rutas registradas (por ejemplo, el URL ``/listado/clientes`` casa tanto con ``/:id/clientes`` como con ``/listado/:id``), pero en la función de *middleware* de la primera no se llama a ``next``, entonces la segunda función de *middleware* no será invocada. Express invoca únicamente a la primera función de *middleware* válida; si se invocan más funciones es porque cada una llama a la siguiente a través del tercer parámetro.

.. Note::

  La función de *middleware* ``express.static``, ya definida en el *framework*, permite indicar un directorio que contiene recursos estáticos (una imagen o una hoja de estilo, por ejemplo) a los que puede acceder el cliente. En nuestro código se llama a ``app.use`` para vincular dicha función a la ruta raíz y poder servir desde ella los archivos incluidos en la carpeta ``public``. El argumento de ``express.static`` se interpreta, por defecto, como un directorio relativo al directorio actual. Normalmente nos interesará especificar la ruta absoluta, lo que se consigue añadiéndole como prefijo el contenido de la variable global de Node.js ``__dirname``, que contiene la ruta absoluta del fichero de JavaScript que se está ejecutando.   

Interfaz común de acceso a bases de datos
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Como queremos que nuestra aplicación web pueda funcionar en distintas plataformas y estas usan distintos gestores de bases de datos (por ejemplo, el proveedor Heroku incluye un servicio basado en PostgreSQL, Google Cloud Platform permite usar MySQL, y en modo local vamos a usar una base de datos *ligera* mediante SQLite para hacer pruebas), nos interesa no tener que escribir código diferente para cada sistema de base de datos. Node.js no tiene un equivalente exacto a, por ejemplo, la tecnología JDBC de Java, pero el paquete Knex.js_ (pronunciado como *konnex*) se acerca bastante al permitirnos interactuar con diferentes gestores de bases de datos con una interfaz única. Con Knex.js usaremos funciones para construir las consultas a la base de datos que serán transformadas internamente en instrucciones SQL; las peticiones a la base de datos son asíncronas y se gestionan mediante promesas o mediante *callbacks*. Las funciones que a este respecto se usan en el código son bastante autoexplicativas y es muy sencillo deducir cuál es su transformación en SQL. Por ejemplo, las líneas de código:

.. _Knex.js: http://knexjs.org/

.. code-block:: javascript

  let i= await knex('productos').select(['item','cantidad'])
                                .where('carrito',req.params.carrito)
                                .andWhere('item',req.params.item);

generan una petición SQL como la siguiente::

  select `item`, `cantidad` from `productos` where `carrito` = ? and `item` = ?

Knex.js realiza las consultas a la base de datos de forma asíncrona de manera que nuestro código pueda seguir ejecutándose mientras el gestor de bases de datos devuelve un resultado. Por ello, la mayoría de métodos que invoquemos (como ``select`` en el fragmento anterior) devolverán una promesa; pero si es así, ¿dónde está la llamada al método ``then`` correspondiente?  
El pequeño fragmento de código anterior y el código completo del servidor de esta actividad usan una palabra reservada de JavaScript (``await``) que no conocíamos. Vamos a ver a continuación, como por medio de ella podemos simplificar la escritura de código que usa promesas y se hace innecesario el uso de los métodos ``then`` y ``catch``.

Async/await
~~~~~~~~~~~

Las promesas de la API Fetch son, como hemos visto, una forma muy conveniente de gestionar peticiones a un servidor, pero cuando la llamada a un servicio web depende del resultado de una llamada anterior a otro servicio web y este anidamiento se va haciendo más y más complejo, la escritura del código puede ser dificultosa y afectar negativamente a su legibilidad. Para simplificarlo, entre otros motivos, se añadieron a JavaScript los modificadores ``async`` y ``await``. 

Una función anotada con ``async`` siempre devuelve una promesa. Si la función ya devuelve una promesa, el intérprete no tiene más que hacer. Si devuelve otro tipo de valor, el intérprete crea una promesa que se resuelve (se cumple) directamente con el valor devuelto. Si la función asíncrona lanza una excepción, esta se envuelve en una promesa incumplida. 

Observa cómo la siguiente función devuelve una promesa:

.. code-block:: javascript
  :linenos:

  async function foo() {
    return 1;
  }

  foo().then(console.log); // imprime 1

.. Note::

  Asegúrate de que entiendes por qué en el código anterior ``foo().then(console.log)`` es una versión más corta que la equivalente ``foo().then(x => console.log(x))``.

Dentro de una función asíncrona pueden aparecer cualquier número de expresiones ``await`` (estas expresiones, de hecho, solo pueden aparecer dentro de funciones ``async``). Una expresión ``await`` va seguida de un objeto de tipo promesa; al llegar a ella el intérprete de JavaScript pausa la ejecución de la función asíncrona y espera a que la promesa se resuelva para continuar con la ejecución. Mientras tanto, otras funciones que estén esperando en la cola de *callbacks* serán atendidas como procede. El uso de ``async``, por tanto, constituye una sintaxis alternativa, más elegante y legible, al uso de ``promesa.then``.

El código que vimos que accedía con Fetch a la API de películas del Studio Ghibli quedaría de la siguiente manera con  ``async`` y ``await``:

.. code-block:: javascript
  :linenos:
  :force:

  async function ghibli() {
    let s= "";
    try {
      let response= await fetch('https://ghibliapi.herokuapp.com/films/');
      if (!response.ok) {
        throw new Error(response.statusText);
      }
      let responseAsObject= await response.json();
      for (var i=0; i<responseAsObject.length;i++) {
        s+= responseAsObject[i].title+"; ";
      }
      return s;
    } catch(error) {
      console.log('Ha habido un problema: ', error);
    }
    return s;
  }

  async function print() {
    var resultado= document.querySelector("#results");
    resultado.textContent= await ghibli();
  }

  print();


Si una promesa se cumple, entonces ``await promesa`` devuelve el resultado (que aquí asignamos a las variables ``response`` y ``responseAsObject``). Si la promesa no se cumple, se lanzará automáticamente una excepción en ese punto que podremos capturar dentro de un bloque ``try..catch``; en el ejemplo anterior hay tres posibles motivos por los que se puede terminar ejecutando el código del bloque ``catch``: la excepción lanzada explícitamente con ``throw`` y los incumplimientos de las promesas de ``fetch`` (cuando no se puede conectar con el servidor) o de ``json`` (cuando el bloque de datos de la respuesta del servidor no puede convertirse en un objeto de JavaScript).

Volviendo al código que usa Knex.js, las siguientes dos líneas de código son equivalentes, pero la segunda sintaxis nos permitirá escribir código más limpio cuando tengamos consultas encadenadas a la base de datos (como ocurre en muchos puntos de la API del carrito):

.. code-block:: javascript
  :linenos:
  :force:

  knex.table('users').first('id', 'name').then(function(row) {console.log(row);});
  
  console.log(await knex.table('users').first('id', 'name'))

.. admonition:: Hazlo tú ahora
  :class: hazlotu

  Tras analizar y entender el código anterior, tanto el del lado del cliente como el del servidor, estudia el vídeo en el que se realiza una traza de su ejecución: `parte 1-1`_.

  .. _`parte 1-1`: https://drive.google.com/file/d/1pT44L_aoi9rOLPBK5ItJweSOPO4JcFYP/view?usp=sharing


.. _label-local:

Configuración del entorno de trabajo para ejecutar localmente una aplicación web
--------------------------------------------------------------------------------

En esta actividad se explica cómo configurar el entorno de trabajo para poder lanzar aplicaciones web escritas en Node.js que usan una base de datos SQLite3. Se ofrecen dos vías: una rápida que permite instalar todos los programas necesarios con un *script* para Linux y otra que requiere ir instalándolos uno a uno. 

Instalación rápida en Linux
~~~~~~~~~~~~~~~~~~~~~~~~~~~

El sistema operativo *oficial* en esta asignatura es Linux. Puedes utilizar otros sistemas operativos para desarrollar, pero tendrás que solucionar tú mismo los problemas relacionados con la configuración del entorno de trabajo que te encuentres. Las instrucciones que siguen son para el sistema operativo Linux, pero es muy probable que las puedas ignorar si usas el fichero `dai-bundle-dev`_ para instalar los programas necesarios. Para ello, descarga el fichero, descomprímelo y ejecuta el script ``install.sh``. 

Puedes editar el fichero para indicar qué programas quieres instalar. El script solo instala Node.js por defecto. Comprueba si tienes instalado ``sqlite3`` en tu ordenador para saber si lo necesitas y pon a ``true`` la variable correspondiente en caso negativo. El script también permite instalar el SDK de Google Cloud Platform, que usaremos más adelante.

El script, además, funciona sin problemas en el sistema Linux instalado en los ordenadores de los laboratorios, donde SQLite3 ya está instalado.

.. _`dai-bundle-dev`: https://www.dlsi.ua.es/~japerez/cursos/dai/dai-bundle-dev-20211005.tar.gz

Si todo ha ido bien, puedes saltar el siguiente apartado y pasar a ejecutar directamente la aplicación del carrito como se comenta en ":ref:`label-prueba-carrito`".

Instalación paso a paso
~~~~~~~~~~~~~~~~~~~~~~~

Comienza instalando `Node.js`_, el entorno que te permitirá ejecutar programas en JavaScript fuera del navegador. Las instrucciones para cada sistema operativo son diferentes. Para el caso de Linux, la instalación se puede realizar fácilmente sin necesidad de tener privilegios de administrador descargando uno de los `paquetes disponibles`_ en la web de Node.js.

.. _`Node.js`: https://nodejs.org/
.. _`paquetes disponibles`: https://nodejs.org/en/download/releases/

.. Note::

  Si tu distribución de Linux tiene ya instalada una versión muy antigua de Node.js es recomendable que la quites antes de tu sistema con::

    sudo apt-get remove nodejs

Este curso vamos a usar la versión 14 de Node.js. Descárgala con::

  curl -O https://nodejs.org/download/release/v14.18.0/node-v14.18.0-linux-x64.tar.gz

Descomprime el fichero anterior en tu directorio raíz::

  tar xzf node-v14.18.0-linux-x64.tar.gz -C $HOME

Añade el directorio ``bin`` a la variable ``PATH`` del sistema::

  echo 'export PATH=$HOME/node-v14.18.0-linux-x64/bin:$PATH' >> $HOME/.bashrc

Abre un nuevo terminal para que el nuevo valor de la variable de entorno ``PATH`` se aplique. Ahora deberías poder ver la versión de Node.js instalada con::

  node -v

La aplicación del carrito usa en modo local el gestor de base de datos *ligero* `SQLite3`_ para no depender de gestores más complejos. Cuando la aplicación se despliegue en la nube (un poco más adelante lo haremos en Google Cloud Platform), usará otros gestores de bases de datos, lo que explica las diferentes opciones dentro de la función ``conectaBD``. Comprueba si ya tienes SQLite instalado ejecutando ``sqlite3`` desde la línea de órdenes. Si no lo tienes, para el caso de Linux puedes descargar este fichero::

  curl -O https://www.sqlite.org/2019/sqlite-tools-linux-x86-3300100.zip

.. _`SQLite3`: https://www.sqlite.org/index.html

Descomprime el fichero anterior en tu directorio raíz y añade el nuevo directorio a la variable ``PATH`` del sistema::

  unzip -q sqlite-tools-linux-x86-3300100.zip -d $HOME
  echo 'export PATH=$HOME/sqlite-tools-linux-x86-3300100:$PATH' >> $HOME/.bashrc

Abre un nuevo terminal para que el nuevo valor de la variable de entorno ``PATH`` se aplique. 

Los binarios de SQLite están compilados para 32 bits, por lo que es posible que necesites instalar algunas librerías adicionales de 32 bits, ya que tu sistema es proablemente de 64 bits; la siguiente orden es para Ubuntu::

  sudo apt-get install libc6-i386 lib32z1

Ahora deberías poder ver la versión de SQLite3 instalada con::

  sqlite3 -version


.. _label-prueba-carrito:

Prueba de la aplicación del carrito
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

A continuación, descarga el código del cliente y del servidor de la aplicación del carrito; clona para ello el repositorio de la asignatura haciendo::

  git clone https://github.com/jaspock/dai2223.git

Entra en el directorio ``code/carrito`` y ejecuta::

  npm install
  node app.js

La primera línea instala en la carpeta ``node_modules`` todas las dependencias indicadas en el fichero ``package.json``. La segunda línea lanza el motor de JavaScript sobre el fichero indicado. Como este fichero contiene una aplicación web escrita con el framework Express, este la ejecuta sobre un puerto local, por lo que podremos acceder a ella abriendo en el navegador una dirección como ``localhost:5000`` o similar. 

.. Note::

  Si quisieras usar un nuevo paquete en tu aplicación (lo que probablemente no ocurrirá en esta asignatura), deberías ejecutar::

    npm install paquete

  donde ``paquete`` es el nombre del nuevo módulo; esta orden instala el nuevo módulo en la carpeta ``node_modules`` y, además, añade la línea adecuada al fichero ``package.json``.

.. Note::

  Observa la sección ``scripts`` del fichero ``package.json``. Allí puedes definir diversas maneras de arrancar tu aplicación con diferentes configuraciones. En este caso, solo hay una entrada ``start`` que te permitiría lanzar también tu aplicación haciendo::

    npm start

Depuración y prueba de la aplicación
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Si deseas depurar el código del servidor en modo local puedes usar el editor de texto `Visual Studio Code`_. Abre con él el fichero ``app.js`` y selecciona :guilabel:`Run / Start debugging`. Puedes definir puntos de ruptura haciendo click en el borde de la línea de código oportuna.

  .. _`Visual Studio Code`: https://code.visualstudio.com/

Suele ser útil también poder ver un informe detallado de qué rutas puede procesar Express y qué hace con cada petición que llega; para ello puedes lanzar el servidor en modo depuración en Linux con::

  DEBUG=express:* node app.js

Para depurar la aplicación cuando esta se encuentra desplegada en la nube, se necesitan algunas instrucciones adicionales. En el caso de nuestra aplicación, como el código que se ejecuta en ``localhost`` o en la nube es prácticamente el mismo, si la aplicación funciona en local, apenas deberían aparecer problemas en la nube.

.. Note::

  Ten en cuenta que el código de JavaScript que se ejecuta en el navegador se seguirá depurando desde las Chrome DevTools. Durante la depuración de la aplicación irás alternando entre el navegador y Visual Studio Code según se esté ejecutando el código del lado del cliente o del servidor, respectivamente.

Al ejecutar la aplicación en modo local se usa el gestor de base de datos SQLite, que almacena la base de datos en un fichero indicado como opción de inicialización a Knex.js (en nuestra aplicación el fichero se indica en ``config.js``). Si quieres borrar toda la base de datos para empezar de cero, basta con que borres ese fichero, que será creado de nuevo la siguiente vez que Knex.js quiera acceder a él.

Si quieres, realizar consultas a la base de datos local desde un cliente de SQL puedes hacer desde la línea de órdenes::

  sqlite3 <ficheroBD>
  
donde has de indicar como argumento el nombre del fichero de la base de datos (si no has editado los ficheros de configuración del carrito se llamará ``midb.sqlite``). Desde dentro del cliente puedes ejecutar instrucciones como::

  .tables
  
para ver las tablas de la base de datos o::

  select * from productos;

para consultarlas.

Por último, si añades a la inicialización de Knex.js la propiedad ``debug:true`` se mostrará el equivalente en SQL de cada operación realizada con la librería.

.. _label-api-cambio:

Modificación de la API REST
---------------------------

En esta actividad, vas a realizar una pequeña modificación de la API del carrito y de la aplicación web que la utiliza. El desarrollo lo realizarás en tu máquina y, cuando hayas comprobado que todo funciona correctamente, lo subirás en la siguiente actividad a un servidor de aplicaciones en la nube.

.. Hint::

  Si vas a desarrollar frecuentemente con Node.js, te vendrá bien utilizar la herramienta `nodemon`_, que evita que tengas que matar y volver a lanzar el servidor local cada vez que hagas un cambio en la aplicación.

  .. _`nodemon`: https://www.npmjs.com/package/nodemon


  Para utilizar ``nodemon`` mientras depuras desde Visual Studio Code, has de instalar globalmente el programa con ``npm install -g nodemon``. A continuación, abre desde el editor de texto el directorio donde se almacena la aplicación web y abre el código del servidor. En la vista de :guilabel:`Run` de la izquierda, pincha en :guilabel:`create a launch.json file` y selecciona el entorno Node.js. En el fichero ``launch.json`` que se te abre, pulsa el botón :guilabel:`Add configuration...` y selecciona :guilabel:`Node.js: Nodemon setup` y graba el fichero. Finalmente, en el menú desplegable de la parte superior de la vista :guilabel:`Run` escoge :guilabel:`nodemon` y lanza la aplicación en modo depuración desde el menú :guilabel:`Run`. 


.. admonition:: Hazlo tú ahora
  :class: hazlotu

  Modifica la parte del cliente y del servidor de la aplicación del carrito para que junto con la cantidad se pueda añadir el precio unitario de cada item. Necesitarás instalar en tu sistema Node.js y el gestor de base de datos SQLite3; sigue para ello los pasos detallados en la actividad ":ref:`label-local`". Salvo que uses ``nodemon``, como se ha comentado antes, tendrás que matar y relanzar el servidor para que se apliquen los cambios. Como siempre, tendrás que recargar la página en el navegador siempre que realices algún cambio en el código del cliente.


.. _label-gcp-deploy:

Despliegue básico de la aplicación web en Google App Engine con persistencia limitada vía SQLite3
-------------------------------------------------------------------------------------------------

Cuando tengas la aplicación lista en modo local, puedes desplegarla en la nube de Google Cloud Platform (en concreto, en el servicio Google App Engine) como sigue. De momento lo haremos usando ``SQLite3`` como gestor de base de datos, pero más adelante cambiaremos a ``MySQL``. El inconveniente principal de usar ``SQLite3`` es que la base de datos se almacena en un fichero local que se borrará cada vez que se reinicie la máquina virtual. Cuando pasa un tiempo sin atender ninguna petición, por ejemplo, la máquina se elimina, por lo que no podemos confiar en este enfoque para una aplicación real.

Configura en primer lugar la aplicación de la línea de órdenes ``gcloud`` tal como se explica en el apartado ":ref:`label-gcloud`". A continuación, colócate en el directorio de la aplicación del carrito, asegúrate de que la variable ``CARRITO_ENV`` tiene el valor ``gaesqlite3`` en el fichero ``app.yaml`` y ejecuta::

  gcloud app deploy
  gcloud app browse

Se abrirá en tu navegador la página correspondiente.


.. _label-cors:

La política del mismo origen y el estándar CORS
-----------------------------------------------

Todos los navegadores implementan una restricción conocida como *política del mismo origen* (en inglés, *same-origin policy*), un concepto de seguridad existente desde la época de Netscape 2.0 para peticiones basadas en XHR o en la API Fetch. Esta política impide por defecto que desde un script bajado de un determinado servidor se realicen peticiones a servicios web disponibles en un servidor con un dominio diferente. Permitir este tipo de accesos abre la puerta a toda una serie de potenciales problemas: por ejemplo, *MaliciousSite.com* usa los servicios web de la web de *MyBank.com* (en la que el usuario tiene sesión abierta en otra pestaña del navegador) para obtener información confidencial; los servicios web de *MyBank.com* devuelven la información solicitada porque el usuario está autenticado y la *cookie* de autenticación es enviada por el navegador junto con la petición; el script con origen *MaliciousSite.com* puede ahora compartir esta información con otros servidores.

Si la política del mismo origen no pudiera evitarse, muchas aplicaciones web que usan servicios web *de terceros* desde el cliente no podrían existir o deberían implementar un *proxy* a dichos servicios web en su propio servidor (es decir, el cliente realizaría una petición a su servidor y desde este, donde ya no existe la restricción del mismo origen al no haber navegador ni riesgos, se realizaría la petición al servidor de terceros). Por ello, los navegadores permiten bajo determinadas condiciones que estos accesos puedan realizarse. En particular, la técnica estándar CORS (*cross-origin resource sharing*) utiliza la cabecera ``Origin`` (que es añadida por el navegador y no puede modificarse desde JavaScript) en la petición para informar al servidor del origen del código que está haciendo la solicitud. El servidor puede autorizar o denegar entonces el acceso añadiendo a la respuesta un valor adecuado en la cabecera ``Access-Control-Allow-Origin``; si el valor de esta última cabecera en la respuesta coincide con el valor de ``Origin`` en la petición o si toma un valor como `*`, entonces el navegador autoriza el acceso. 

.. Note::

  Para algunos tipos de peticiones, como las de tipo PUT o DELETE y, en ocasiones, dependiendo de las cabeceras empleadas, también GET o POST, el navegador realiza (no entraremos a analizar los motivos, aunque tienen que ver con no hacer que el servidor modifique su estado ante una petición que no se va a aceptar) una comunicación previa con el servidor (usando el verbo *OPTIONS*) para realizar algunas comprobaciones *pre-vuelo* (*pre-flight*). En esta petición, el navegador añade, además, de ``Origin``, la cabecera ``Access-Control-Request-Method`` con el verbo para el que se desea realizar la petición posterior y ``Access-Control-Request-Headers`` con las cabeceras que se emplearán en dicha petición. El servidor contesta incluyendo en la respuesta las cabeceras ``Access-Control-Allow-Origin``, ``Access-Control-Allow-Methods`` (verbos admitidos, en forma de lista de verbos separados por comas) y ``Access-Control-Allow-Headers`` (cabeceras de HTTP admitidas); si los valores permitidos son compatibles con la petición a realizar, esta se lleva finalmente a cabo por parte del navegador.

Aunque no es fácil engañar al servidor modificando el valor enviado por el navegador en la cabecera ``Origin``, debe tenerse en cuenta que el propósito de CORS no es el de hacer un sitio web más seguro; si el servidor devuelve datos privados, es necesario usar *cookies* o *tokens de validación*, por ejemplo.

.. admonition:: Hazlo tú ahora
  :class: hazlotu

  En una actividad anterior tienes un ejemplo de acceso a un servicio (el de información sobre las películas del estudio Ghibli) que usa CORS. Estúdialo con ayuda de las herramientas para desarrolladores del navegador comprobando las cabeceras. Estudia también una petición vía Fetch a un servidor que no soporte CORS, como el de `esta API`_ de días festivos_.

  .. _`esta API`: https://date.nager.at/Home/Api
  .. _festivos: http://date.nager.at/api/v1/get/ES/2020


.. Important::

  Finalmente, es importante resaltar que estas restricciones afectan a los servicios web a los que se intenta acceder desde un navegador. Una aplicación de escritorio o un programa ejecutándose en un servidor no tienen estas restricciones.


Peticiones CORS
~~~~~~~~~~~~~~~

.. admonition:: Hazlo tú ahora
  :class: hazlotu

  La API REST del carrito soporta peticiones Fetch realizadas desde programas en JavaScript descargados de dominios diferentes al dominio en el que está ubicada la API. Para comprobarlo, abre el fichero ``carrito.html`` desde un servidor web local; recuerda cambiar antes la variable ``base`` de JavaScript para que apunte al correspondiente *endpoint* de la API que se está ejecutando en otro puerto u otro servidor en la nube. Estudia el *middleware* del código del servidor que gestiona la respuesta.
  
Para lanzar el cliente desde un servidor web local, si tienes Python 2 instalado, ejecuta desde el directorio donde está ``carrito.html`` una de las dos siguientes órdenes::

  python -m SimpleHttpServer
  python2 -m SimpleHttpServer

Si tienes Python 3 instalado en tu sistema, ejecuta desde el directorio donde está ``carrito.html`` una de las dos siguientes órdenes::

  python -m http.server
  python3 -m http.server

El servidor te informará del puerto en ``localhost`` desde el que puedes acceder al contenido del directorio. Realiza peticiones desde la aplicación web del carrito y analiza las cabeceras relacionadas con CORS de la petición y la respuesta. Observa cómo las peticiones de tipo GET, POST, PUT o DELETE realizan aquí una comprobación *pre-vuelo* con el verbo OPTIONS. Modifica el cliente para que envíe una cabecera adicional no convencional como ``Authorization`` y observa cómo la respuesta del servidor hace que la petición falle al no devolver el servidor el nombre de la cabecera en la lista devuelta en ``Access-Control-Allow-Headers``.


.. _label-signin:

Autenticación de usuarios
-------------------------

Una componente importante de la mayoría de aplicaciones web es la que permite que los usuarios se identifiquen o autentiquen en la aplicación y puedan gestionar así sus propios datos. La gestión de cuentas de usuario requiere un esfuerzo adicional (validación de cuentas de correo electrónico, almacenamiento seguro de las contraseñas, gestión de ataques cibernéticos, olvidos de contraseña, etc.) que podemos delegar en servicios de terceros como Facebook Login o Sign In with Google for Web; este último será el que usaremos en esta actividad. De esta forma, el usuario se identifica en una ventana del navegador vinculada a un URL de Google y autoriza a nuestra aplicación a acceder a cierta información de su perfil (nombre y correo electrónico, por ejemplo) sin compartir el resto de sus datos (o permitiendo el acceso a un subconjunto de ellos, como, por ejemplo, los ficheros almacenados en una carpeta de Google Drive).

.. Note::

  Esta actividad solo es necesaria este curso si vas a implementar la parte de la práctica 4 relacionada con la identificación de usuarios. Si no es así, puedes ignorar el resto, salvo que tengas curiosidad en aprender cómo se hace.

El primer paso para que una aplicación pueda acceder al servicio de identificación de Sign In with Google for Web es obtener las credenciales adecuadas que nos permitan obtener el *id del cliente*, una secuencia de caracteres que necesitamos para poder identificar unívocamente al usuario desde el código JavaScript del navegador y desde el código en Node.js del servidor. Para ello accede en la consola web de Google Cloud Platform a la opción :guilabel:`Credenciales` dentro del menú :guilabel:`APIs y servicios`. Elige crear una credencial de tipo :guilabel:`ID de cliente de OAuth`. Serás redirigido en primer lugar a la configuración de la pantalla de consentimiento de OAuth: indica como usuarios objetivo a usuarios *externos* y luego aporta solo los datos obligatorios (nombre de la aplicación y tu dirección de correo electrónico de ``gcloud.ua.es``). De vuelto a la pantalla de credenciales, elige de nuevo crear una credencial de tipo :guilabel:`ID de cliente de OAuth`. En la nueva pantalla, escoge *web* como tipo de aplicación, introduce un nombre para la aplicación, y en :guilabel:`Orígenes de JavaScript autorizados` indica los URLs desde los que harás peticiones: normalmente, indicarás un URL del tipo ``http://localhost:5000`` para cuando la aplicación se lance en local (importante: en este caso, has de indicar un segundo URL sin el puerto, es decir, ``http://localhost``) y uno del tipo ``https://proyecto-10002.appspot.com/`` para cuando se despliegue en un servidor en la nube. No has de indicar nada en la sección :guilabel:`URIs de redirección autorizados`. Con esta información, ya podrás obtener el *id del cliente*.

A continuación se describe una aplicación sencilla que permite que el usuario se identifique en el navegador con su cuenta de Google. La aplicación está en la carpeta ``code/gsignin`` del repositorio de la asignatura. Tras la autenticación, el código puede obtener una serie de datos del usuario que ayuden a identificarlo entre los que es especialmente relevante el *id*, que será el dato que se enviará al servidor y que se almacenará en las bases de datos, llegado el caso, para indicar el usuario asociado a un registro dado. Observa que no se debería enviar al servidor un dato como la dirección de correo electrónico para usarlo como identificador del usuario porque podría cambiar en algún momento del futuro. Este es el código:

.. literalinclude:: ../../code/gsignin/gsignin.html
  :language: html
  :linenos:


Términos de uso de las APIs web
-------------------------------

Aunque no lo estudiaremos en esta asignatura, hay que tener en cuenta que existen en la web multitud de APIs disponibles para su uso desde aplicaciones de terceros, pero estas APIs suelen tener términos de uso (mira las condiciones de la `API de Twitter`_, por ejemplo) que es importante leer antes de decidirse a basar una determinada aplicación en ellas. 

.. _`API de Twitter`: https://developer.twitter.com/en/developer-terms/agreement-and-policy

