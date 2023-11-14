
Acceso a servicios web de terceros
==================================

Los *servicios web* proporcionan una forma estándar de interoperabilidad entre diferentes aplicaciones, posiblemente heterogéneas. En este tema, veremos cómo acceder a servicios desde nuestras aplicaciones web, así como su relación con el estándar HTTP. En este tema nos centraremos en el acceso a servicios web ofrecidos por terceros; posteriormente, veremos cómo definir nuestros propios servicios web.

.. Important::

  Las habilidades que deberías adquirir con este tema incluyen las siguientes:

  - Saber usar Ajax, especialmente a través de la API Fetch, como una tecnología para crear aplicaciones de una única página.
  - Saber crear y encadenar promesas en un programa de JavaScript.
  - Comprender los fundamentos del protocolo HTTP y la configuración cliente-servidor.
  - Diferenciar los distintos componentes de un navegador.
  - Saber implementar aplicaciones *mashups* que accedan e integren servicios web de terceros.
 

.. _label-servicios-http:

El protocolo HTTP
-----------------

HTTP (por *hypertext transfer protocol*) es el protocolo de comunicación (a nivel de capa de aplicación) diseñado para permitir el envío de información en la *world wide web* entre distintos ordenadores. Sus primeras versiones fueron desarrolladas en la década de los noventa a partir de los trabajos de Tim Berners Lee y su equipo (los creadores de la web). Las diferentes versiones del estándar son coordinadas por el `HTTP Working Group`_ de la Internet Engineering Task Force. HTTP/1.1 se publicó en 1997, HTTP/2 en 2015 y HTTP/3 en 2018, aunque tanto navegadores como servidores siguen soportando las versiones antiguas y son capaces de adaptarse para usar el mismo protocolo: por ejemplo, un navegador reciente que soporte HTTP/3 usará HTTP/2 o incluso HTTP/1.1 al comunicarse con un servidor que no haya sido actualizado en mucho tiempo. HTTP/3, a diferencia de anteriores versiones, ya no se apoya en el protocolo de transporte TCP (*transmission control protocol*), sino que usa QUIC (que no son siglas, sino un término que pretende evocar a la palabra inglesa *quick*). QUIC mejora la capacidad de multiplexación de TCP y suele mejorar la latencia y velocidad de las conexiones.

.. _`HTTP Working Group`: https://httpwg.org/


.. admonition:: Hazlo tú ahora
  :class: hazlotu

  Estudia todos los vídeos de la serie "El protocolo HTTP" en los que se realiza un repaso a los principales elementos del protocolo: `parte 1-1`_, `parte 1-2`_ y `parte 1-3`_.

  .. _`parte 1-1`: https://drive.google.com/file/d/1Wy4iV-oi7MEypO77wL4AYGPDLfIAWoNy/view?usp=sharing
  .. _`parte 1-2`: https://drive.google.com/file/d/1scQJsHbPgrznE3qqx4BTqDXWgpEdcJsE/view?usp=sharing
  .. _`parte 1-3`: https://drive.google.com/file/d/1eAiocuglVBR0WCC_j9L77OMJ7zlsLRq4/view?usp=sharing


Los conceptos que tienes que comprender del protocolo HTTP se encuentran recogidos en `estas diapositivas`_.

.. _`estas diapositivas`: ./slides/050-http-slides.html


Herramientas para desarrolladores
---------------------------------

Las herramientas para desarrolladores que incorporan los navegadores permiten estudiar los detalles de todas las conexiones establecidas por el navegador al ejecutar una aplicación web.

.. Note:

Las peticiones lanzadas desde la barra de direcciones del navegador son siempre de tipo GET. Para estudiar los otros tipos de peticiones de HTTP, necesitamos crear un formulario para peticiones de tipo POST, o, si queremos poder usar cualquier verbo, escribir código en JavaScript (usando la API Fetch que estudiáremos después) u otro lenguaje de programación. También hay herramientas como `Postman`_, una aplicación que permite crear cómodamente colecciones de peticiones a APIs (*application programming interfaces*). La herramienta `curl`_ es similar pero funciona desde la línea de órdenes.

.. _`Postman`: https://www.getpostman.com/
.. _curl: https://curl.haxx.se/


.. admonition:: Hazlo tú ahora
  :class: hazlotu

  Familiarízate con las opciones de inspección de la actividad en red de la pestaña :guilabel:`Network` del entorno de las Chrome DevTools siguiendo la página de su documentación `Inspect Network Activity`_ . Practica las distintas posibilidades en DevTools con peticiones GET por ahora, pero recuerda volver a esta actividad cuando estudies cómo realizar desde JavaScript peticiones con otros verbos.

  .. _`Inspect Network Activity`: https://developers.google.com/web/tools/chrome-devtools/network


.. _label-servicios-promesas:

Promesas de JavaScript
----------------------

Los objetos de tipo ``Promise`` (una clase definida en la API de JavaScript de los navegadores modernos) se usan para representar la finalización con éxito de una tarea (normalmente asíncrona, es decir, que no bloquea el bucle de eventos, sino que define una función de *callback* que será ejecutada más adelante) o su fracaso. En términos informales, diremos que una promesa se cumple (en caso de éxito), se incumple (en caso de fracaso) o que está pendiente (cuando aún no se ha resuelto); en inglés se usan los términos *fullfilled*, *rejected* o *pending*, respectivamente. Los objetos promesa nos serán muy útiles en tareas como la comunicación con un servidor, que veremos más adelante en este tema.

.. promesas: https://stackoverflow.com/a/42005046/1485627

Veamos un primer ejemplo. El siguiente código crea un objeto de tipo promesa ``p`` invocando al constructor de ``Promise``. Este constuctor recibe como parámetro una función llamada *función ejecutora* con el código que nosotros definamos para intentar cumplir la promesa. 

El constructor de ``Promise`` creará dos funciones: una que nuestro código tendrá que invocar si la tarea prometida se ha podido llevar a cabo; otra que nuestro código invocará en caso contrario. Para poder llamar a estas funciones nuestra función ejecutora tiene dos parámetros por los que recibe referencias a ellas (recuerda que las funciones son objetos en JavaScript). Por tanto, estas dos funciones (parámetros ``resolve`` y ``reject`` en el código de abajo) serán invocadas en los lugares de nuestro código en los que determinemos que la tarea se ha desarrollado con éxito (en el caso del primer parámetro) o ha fracasado (para la función pasada como segundo parámetro). 

En este caso, vamos a suponer que nuestra promesa ejecuta una tarea asíncrona muy sencilla: generar tras un segundo un número aleatorio entre 0 y 1; la tarea se considera un éxito si el número es menor de 0,5. En lenguaje de la calle, sería como decir "te prometo que voy a generar (asíncronamente) un número aleatorio y que será menor que 0,5"; como cualquier promesa, en cualquier caso, esta puede cumplirse o no. Observa que la tarea es asíncrona (concretamente, una llamada a ``setTimeout``), lo que significa que el hilo de ejecución de nuestro programa no se queda bloqueado esperando a que pase dicho segundo, sino que la cuenta del tiempo se lleva a cabo por el navegador en otro hilo y al cumplirse el tiempo se añade a la cola de eventos la llamada al *callback* correspondiente.

.. code-block:: 
  :linenos:
  :force:

  let p= new Promise(function(resolve,reject) {  // función ejecutora
    console.log('Entrando en el constructor de la promesa');
    setTimeout( function() {
      const r= Math.random();
      if (r<0.5) {
        resolve('la cosa fue bien');
      }
      else {
        reject('algo salió mal');
      }
    }, 1000);
  });

A las funciones ``resolve`` y ``reject`` les podemos pasar un único argumento que usaremos para dar información adicional relacionada con el éxito o fracaso de la tarea asíncrona; en este caso, es una simple cadena con un mensaje, pero puede ser cualquier objeto de JavaScript. 

Nada más invocar al contructor de ``Promise``, este establece el estado de la promesa a *pendiente* y llama a nuestra función ejecutora que el constructor ha recibido como parámetro. El código de la función ejecutora, como en nuestro ejemplo, normalmente definirá una operación asíncrona (como llamar a ``setTimeout`` o realizar una petición a un servidor) que terminará llamando a ``resolve`` y a ``reject`` en distintos puntos; estas dos funciones (recordemos que son creadas por el sistema y no pertenecen a nuestro código) cambian el estado de la promesa a *cumplida* o *incumplida* y llaman a continuación a las funciones que el programador haya definido para manejar ambas situaciones como veremos a continuación.

El vínculo entre las funciones del sistema ``resolve`` y ``reject`` y nuestro código se establece llamando al método ``then`` sobre el objeto de tipo promesa. Al método ``then`` se le pasan dos *funciones manejadoras de promesas* que el objeto de tipo promesa registra internamente: la primera se vincula a ``resolve`` y la segunda a ``reject``. Estas funciones manejadoras pueden tener un parámetro que será el mismo que el usado como argumento en las llamadas a ``resolve`` y ``reject`` de la función ejecutora. Las funciones ``resolve`` y ``reject`` definidas por el sistema invocarán *con su parámetro* a la función correspondiente de nuestro código registrada con ``then()``.

.. code-block:: 
  :linenos:
  :force:

  p.then(function(mensaje) {
      console.log(`Promesa cumplida: ${mensaje}`);
    }, function(mensaje) {
      console.log(`Promesa incumplida: ${mensaje}`);
    }
  );

.. Note:

  Como las llamadas a ``resolve`` y ``reject`` se realizarán más adelante cuando el bucle de eventos atienda nuestro *callback*, para entonces el intérprete ya habrá ejecutado el método ``then`` correspondiente que aparecerá en nuestro código después de crear la promesa y, por tanto, el vínculo entre las funciones ``resolve``y ``reject`` ya se habrá establecido.

Observa cómo todo el proceso puede verse como un *partido de tenis* en el que la pelota pasa del campo del código de la librería de promesas de JavaScript a nuestro código varias veces. Nuestro código *saca* creando la promesa. El constructor de la promesa crea entonces las funciones ``resolve`` y ``reject`` y llama la función ejecutora. Nuestra función ejecutora crea una tarea asíncrona y le asocia una función de *callback*. En otro hilo el navegador lleva a cabo la tarea asíncrona y cuando esta se complete encolará la llamada a nuestra función de *callback*. Mientras tanto, nuestro código principal se sigue ejecutando y registra los dos manejadores llamando al método ``then``. Posteriormente, cuando sea desencolada por el bucle de eventos, nuestra función de *callback* comprobará si la tarea asíncrona se ha realizado con éxito o no. En base a una u otra cosa, nuestra función de *callback* llamará a ``resolve`` o ``reject``. Cuando una de estas funciones se ejecute invocará una de nuestras funciones manejadoras. Nuestra función manejadora se ejecutará y realizará las acciones que correspondan según la promesa se haya cumplido o no, terminando aquí el *punto de juego*.

Además, observa en el código anterior cómo hemos usado *cadenas con plantillas* (*template strings*) para imprimir los mensajes por consola. Las cadenas con plantillas de JavaScript usan comillas invertidas en lugar de rectas, pueden contener variables embebidas como en el ejemplo, y pueden también ocupar más de una línea.

.. figure:: https://c-sharpcorner.com/UploadFile/BlogImages/01262017214716PM/Screen%20Shot%202017-01-26%20at%208.28.19%20pm.png
  :target: https://www.c-sharpcorner.com/blogs/overview-of-promises-in-javascript
  :alt: diagrama de los elementos implicados en una promesa
  
  Diagrama de los elementos de una promesa por Sumant Mishra

El código anterior es equivalente al siguiente en el que en lugar de pasar dos funciones a ``then`` se define la función asociada al incumplimiento de la promesa en un método ``catch``:

.. code-block:: 
  :linenos:
  :force:

  let p= new Promise(function(resolve,reject) {
    setTimeout( function() {
      const r= Math.random();
      if (r<0.5) {a introducción
        resolve('la cosa fue bien');
      }
      else {
        reject('algo salió mal');
      }
    }, 1000);
  });

  p.then(function(mensaje) {
      console.log(`Promesa cumplida: ${mensaje}`);
    })
    .catch(function(mensaje) {
      console.log(`Promesa incumplida: ${mensaje}`);
    });


Además, si encapsulamos el código de creación de la promesa en una función, usamos funciones flecha y gestionamos el error mediante una excepción (clase ``Error``), el código anterior se convierte en:

.. code-block:: 
  :linenos:
  :force:

  function aleatorio() {
    return new Promise( (resolve,reject) => {
      setTimeout( () => {
        const r= Math.random();
        if (r<0.5) {
          resolve('la cosa fue bien');
        }
        else {
          reject(new Error('algo salió mal'));
        }
      }, 1000);
    });
  }

  aleatorio()
    .then( (mensaje) => {console.log(`Promesa cumplida: ${mensaje}`);})
    .catch( (error) => {console.log(`Promesa incumplida: ${error.message}`);});


Las promesas pueden encadenarse simplemente haciendo que la función manejadora asociada al cumplimiento de la promesa (la indicada en la llamada al método ``then``) devuelva a su vez una promesa:

.. code-block:: 
  :linenos:
  :force:

    aleatorio().then( (mensaje) => {
      console.log(`Primera promesa cumplida: ${mensaje}`);
      return aleatorio2(0.8);
    })
    .then( (mensaje) => {
      console.log(`Segunda promesa cumplida: ${mensaje}`);
    })
    .catch( (error) => {
      console.log(`Una de las promesas fue incumplida: ${error.message}`);
    }
    );

    function aleatorio() {
      return new Promise( (resolve,reject) => {
        setTimeout( () => {
          const r= Math.random();
          if (r<0.5) {
            resolve('la cosa fue bien');
            }
          else {
            reject(new Error('algo salió mal'));
          }
        }, 1000);
      });
    }

    function aleatorio2(delta) {
      return new Promise( (resolve,reject) => {
        setTimeout( () => {
          const r= Math.random();
          if (r<delta) {
            resolve('me encanta que los planes salgan bien');
          }
          else {
            reject(new Error('peor imposible'));
          }
        }, 1000);
      });
    }
  

En este caso, la segunda promesa establece una clausura con el parámetro de la función que indica el umbral para que la promesa se cumpla. Si encapsulamos todos los bloques en funciones, el código principal queda muy compacto y legible:

.. code-block:: 
  :linenos:
  :force:

  aleatorio()
    .then(primerMensaje)
    .then(segundoMensaje)
    .catch(mensajeError);

  function primerMensaje (mensaje) {
    console.log(`Primera promesa cumplida: ${mensaje}`);
    return aleatorio2(0.8);
  }

  function segundoMensaje (mensaje) {
    console.log(`Segunda promesa cumplida: ${mensaje}`);
  }

  function mensajeError (error) {
    console.log(`Una de las promesas fue incumplida: ${error.message}`);
  }

  function aleatorio() {
    return new Promise( (resolve,reject) => {
      setTimeout( () => {
        const r= Math.random();
        if (r<0.5) {
          resolve('la cosa fue bien');
        }
        else {
          reject(new Error('algo salió mal'));
        }
      }, 1000);
    });
  }

  function aleatorio2(delta) {
    return new Promise( (resolve,reject) => {
      setTimeout( () => {
        const r= Math.random();
        if (r<delta) {
          resolve('me encanta que los planes salgan bien');
        }
        else {
          reject(new Error('peor imposible'));
        }
      }, 1000);
    });
  }
  

Uno de los motivos de la introducción de las promesas en JavaScript fue precisamente el de simplificar la escritura de código en los frecuentes casos que los que un evento asíncrono dispara a su terminación otro evento asíncrono que dispara a su vez un nuevo evento asíncrono, etc. El código sin promesas termina teniendo una cantidad tal de ámbitos que su escritura y su lectura se hacen muy dificultosas como puedes ver a continuación:

.. code-block:: 
  :linenos:
  :force:

  function aleatorio() {
      setTimeout( () => {
          const r= Math.random();
          if (r<0.5) {
            let mensaje= 'la cosa fue bien';
            console.log(`Primera promesa cumplida: ${mensaje}`);
            let delta= 0.8;
            setTimeout( () => {
              const r= Math.random();
              if (r<delta) {
                let mensaje= 'me encanta que los planes salgan bien';
                console.log(`Segunda promesa cumplida: ${mensaje}`);
              }
              else {
                let error= new Error('peor imposible');
                console.log(`Una de las promesas fue incumplida: ${error.message}`);
              }
            }, 1000);
          }
          else {
            let error= new Error('algo salió mal');
            console.log(`Una de las promesas fue incumplida: ${error.message}`);
          }
    }, 1000);
  }

  aleatorio();


.. Note:

  JavaScript ha incluido más recientemente las `funciones asíncronas`_ que permiten simplificar aún más las cadenas de promesas al utilizar la misma notación secuencial empleada en segmentos síncronos de código con los bloques de código que contienen llamadas asíncronas. Lo veremos más adelante.

  .. _`funciones asíncronas`: https://developers.google.com/web/fundamentals/primers/async-functions


Finalmente, el código de la función ejecutora tiene un ``try..catch`` implicito a su alrededor. Por lo tanto, si dentro de la función ejecutora se lanza una excepción, esta se captura y se gestiona como un incumplimiento de promesa. Así, el siguiente código:

.. code-block:: 
  :linenos:
  :force:

  new Promise((resolve, reject) => {
    throw new Error("algo salió mal");
  }).catch(error => console.log(error.message));

es equivalente a este:

.. code-block:: 
  :linenos:
  :force:

  new Promise((resolve, reject) => {
    reject(new Error("algo salió mal"));
  }).catch(error => console.log(error.message));

Lo mismo pasa en los manejadores de promesas. Si lanzamos una excepción dentro del manejador definido en el ``then`` se considera como una promesa incumplida y el control se transfiere al manejador de error:

.. code-block::
  :linenos:
  :force:

  new Promise((resolve, reject) => {
    resolve("la cosa fue bien");
  }).then((result) => {
    throw new Error(`${result}, pero luego algo salió mal`);
  }).catch(error => console.log(error.message));

.. Note:: 

  Este bloque es opcional y puedes saltártelo salvo que te gusten las emociones fuertes. Se muestra a continuación una aproximación a la implementación de la clase ``Promise`` de JavaScript que si bien no coincide con ninguna real, te puede ayudar a entender mejor su funcionamiento.

  .. code-block:: javascript
    :linenos:
    :force:

    class MyPromise {
      constructor(executor) {
        this.state = 'pending';
        this.value = null;
        this.callbacks = [];

        const resolve = (value) => {
          if (this.state !== 'pending') return;
          this.state = 'fulfilled';
          this.value = value;
          this.callbacks.forEach(callback => this.handleCallback(callback));
        };

        const reject = (reason) => {
          if (this.state !== 'pending') return;
          this.state = 'rejected';
          this.value = reason;
          this.callbacks.forEach(callback => this.handleCallback(callback));
        };

        try {
          executor(resolve, reject);
        } catch (error) {
          reject(error);
        }
      }

      handleCallback({ onFulfilled, onRejected, resolve, reject }) {
        if (this.state === 'fulfilled') {
          return onFulfilled ? resolve(onFulfilled(this.value)) : resolve(this.value);
        }
        if (this.state === 'rejected') {
          return onRejected ? reject(onRejected(this.value)) : reject(this.value);
        }
      }

      then(onFulfilled, onRejected) {
        return new MyPromise((resolve, reject) => {
          const callback = { onFulfilled, onRejected, resolve, reject };
          if (this.state === 'pending') {
            this.callbacks.push(callback);
          } else {
            this.handleCallback(callback);
          }
        });
      }

      catch(onRejected) {
        return this.then(null, onRejected);
      }
    }

    const promise = new MyPromise((resolve, reject) => {
      setTimeout(() => resolve("Hecho!"), 1000);
    });

    promise.then(value => console.log(value))
          .then(() => console.log("Terminado"));

    const promise2 = new MyPromise((resolve, reject) => {
      setTimeout(() => reject("Error!"), 1000);
    });

    promise2.then(value => console.log(value))
            .catch(reason => console.log(`Ha fallado: ${reason}`));




.. _label-servicios-xhr:

Los objetos de tipo XMLHttpRequest
----------------------------------

En los primeros años de la web, la mayoría de las aplicaciones web seguían el siguiente patrón de comportamiento al realizar, por ejemplo, una búsqueda de un determinado elemento en una base de datos: el usuario rellenaba los valores correspondientes para buscar el elemento en un formulario y pulsaba el botón de enviar; en ese momento, el navegador realizaba una petición al servidor y borraba la página web actual; el servidor realizaba la búsqueda en la base de datos y devolvía entonces una página web completa que el navegador mostraba en sustitución de la anterior. Además de generar una experiencia incómoda al usuario si se compara con una aplicación tradicional de escritorio (el usuario ha de esperar a que se cargue de nuevo toda la página para seguir interactuando con la aplicación), este procedimiento es muy ineficiente cuando la página web tiene mucho contenido que apenas cambia, y que, sin embargo, es enviado continuamente por el servidor. 

A partir de finales de los noventa y especialmente en los primeros años del siglo XXI, los desarrolladores comienzan a explotar el uso de funcionalidades de los navegadores que permiten realizar peticiones a un servidor sin tener que recargar la página completa. A estas técnicas se les denomina Ajax por razones históricas: el término lo acuñó un desarrollador en 2005 como acrónimo de *Asynchronous JavaScript and XML*. Con Ajax, los datos devueltos por el servidor se usan para generar dinámicamente HTML que es insertado convenientemente en el árbol DOM, conformando lo que se conoce como *aplicaciones de una solo página* (*single-page applications*). La más usada de las técnicas Ajax se basaba en los objetos de clase ``XMLHttpRequest`` (para abreviar se suele llamar *XHR*) que permite, como se ha comentado, solicitar (normalmente de forma asícrona) una serie de datos al servidor desde JavaScript en lugar de una página completa que reemplazará a la actual. Estos datos serán, entonces, procesados por una función definida por el programador.

.. admonition:: Hazlo tú ahora
  :class: hazlotu

  Estudia el vídeo "`Los objetos de tipo XMLHttpRequest`_" en el que se realiza una traza del código que aparece a continuación para interactuar con un servicio web mediante un objeto de la clase ``XMLHttpRequest``. *Nota*: puede que la API usada en el ejemplo haya cambiado desde que se grabó el vídeo y que el código tenga que ser modificado, por ejemplo, para usar otro *endpoint*; el código que aparece a continuación en este documento puede que sea diferente al del vídeo por este motivo.

  .. _`Los objetos de tipo XMLHttpRequest`: https://drive.google.com/file/d/1G6eoew4ZyPd3rnpkXOWanjKY8ACL9nIB/view?usp=sharing
  
El siguiente es un ejemplo típico de uso de un objeto de tipo ``XMLHttpRequest``:

.. code-block:: javascript
  :linenos:
  :force:

  // Los datos del servidor se insertarán en el elemento con id 'results':
  var resultado= document.querySelector("#results");

  // Borra el contenido previo del elemento:
  resultado.textContent= "";

  // Crea el objeto XHR:
  var xhr = new XMLHttpRequest();
  console.log(xhr.readyState);

  var url= "https://ghibli.rest/films";
  // otro endpoint: https://ghibliapi.vercel.app/films/
  // Identifica el verbo, la URL y que la petición será asíncrona:
  xhr.open("GET", url, true);
  console.log(xhr.readyState);
  
  // La función asignada a onreadystatechange es invocada varias veces por
  // el navegador durante el transcurso de las diferentes fases de comunicación 
  // con el servidor (conexión establecida, petición recibida, petición en proceso, 
  // petición finalizada); la fase de la llamada actual se almacena en readyState; 
  // normalmente, nos interesa la llamada en la que readyState tiene el valor 4,
  // que se hace en el momento en el que el servidor ha devuelto todos los 
  // datos:
  xhr.onreadystatechange = function () {
    console.log(xhr.readyState);
    if (xhr.readyState == 4) {
      // Código de estado de HTTP:
      if (xhr.status != 200) {
        console.error("Hubo un error (" + xhr.status + ")!");
      }
      else {
        // JSON.parse analiza la cadena pasada como argumento y la convierte
        // a un objeto de JavaScript; la respuesta de esta petición es un array
        // que se almacena en r:
        var r= JSON.parse(xhr.responseText);

        // Los datos devueltos están en formato JSON y son de la forma 
        // [ {"id":"dc2e","title":"Spirited Away","original_title":"千と千尋の神隠し",
        //    "description":"Spirited Away is a film about a ten year old girl...",...}, 
        //   {...},  {...} ] 
        for (var i=0; i<r.length;i++) {
          resultado.textContent+= r[i].title+"; ";
        }
      }
    }
  };
  // Realiza la petición:
  xhr.send(null);


Este código accede a modo de ejemplo a una `API web`_ sobre las películas del estudio Ghibli. Los datos devueltos por esta API web (y por muchas otras) están codificados en una notación independiente del lenguaje denominada JSON (por *JavaScript Object Notation*), que es muy parecida a la que se usa en JavaScript para definir literalmente un objeto.


.. Note::

  Las principales diferencias entre el formato JSON y la notación literal de objetos en Javascript son que en el primer caso los atributos van siempre entrecomillados, no pueden usarse comillas simples, no pueden incluirse valores de algunos tipos especiales de JavaScript como, por ejemplo, funciones, y, finalmente, no puede haber una coma tras el último atributo. Este última característica sí que es correcta en JavaScript. Por ejemplo, la siguiente definición de un objeto es correcta en JavaScript, pero la parte de la derecha de la asignación no lo sería en JSON por múltiples motivos: 

  .. code-block:: javascript
    :linenos:
    :force:

    var x = { a: 12, 'b': 14, "c": 16, };


Como ves en el código anterior, la función ``JSON.parse`` permite convertir una cadena en formato a JSON a objeto de JavaScript; para lo opuesto, puede usarse la función ``JSON.stringify``. En APIs web más antiguas se usaba el formato XML en lugar de JSON, de ahí el nombre de ``XMLHttpRequest``.

.. _`API web`: https://ghibli.rest/films


.. admonition:: Hazlo tú ahora
  :class: hazlotu

  Prueba el código del ejemplo anterior (por ejemplo, en una web como CodePen o JSFiddle) para comprender su funcionamiento y estudia todo el tráfico de red mediante las Chrome DevTools. Asegúrate de crear un elemento con id ``results`` en el documento HTML. Escribe código para probar también otras APIs públicas, como la de información del juego `Clash Royale`_ o la de `Harry Potter`_.

  .. _`Clash Royale`: https://github.com/martincarrera/clash-royale-api
  .. _`Harry Potter`: https://hp-api.onrender.com/


.. _label-servicios-fetch:

La API Fetch
------------

En los últimos años, sin embargo, los navegadores han comenzado a implementar la API Fetch (desarrollada por el WHATWG, Web Hypertext Application Technology Working Group, que también supervisa la evolución de otros estándares como HTML o la API DOM), que es una forma más potente, extensible y flexible de acceder a recursos externos. Usando esta API en lugar de XHR, el código mostrado anteriormente quedaría como sigue:

.. code-block:: javascript
  :linenos:

  var resultado= document.querySelector("#results");
  resultado.textContent= "";
  fetch('https://ghibli.rest/films')
  .then(function(response) {
    if (!response.ok) {
      throw Error(response.statusText);
    }
    return response.json();  
  })
  .then(function(responseAsObject) {
    for (var i=0; i<responseAsObject.length;i++) {
      resultado.textContent+= responseAsObject[i].title+"; ";
    }
  })
  .catch(function(error) {
    console.log('Ha habido un problema: ', error);
  });

.. admonition:: Hazlo tú ahora
  :class: hazlotu

  Estudia el vídeo de "`La API Fetch`_" en el que se realiza una traza del código anterior.

  .. _`La API Fetch`: https://drive.google.com/file/d/1MFQSQizsfatfhJT6r2GnLZ2CCoYV5VDd/view?usp=sharing 
  
No te costará entender este código si repasas lo estudiado en una sección anterior sobre las promesas en JavaScript y te decimos que la función ``fetch`` devuelve una promesa que se cumple cuando el servidor devuelve un resultado (aunque la respuesta incluya un código de error de HTTP) y se incumple cuando por cualquier motivo no es posible establecer la comunicación con el servidor. La función ``json`` devuelve otra promesa que se cumple si el cuerpo de la respuesta del servidor (que se pasa por la promesa ``fetch`` a la función ``resolve`` y de ahí a la función manejadora del primer método ``then``) es una cadena en formato JSON que se puede convertir sin errores (usando un mecanismo similar al de ``JSON.parse()``) en un objeto de JavaScript.

Existen dos cadenas de llamadas a funciones diferentes. Por un lado, la cadena de llamadas a los sucesivos métodos ``then`` implica que cada llamada *síncrona* a estos métodos devuelve un objeto de tipo ``Promise`` sobre el que se invoca el siguiente ``then``. Por otro lado, la cadena de los *callbacks* que hemos definido y pasado a los métodos ``then`` se ejecuta de forma asíncrona cuando las promesas asociadas se van cumpliendo; cada uno de estos *callbacks* recibe como parámetro el resultado del *callback* anterior. Es importante señalar que la función ``json`` devuelve una promesa porque va realizando la conversión a objeto de forma asíncrona y eficiente (la respuesta puede ser arbitrariamente larga) a partir de un *stream* de datos asociado a la respuesta del servidor (de clase ``Response``). La promesa de ``fetch`` se cumple en el momento en que se han procesado las cabeceras de la respuesta y justo antes de que empiece a llegar el cuerpo del mensaje. Si todo esto no fuera así, la función ``json`` podría devolver directamente el objeto de JavaScript correspondiente y no sería necesaria la segunda llamada a ``then`` para registrar un nuevo *callback*. Los datos en JSON suelen ocupar poco espacio, por lo que no sería necesario una conversión incremental asíncrona, pero ``fetch`` también se usa para acceder a recursos de otro tipo, como imágenes o vídeos, que pueden ser muy grandes.

También debería ser fácil de entender el siguiente código, que añade un paso intermedio al procesamiento de la respuesta del servidor que convierte los títulos de películas almacenados en el objeto de JavaScript a minúsculas. Para ello, define una función que devuelve una promesa que no se cumple únicamente en el caso de que la cadena del atributo ``title`` sea vacía. 

.. code-block:: javascript
  :linenos:

  function minusculas(r) {
    var promise= new Promise(function(resolve, reject) {
      if (r.length>0) {
        for (var i=0; i<r.length;i++) {
          r[i].title= r[i].title.toLowerCase();
        }
        resolve(r);
      }
      else {
        reject(Error("String cannot be empty!"));
      }
    });
    return promise;
  }

  var resultado= document.querySelector("#results");
  resultado.textContent= "";
  fetch('https://ghibli.rest/films')
  .then(function(response) {
    if (!response.ok) {
      throw Error(response.statusText);
    }
    return response.json();  // llama a JSON.parse()
  })
  .then(minusculas)
  .then(function(responseAsObject) {
    for (var i=0; i<responseAsObject.length;i++) {
          resultado.textContent+= responseAsObject[i].title+"; ";
  }
  })
  .catch(function(error) {
    console.log('Ha habido un problema: \n', error);
  });

Este código de la conversión no es estrictamente necesario que se implemente como una promesa, pero se hace así por motivos didácticos. Si la conversión a minúsculas no se instrumentara mediante una promesa, podría eliminarse su ``then`` y llamar a la función ``toLowerCase`` directamente en el último ``then``. También podrían mantenerse los tres ``then`` con una función de conversión que no devuelva una promesa porque allá donde se espera una promesa se puede poner cualquier función que devuelva un valor y se considerará como una promesa que se cumple (resuelve) siempre con ese valor.

Las peticiones realizadas por ``fetch`` son, por defecto, de tipo GET. Más adelante, veremos como realizar peticiones con otros verbos, añadir información en JSON o dar valor a ciertas cabeceras de HTTP.

