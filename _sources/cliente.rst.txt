.. role:: problema-contador

Programar el lado del cliente
=============================

JavaScript es un lenguaje orientado a objetos, funcional, dinámico e interpretado, usado principalmente como el lenguaje de programación de las páginas web en el lado del navegador. Actualmente, sin embargo, se usa también en la parte del servidor en entornos como Node.js o MongoDB. El nombre del estándar que regula JavaScript es ECMAScript. Los navegadores recientes entienden las últimas versiones de ECMAScript; cada año se publica una nueva versión (por ejemplo, ECMAScript 2020, también conocido como ES11).

.. Important::

  Las habilidades que deberías adquirir con este tema incluyen las siguientes:

  - Comprender los elementos básicos de JavaScript como lenguaje de programación orientado a objetos.
  - Saber programar en JavaScript la parte del cliente de una aplicación web usando la API de los navegadores para la gestión del DOM, eventos, estilos, etc.
  - Usar las herramientas para desarrolladores integradas en los navegadores, como Chrome DevTools, para depurar un programa escrito en JavaScript.


.. _label-intro-js:

Introducción al lenguaje de programación JavaScript
---------------------------------------------------

.. admonition:: Hazlo tú ahora
  :class: hazlotu

  Estudia todos los vídeos de la serie "Introducción a JavaScript" en los que se presentan los elementos principales del lenguaje: `parte 1-1`_, `parte 1-2`_, `parte 1-3`_, `parte 1-4`_, `parte 1-5`_ y `parte 1-6`_.

  .. _`parte 1-1`: https://drive.google.com/file/d/1p3ThE3xA1ubg3jJXFd968ucwckVpayKy/view?usp=sharing
  .. _`parte 1-2`: https://drive.google.com/file/d/1MgFD19HaWSPo6P_CnPUFF6kmCLJJowEx/view?usp=sharing
  .. _`parte 1-3`: https://drive.google.com/file/d/1GInxvZFxgt8GcS2cWzbMRWEDpNi0kHmG/view?usp=sharing
  .. _`parte 1-4`: https://drive.google.com/file/d/1SrmuNde9DeOoOOClZ2WDGbf-aZH4vi33/view?usp=sharing
  .. _`parte 1-5`: https://drive.google.com/file/d/15Z-leYRlWbMmPWQZczqakCt0q3jMLAcJ/view?usp=sharing
  .. _`parte 1-6`: https://drive.google.com/file/d/1uP37JivyhSZeEgqwzcD57CznQwzLqS-Z/view?usp=sharing

Elementos más avanzados del lenguaje o las características adicionales a las que un programador puede acceder cuando escribe programas en JavaScript para ser ejecutados por un navegador se estudiarán más adelante. Los conceptos que tienes que comprender del lenguaje se encuentran recogidos en `estas diapositivas`_, que también contiene información sobre elementos más avanzados que estudiaremos más adelante.

.. _`estas diapositivas`: ./slides/150-js-slides.html

.. admonition:: Hazlo tú ahora
  :class: hazlotu

  Practica con los diferentes conceptos de JavaScript hasta tener claro su uso. Puedes practicar usando la consola de JavaScript de las Chrome Devtools, instalando Node.js, abriendo una `consola en línea`_ o creando un proyecto en `repl.it`_ de tipo Node.js. 

  .. _`consola en línea`: https://jsconsole.com/
  .. _`repl.it`: https://repl.it/


.. Important::

  El izado (*hoisting*) es el mecanismo por el que las declaraciones de variables y funciones son desplazadas al comienzo del ámbito en el que se encuentran antes de la ejecución. En el caso de las variables, su declaración y su inicialización son dos cosas diferentes, por lo que el siguiente código imprime *undefined*, *undefined* y *Novokribirsk*:

  .. code-block:: javascript
    :linenos:

    console.log(newcity);
    city();
    var newcity = "Novokribirsk";
    city();

    function city() {
      console.log(newcity);
    }


.. Note::

  Cuando aparecen en el nivel superior del programa, las funciones y las variables declaradas con ``var`` se convierten en propiedades del llamado *objeto global*. Por otro lado, ``let`` y ``const`` no crean propiedades del objeto global, sino que se limitan al ámbito en el que se declaran. En el caso de los navegadores, este objeto se suele llamar ``window``, por lo que a una variable global declarada como ``x`` nos podemos referir tanto como ``x`` o como ``window.x``. Como en otros entornos el objeto global recibe otros nombres (por ejemplo, en Node.js se llama ``global``), el lenguaje JavaScript permite referirse al objeto global de forma general como ``globalThis``. Cuando usamos módulos en JavaScript, las reglas son diferentes, ya que hay que indicar explícitamente qué elementos del espacio de nombres del módulo son visibles desde el exterior.

.. Note::

  Los módulos son una característica de JavaScript que permite agrupar objetos relacionados en espacios de nombres separados. El siguiente módulo (guardado en el fichero ``modulo.js``) exporta una función y un array:

  .. code-block:: javascript
    :linenos:

    var frutas = ['papaya', 'banana', 'watermelon'];

    function log (mensaje) {
      console.log(duplica(mensaje));  
    }

    function duplica (mensaje) {
      return mensaje + mensaje;
    }

    export { frutas, log };

  Estos elementos pueden ser ahora usados desde el módulo ``script.js`` de la siguiente forma:

  .. code-block:: javascript
    :linenos:

    import * as m from './modulo.js';

    m.log(m.frutas[0]);
    m.log(m.frutas[1]);

  O, equivalentemente: 

  .. code-block:: javascript
    :linenos:

    import { frutas, log } from './modulo.js';

    log(frutas[0]);
    log(frutas[1]);
    
  Ahora si insertamos la siguiente línea en nuestro documento HTML, obtendremos por la consola *papayapapaya* y *bananabanana*:

  .. code-block:: html
    :linenos:

    <script type="module" src="script.js"></script>

  Los módulos de JavaScript han de cargarse con el atributo ``type="module"``. Si no lo hacemos así, el intérprete intentará cargar el fichero como si fuera un script normal, lo que puede dar lugar a errores.


.. Note::

  A diferencia de lo que ocurre en otros lenguajes, el punto y coma actúa en JavaScript como un *separador* de instrucciones y no como un *finalizador* de ellas. El estándar establece que su uso es opcional en ciertos casos (básicamente, cuando el intérprete puede determinar dónde acaba una instrucción y empieza la siguiente), pero en ocasiones esto puede llevar a que el motor de JavaScript interprete el código de forma diferente a la que teníamos en mente. Por ejemplo, el código siguiente:

  .. code-block:: javascript
    :linenos:
    :force:

    const a = 1
    const b = 2
    const c = a + b
    (a + b).toString()

  produce un error ``b is not a function`` porque el intérprete de JavaScript lo analiza como si estuviera escrito así:

  .. code-block:: javascript
    :linenos:
    :force:
    
    const a = 1;
    const b = 2;
    const c = a + b(a + b).toString();

  Por ello, se recomienda a los novicios del lenguaje que siempre finalicen cada instrucción con punto y coma.


.. _label-app-web-sencilla:

Una aplicación web sencilla
---------------------------

El código que se incluye más abajo muestra *en acción*, a modo de introducción, los elementos básicos del lenguaje JavaScript (variables, condicionales, bucles, funciones, etc.), así como la utilización de las APIs del navegador relacionadas con la gestión del DOM, de los eventos o de los estilos, para, con todo ello, presentar una `aplicación web muy sencilla`_ que permite añadir dinámicamente contenido a una página web e interactuar con el contenido añadido. 

.. _`aplicación web muy sencilla`: _static/data/ejemplo-apis-js.html

.. admonition:: Hazlo tú ahora
  :class: hazlotu

  Lee los comentarios para entender el propósito de cada línea, pero ten en cuenta que en actividades posteriores ampliaremos estos elementos. Estudia después todos los vídeos de la serie "Una aplicación web sencilla con JavaScript" en los que se comenta este código con detalle: `parte 2-1`_, `parte 2-2`_, `parte 2-3`_, `parte 2-4`_ y `parte 2-5`_. Repasa después, otra vez, el código y asegúrate de que ahora comprendes mejor cada una de sus instrucciones.

  .. _`parte 2-1`: https://drive.google.com/file/d/1YUI7AIgzHO9vcGnmxJ9h84YyEZy9MnXi/view?usp=sharing
  .. _`parte 2-2`: https://drive.google.com/file/d/1g_enM9nz9iVIsGJYmV_HOUORdIs6PUeA/view?usp=sharing
  .. _`parte 2-3`: https://drive.google.com/file/d/1Iw6z9tf4Jc-XztH7sDa16LANPVF56xDw/view?usp=sharing
  .. _`parte 2-4`: https://drive.google.com/file/d/1Py4eM_Zu8EHW6hIqw1JXktSVnGuSw47j/view?usp=sharing
  .. _`parte 2-5`: https://drive.google.com/file/d/16ZE7bQHXPTcRO7xCbqml_9m-nsenmgBB/view?usp=sharing


.. literalinclude:: _static/data/ejemplo-apis-js.html
  :language: html
  :linenos:


.. Note:: 

  Observa lo que se menciona sobre ataques XSS en los comentarios del código anterior. En un entorno de producción nunca deberías integrar una subcadena no verificada (por ejemplo, un valor introducido por el usuario en un formulario o el resultado devuelto por un servidor) en una cadena que se asigna a un atributo ``innerHTML``, ya que el intérprete de JavaScript analiza e interpreta toda la cadena como HTML y podría terminar ejecutando código no deseado. La mejor recomendación es que uses ``innerHTML`` para crear rápidamente nodos, pero que cuando vayas a añadir contenido de terceros lo metas directamente como valor del atributo ``node.textContent``, donde ``node`` es el nodo donde quieres insertar el texto. El navegador no intenta interpretar el contenido de ``textContent`` como HTML, sino que lo considera como texto plano, por lo que no hay riesgos en este caso. Modifica el código anterior para que funcione de esta manera.

.. Note::

  Cuando se pulsa la tecla *enter* en un cuadro de texto, la especificación de HTML dicta que se ha de generar el evento de *click* sobre el *botón por defecto* del formulario en lo que se denomina un *envío implícito*. Si este evento tiene un manejador asociado, se ejecutará como de costumbre. Las reglas para determinar cuál es el botón por defecto cuando hay más de uno no son relevantes ahora. En el caso del ejemplo, cada formulario tiene un único botón, por lo que no hay duda posible.  

.. Note::

  El comportamiento por defecto de un navegador cuando se pulsa el botón de enviar es borrar el contenido actual de la página, realizar una petición al servidor y mostrar en el navegador la respuesta recibida. Si no se ha identificado ninguna dirección para el servidor (usualmente, en el atributo ``action`` del elemento ``form``), el navegador recarga el documento actual.

  En lugar del código del ejemplo que evita esto, también podríamos llamar a ``preventDefault`` desde las funciones manejadoras del *click* (``creaSección``, ``marcaDesmarcaUnaSección``, etc). Bastaría declarar en ellas un parámetro para la información del evento y llamar al método ``preventDefault`` sobre él. Lo importante es "interceptar" el evento en algunos de los manejadores asociados y "cortocircuitar" el comportamiento por defecto del navegador. De esta forma, podemos también conseguir efectos como que los caracteres tecleados en un cuadro de entrada no se muestren (el comportamiento por defecto) salvo si son numéricos, por ejemplo. 


.. _label-api-web-js:

Las APIs del navegador para programar el lado del cliente
---------------------------------------------------------

Los navegadores incluyen una serie de librerías estandarizadas para programar la parte de la aplicación web que se ejecuta en el navegador (lo que se conoce como el *front-end* de la aplicación, en oposición al *back-end*, que denotaría la parte del servidor). En esta actividad profundizaremos en las APIs para el manejo del árbol DOM, la gestión de eventos y el control de estilos. Otras APIs, como la que permite realizar peticiones asíncronas desde el cliente a un servidor, se explorarán más adelante.

.. admonition:: Hazlo tú ahora
  :class: hazlotu

  Estudia todos los vídeos de la serie "El API del navegador para JavaScript" en los que se presentan los elementos principales del lenguaje: `parte 3-1`_, `parte 3-2`_, `parte 3-3`_, `parte 3-4`_, `parte 3-5`_, `parte 3-6`_ y `parte 3-7`_. Practica después con todas las funciones con la consola de JavaScript de las Chrome Devtools o con entornos como CodePen_.

  .. _`parte 3-1`: https://drive.google.com/file/d/1Q-H8iZpfQ8k2h0DhMbp1hOxRK37SrCQB/view?usp=sharing
  .. _`parte 3-2`: https://drive.google.com/file/d/1Fa4r4IPDKBHFhWOMCaX9Ca2BLb-TiljQ/view?usp=sharing
  .. _`parte 3-3`: https://drive.google.com/file/d/1IYKnaNmt6LJO0zMp8jM5AtriYfY6FK1s/view?usp=sharing
  .. _`parte 3-4`: https://drive.google.com/file/d/1cbN_pIzpt0CPkFp5vv2szHyd7EYCQfS4/view?usp=sharing
  .. _`parte 3-5`: https://drive.google.com/file/d/1TFYTXsrpO5-vi9aXIdrImPAFu4ZdP4Sz/view?usp=sharing
  .. _`parte 3-6`: https://drive.google.com/file/d/1ySWqKaravIKkI8s860FL8ZoB73t7cinm/view?usp=sharing
  .. _`parte 3-7`: https://drive.google.com/file/d/1eJjgloOm5q8RVyeQDtpr6FKUpjlGjJ2w/view?usp=sharing
  .. _CodePen: http://codepen.io/

Los conceptos que tienes que estudiar de estas APIs se encuentran recogidos en `estas otras diapositivas`_.

.. _`estas otras diapositivas`: ./slides/150-apidom-slides.html

Ten en cuenta que las funciones de *callback* se ejecutan en el (único) hilo de tu programa pero cuando les toque (se van apilando conforme están listas para ser invocadas). El navegador nunca va a interrumpir la ejecución de tu código hasta que acabe lo que esté haciendo. Por ejemplo, si se está ejecutando un manejador de evento de clic, hasta que la función manejadora no acabe, el intérprete no se irá a la cola a ver si hay alguna otra función de *callback* esperando a ser llamada.

.. Important::

  A la hora de usar funciones y atributos que permiten acceder a listas de nodos o elementos del árbol DOM es importante que conozcas un par de conceptos. 
  
  Por un lado, las listas pueden ser *vivas* o *estáticas*. Por ejemplo, las funciones ``getElementsByClassName`` o ``getElementsByTagName`` se usan para obtener una lista de elementos en base al valor del atributo ``class`` o del tipo de etiqueta, respectivamente, y la lista devuelta está *viva* en tanto que si con posterioridad a la llamada a la función añadimos un nuevo nodo al DOM que cumpla con el criterio correspondiente, el *array* se ampliará para incluirlo (haz la prueba). La función ``querySelectorAll``, sin embargo, devuelve una lista *estática* que permanece inalterada por mucho que se incorporen nuevos nodos al árbol (compruébalo).

  Por otro lado, está la distinción entre las funciones (o atributos) que devuelven *elementos* o *listas de elementos* (lo que excluye, por ejemplo, a los nodos con texto), y las que devuelven *nodos* o *listas de nodos*. Cuando hablamos de listas, las primeras se basan en el tipo ``HTMLCollection`` y las segundas en ``NodeList``. Cuando hablamos de items individuales, los tipos son ``Element`` y ``Node``, respectivamente. Por ejemplo, atributos como ``childNodes`` o ``nextSibling`` contienen nodos, mientras que ``children`` o ``nextElementSibling`` contienen elementos. Normalmente, nos interesarán las listas de tipo ``HTMLCollection`` porque querremos recorrer los elementos incluidos en otro elemento, pero en otras ocasiones, puede servir más a nuestro objetivo tener una lista de tipo ``NodeList`` que no excluye ningún nodo del árbol DOM, ni siquiera los que contienen texto o espacios en blanco.


.. Note::

  Una idea básica para comprender la gestión de eventos es el hecho de que cuando, por ejemplo, se hace clic en un pixel concreto de la ventana del navegador, es posible que este evento dispare la ejecución de más de un manejador de eventos. Considera el siguiente código en HTML:

  .. code-block:: html
    :linenos:

    <div id="prnt">
      hello
      <div id="child">
        bye
      </div>
    </div>

  Y el siguiente código en JavaScript:

  .. code-block:: javascript
    :linenos:

    function prnt() {console.log("parent clicked");}
    function child() {console.log("child clicked");}
    var p = document.getElementById("prnt");
    var c = document.getElementById("child");
    p.addEventListener("click",prnt,true);
    c.addEventListener("click",child,true);

  Si se hace clic en la palabra *bye*, se está haciendo clic en ambos ``div`` y no solo en el más interno, por lo que procede ejecutar ambos manejadores, como puedes comprobar aquí_.

  .. _aquí: http://jsfiddle.net/rLv1cob7/

  Respecto a la existencia de las dos fases de captura y *burbujeo*, en la mayoría de los casos no será muy relevante en qué fase se ejecuta un determinado manejador. De hecho, en las primeros años de la web y antes de la estandarización de la gestión de eventos, los navegadores solían implementar una de las dos fases, pero no ambas.


.. Note::

  Dado que el objetivo de esta asignatura no es desarrollar aplicaciones con un rendimiento elevado, podemos usar ``innerHTML`` para añadir contenido a un nodo del árbol DOM. Sin embargo, has de saber que esta práctica puede llegar a ser especialmente ineficiente y, además, producir errores difíciles de detectar para programadores nóveles. Así, considera el siguiente código HTML:

  .. code-block:: html
    :linenos:

    <ul id="x">
      <li lang="es">azul</li>
    </ul>

  Y el siguiente código en JavaScript:

  .. code-block:: javascript
    :linenos:

    var lista = document.querySelector('#x');
    var item = lista.querySelector('li');
    console.log(item.parentNode.id);  // imprime x
    lista.innerHTML += '<li lang="en">blue</li>';
    console.log(item.parentNode.id);  // excepción

  La última línea no tiene el efecto inicialmente esperado y lanza una excepción, porque ``item.parentNode`` vale ``null`` y, por tanto, no es posible acceder a ningún atributo ``id``. Las cadenas son inmutables en JavaScript por lo que la cuarta línea implica una lectura y una reescritura completas como vamos a ver. Para entender mejor lo que ocurre, recuerda que la penúltima línea es equivalente a:

  .. code-block:: javascript
    :linenos:

    lista.innerHTML = lista.innerHTML + '<li lang="en">blue</li>';

  El operando izquierdo de la concatenación se obtiene recorriendo todo el subárbol interno del nodo apuntado por ``lista`` y convirtiéndolo a una representación en forma de una nueva cadena en memoria. A continuación, esta cadena se concatena con la cadena literal del operando derecho y el resultado deviene una nueva cadena en memoria. Finalmente, se asigna esta nueva cadena al atributo ``innerHTML`` del nodo apuntado por ``lista``. Como consecuencia de esto último, es necesario analizar la cadena (lo que en inglés se conoce como *parsing*) e ir construyendo un subárbol (estrictamente, una colección de nodos, ya que no tiene por qué haber un nodo raíz como, de hecho, pasa en este caso) en base a su contenido. Los nuevos nodos reemplazan entonces el contenido anterior del nodo ``lista``. En cualquier caso, estos viejos nodos no serían eliminados definitivamente de la memoria si hubiera variables apuntando a ellos, lo que explica que en la última línea del código anterior la variable ``item`` siga referenciando el nodo original (``item.textContent`` sigue valiendo *azul*, por ejemplo), pero este se haya convertido en un nodo huérfano, con lo que ``item.parentNode`` valdrá ``null``. Todo el proceso, además, es altamente ineficiente, como habrás observado. Y esto se notará especialmente si el subárbol que se está reemplazando es grande.
  
  En resumen, puedes usar ``innerHTML`` para añadir contenido a un nodo del árbol DOM, pero hazlo con cuidado y conocimiento de causa. Si quieres escribir código eficiente, el API de JavaScript de los navegadores incluye la función ``insertAdjacentHTML`` que permite insertar contenido (en diferentes posiciones) en un nodo del árbol DOM sin necesidad de reemplazar todo el contenido existente. Así, para que nuestro código de ejemplo no falle, bastaría con reemplazar las últimas líneas por:

  .. code-block:: javascript
    :linenos:

    lista.insertAdjacentHTML('beforeend','<li lang="en">blue</li>');
    console.log(item.parentNode.id);  // imprime x


Herramientas para desarrolladores
---------------------------------

Las herramientas para desarrolladores que incorporan los navegadores permiten depurar el código en JavaScript de la parte del cliente de una aplicación web.

.. admonition:: Hazlo tú ahora
  :class: hazlotu

  Familiarízate con las opciones de depuración de JavaScript de las pestañas :guilabel:`Console` y :guilabel:`Sources` del entorno de las Chrome DevTools siguiendo estas páginas de su documentación: `Console Overview`_ , `Get Started`_, `Pause your Code with Breakpoints`_ y `JS Debugging Reference`_. Practica las distintas posibilidades en DevTools con una aplicación web como la de la primera actividad de este tema.

  .. _`Console Overview`: https://developers.google.com/web/tools/chrome-devtools/console
  .. _`Get Started`: https://developers.google.com/web/tools/chrome-devtools/javascript
  .. _`Pause your Code with Breakpoints`: https://developers.google.com/web/tools/chrome-devtools/javascript/breakpoints
  .. _`JS Debugging Reference`: https://developers.google.com/web/tools/chrome-devtools/javascript/reference

.. Note::

  Otra opción para pausar la ejecución del código JavaScript en un determinado punto es añadir la instrucción ``debugger`` (recogida en el estándar de ECMAScript) en una línea. Si las herramientas de desarrolladores están abiertas, la ejecución se detendrá en esa línea como si hubiéramos definido un punto de ruptura::

    function foo (x) {
      if (x < 0) {
        debugger;
        return x*x;
      }
    }

.. Note::

  A la hora de depurar aplicaciones web, especialmente en lo que respecta a la gestión de eventos, suele ser importante poder identificar qué eventos están asociados con un determinado elemento del DOM y cuándo se activan. Las herramientas de desarrolladores de los navegadores permiten inspeccionar y depurarlos. En Google Chrome, por ejemplo, hay dos enfoques que puedes seguir para investigar los manejadores de eventos en tu aplicación: desde la pestaña *Elements* y utilizando la funcionalidad de pausa en eventos en la pestaña *Sources*.

  Desde la pestaña *Elements*, puedes seleccionar cualquier elemento del DOM para examinar sus detalles, incluidos los eventos asociados a dicho elemento. Una vez seleccionado el elemento, en el panel lateral derecho encontrarás la sección de *Event Listeners*. Esta sección proporciona una lista detallada de todos los eventos que se han asociado con el elemento seleccionado, permitiendo incluso navegar al fragmento de código donde se define el manejador del evento.

  Por otro lado, la funcionalidad de pausa en eventos se encuentra en la pestaña *Sources*. En el panel lateral derecho, despliega la sección de *Event Listener Breakpoints*. Aquí puedes marcar las casillas correspondientes a los tipos de eventos en los que estés interesado. Al hacerlo, el depurador se pausará automáticamente cada vez que se dispare uno de estos eventos, permitiéndote inspeccionar el estado de la aplicación en ese momento.

.. _label-js-objetos:

Objetos y prototipos
--------------------

La manera en la que se gestionan los objetos en JavaScript es diferente a la que puedas conocer por otros lenguajes como Java o C++. JavaScript sigue el paradigma de la *programación basada en prototipos*, que algunos denominan también programación orientada a objetos *sin clases*. Para familiarizarte con este enfoque de la programación orientada a objetos, vas en esta ocasión a leer un texto en inglés, lo que te permitirá no solo profundizar en el tema, sino desarrollar tu habilidad para leer documentación en este idioma (recuerda que las fuentes primarias de documentación tecnológica suelen estar en inglés y que muchas veces el tiempo necesario para que haya información de calidad en otros idiomas sobre una materia novedosa puede ser inaceptablemente largo). En la actividad ":ref:`label-intro-js`" ya realizamos una introducción rápida a los objetos en JavaScript. Ahora vamos a estudiarlos con más detalle.

.. admonition:: Hazlo tú ahora
  :class: hazlotu

  Lee el capítulo "`The secret life of objects`_" de la tercera edición del libro con licencia abierta "`Eloquent JavaScript`_". Practica por tu cuenta cada concepto estudiado con un intérprete de JavaScript. Lee únicamente desde el principio hasta el apartado "`Overriding derived properties`_" incluido.

  .. _`The secret life of objects`: https://eloquentjavascript.net/06_object.html
  .. _`Eloquent JavaScript`: https://eloquentjavascript.net/
  .. _`Overriding derived properties`: https://eloquentjavascript.net/06_object.html#h_oUlUep3Os8

  La recomendación es que leas el fragmento del capítulo en su idioma original, pero si te cuesta seguir el texto de este modo, puedes leer una `versión traducida automáticamente del capítulo`_. Recuerda que aunque la traducción automática entre lenguas similares ha mejorado mucho en los últimos años, los sistemas aún cometen errores que en ocasiones son difíciles de detectar porque la frase traducida *suena bien* en español, por ejemplo, pero no refleja el significado de la original en inglés. Desde el enlace anterior puedes ir alternando entre la versión traducida automáticamente y el texto original con los botones de la parte superior; además, si consultas la versión traducida automáticamente y colocas el puntero del ratón sobre una frase, se mostrará un texto flotante con el original. Si lees la versión traducida automáticamente, ve consultando el original para asegurarte de que el sistema no ha alterado su significado. Ten especial cuidado con el código en JavaScript cuyas variables o palabras reservadas, por ejemplo, pueden haber sido traducidas erroneamente.

  .. _`versión traducida automáticamente del capítulo`: https://translate.google.es/translate?hl=es&sl=en&tl=es&u=https%3A%2F%2Feloquentjavascript.net%2F06_object.html

De cara a comprender mejor el capítulo sobre la vida secreta de los objetos, se muestran a continuación algunas notas que te pueden servir para terminar de comprender los conceptos allí introducidos. 

.. Important::

  En primer lugar, no hay que confundir la propiedad ``prototype`` de una función con el prototipo de un objeto. El prototipo de un objeto, entendido como un segundo objeto que contiene el conjunto de funciones y atributos compartidos con otros objetos, se almacena en una propiedad *interna* llamada ``[[Prototype]]`` que no es directamente accesible desde tu código. No obstante, consultar o modificar esta propiedad interna se puede hacer indirectamente de dos formas:

  - Usando el atributo ``__proto__`` de un objeto, atributo que muchos navegadores han venido soportando pero que el estándar de ECMAScript solo ha reconocido recientemente, señalándolo, eso sí, como un atributo en vías de extinción (*deprecated*). Significa esto que puedes usarlo para acceder rápidamente al prototipo de un objeto mientras haces pruebas desde la consola del navegador o en la fase de desarrollo de un programa, pero nunca deberías usarlo sobre aplicaciones en producción porque futuras versiones de los navegadores podrían no soportarlo.
  - Mediante las funciones ``Object.getPrototypeOf()`` y ``Object.setPrototypeOf()`` reconocidas por el estándar del lenguaje como la forma correcta de acceso al prototipo interno.

  El prototipo (interno) por defecto de los objetos de JavaScript es ``Object.prototype``, es decir, el prototipo (visible) de la función ``Object``. 
  
  Por otro lado, el valor por defecto del prototipo (visible) de una función es un objeto que contiene una única propiedad llamada ``constructor`` que apunta a la propia función.

.. Note::

  El estándar de JavaScript solo permite usar ``__proto__`` en un contexto muy concreto para inicializar el prototipo de un objeto a la vez que este se define literalmente. Por ejemplo, el siguiente código crea un objeto ``x`` con el prototipo ``y``:

  .. code-block:: javascript
    :linenos:

    let y = {a: 1};
    let x = {b: 2, __proto__: y};
    console.log(x.a+x.b);  // 3

Un prototipo no deja de ser un objeto con una serie de atributos y funciones como el siguiente:

.. code-block:: javascript
  :linenos:

  protoOkapi = {
    habla() { console.log("¡Hola!"); }
  }

La definición anterior no parece seguir la notación que habíamos estudiado para crear objetos literalmente, pero lo que ocurre aquí es simplemente que, si omitimos el nombre de la propiedad, se utilizará para ella el mismo nombre que el de la función correspondiente, por lo que lo anterior es más o menos equivalente a:

.. code-block:: javascript
  :linenos:

  protoOkapi = {
    habla: function habla() { console.log("¡Hola!"); }
  }

Y también es equivalente  a:

.. code-block:: javascript
  :linenos:

  protoOkapi = {
    habla: function() { console.log("¡Hola!"); }
  }

La función ``habla`` no tiene en principio nada especial; podemos invocarla para que imprima el saludo con ``protoOkapi.habla()``. 

Una vez tenemos nuestro prototipo, podemos crear objetos que lo usen y *hereden* sus propiedades mediante la función ``Object.create()``. Vamos a usarla en una función que, además de crear un objeto con dicho prototipo, asigna a ese objeto en particular un atributo con la edad del animal:

.. code-block:: javascript
  :linenos:
  :force:

  function creaOkapi(proto,edad) {
    let okapi= Object.create(proto);
    okapi.edad= edad;
    return okapi;
  }

Con estos ingredientes, podemos crear dos objetos que representen sendos okapis:

.. code-block:: javascript
  :linenos:

  let o1= creaOkapi(protoOkapi,2);
  let o2= creaOkapi(protoOkapi,4);
  o1.habla();
  o2.habla();

Aunque cada okapi tiene su propio atributo ``edad`` (puedes imprimir ``o1.edad`` y ``o2.edad``), el código de la función ``habla`` no está duplicado en memoria, porque solo existe una instancia de la función (recuerda que las funciones son objetos de clase ``Function`` y podemos, por tanto, manejar referencias a ellas) dentro del prototipo. Cuando escribimos ``o1.edad`` el atributo se encuentra directamente en el objeto (en inglés se dice que el atributo es una *own property* del objeto), pero cuando escribimos ``o1.habla()``, la función no es un atributo directo de ``o1``, sino que, al no encontrarlo en el objeto, el intérprete lo busca en su prototipo (se dice que la función es una *inherited property* del objeto).

Como hemos comentado, podemos acceder al prototipo del objeto con ``Object.getPrototypeOf(o1)`` y en muchos navegadores, aunque no recomendado, con ``o1.__proto__``. De hecho, en un navegador que soporte ``__proto__`` la comparación ``Object.getPrototypeOf(o1) === o1.__proto__`` devolverá ``true`` porque el prototipo no deja de ser un único objeto en memoria. También devolverá cierto la expresión ``o1.__proto__ === protoOkapi`` en nuestro caso. Ahora bien, si el prototipo de un objeto es a su vez un objeto, como hemos visto, ¿cuál es el resultado de ``o1.__proto__.__proto__`` o, dicho de otra forma, cuál es el prototipo del objeto ``protoOkapi``? Si mostramos el contenido de la expresión ``o1.__proto__.__proto__`` por la consola del navegador, veremos un objeto con una serie de métodos como ``toString``, entre otros. Estos métodos vienen del prototipo de ``Object``, es decir, ``Object.prototype``, que es el prototipo usado por defecto para los objetos para los que no se define un prototipo específico. La expresión ``Object.prototype === o1.__proto__.__proto__`` se evalúa, por tanto, a cierto.

El método ``habla`` definido anteriormente se limita a imprimir siempre la misma cadena. Los métodos, sin embargo, suelen utilizar los atributos del objeto sobre el que se invocan. Como el intérprete de JavaScript se encarga de vincular ``this`` al objeto sobre el que se ejecuta un método, podemos hacer que la función ``habla`` imprima la edad del okapi con otro prototipo:

.. code-block:: javascript
  :linenos:

  protoOkapi = {
    habla() { console.log("¡Hola! Tengo "+this.edad+" años."); }
  }
  let o3= creaOkapi(protoOkapi,6);
  o3.habla();

Obviamente, si invocamos ``habla`` directamente haciendo ``protoOkapi.habla()``, la variable ``this.edad`` valdrá ``undefined``. Observa que podemos asociar una nueva función al okapi ``o1`` haciendo:

.. code-block:: javascript
  :linenos:

  o1.camina = function() { console.log("Caminando voy."); }
  o1.camina();

Pero, al no pertenecer al prototipo, la función ``camina`` solo existe para el objeto ``o1``; se trataría, por tanto, de una *own property* del objeto. Si intentamos invocar ``o3.camina()``, obtendremos un error porque ``o3`` no tiene esa función. En cambio, si añadimos la función al prototipo, todos los objetos que lo usen tendrán acceso a ella.

.. Note::

  La variable polimórifica ``this`` se revincula cada vez que se llama a una función por lo que no podremos usarla desde una función interna para referirnos al objeto ``this`` de la función externa, excepto si la función interna es una función flecha. Para ilustrarlo, considera el siguiente bloque HTML:
  
  .. code-block:: html
    :linenos:
    :force:

    <div id="w">
      <div id="x">X</div>
    </div>
  
  Cuando se hace clic en la equis mayúscula, el siguiente código de JavaScript muestra por consola la cadena ``w``, excepto en el segundo caso en el que se produce una excepción por tener ``this.parentNode`` el valor ``undefined``:

  .. code-block:: javascript
    :linenos:
    :force:

    document.querySelector("#x").addEventListener("click",
      function () {
        console.log(this.parentNode.id);
      });
    document.querySelector("#x").addEventListener("click",
      function () {
        setTimeout(function () {
          console.log(this.parentNode.id)
        }, 1000);
      });
    document.querySelector("#x").addEventListener("click",
      function () {
        var this2= this;
        setTimeout(function () {
          console.log(this2.parentNode.id)
        }, 2000);
      });
    document.querySelector("#x").addEventListener("click",
      function () {
        setTimeout(() => {
          console.log(this.parentNode.id)
        }, 3000);
      });

  Observa cómo en el tercer caso salvaguardar el ``this`` externo en la variable local ``this2`` de la función externa garantiza una clausura adecuada entre la función interna y una copia de la referencia a ``this``.
  

Una representación gráfica de la disposición en memoria de los diferentes objetos resultantes del código anterior es la siguiente:

.. figure:: _static/img/okapi1.svg
  :target: _static/img/okapi1.svg
  :alt: objetos y prototipos en memoria
  :figwidth: 70 %

  Representación en memoria de los objetos creados en el código de la actividad.


JavaScript tiene una sintaxis alternativa ligeramente más sencilla para crear objetos. Esta segunda forma se basa en definir una *función constructora*, asignar propiedades a su prototipo y utilizar la palabra reservada ``new``:

.. code-block:: javascript
  :linenos:

  function Okapi (edad) {
    this.edad= edad;
  }
  Okapi.prototype.charla= function () {
    console.log("¿Qué tal? Tengo "+this.edad+" años.");
  }
  let o4= new Okapi(8);
  o4.charla();


.. Important::

  El operador ``new`` hace aquí muchas cosas:

  - crea un nuevo objeto;
  - asigna como prototipo de este nuevo objeto (es decir, como valor de la propiedad interna e inacesible ``[[Prototype]]``, la misma a la que podemos acceder con ``Object.getPrototypeOf()`` o en algunos navegadores con ``__proto__``) el mismo objeto que el referenciado por la propiedad externa y accesible de nombre ``prototype`` del constructor (en este caso, ``Okapi.prototype``, objeto al que hemos añadido la función ``charla``);
  - hace que ``this`` apunte al nuevo objeto;
  - ejecuta la función constructora;
  - devuelve el objeto creado (que en este caso será asignado a la variable ``o4``).


Cada vez que creamos una función, el objeto que la representa recibe un atributo ``prototype``, que es un objeto con un atributo ``constructor`` que referencia a la misma función. Además, como cualquier objeto de JavaScript, el objeto de la función tiene un prototipo interno que inicialmente se basa en el prototipo de la clase predefinida ``Object`` (equivalentemente, la función ``Object()``), esto es, ``Object.prototype``, que contiene una serie de métodos básicos como ``toString``. Cuando sobre el objeto creado (``o4`` en nuestro caso) invocamos una función, esta se busca en primer lugar en los atributos del objeto; si no se encuentra allí, se busca en su prototipo (allí el intérprete encontraría, por ejemplo, la función ``charla``); si no se encuentra allí, se busca en el prototipo de su prototipo (allí el intérprete se encontraría con la función ``toString``) y así sucesivamente hasta llegar al prototipo de ``Object``. Observa el paralelismo de este comportamiento con la herencia de lenguajes de programación como Java o C++, aunque su implementación es muy diferente.

.. Note::

  En cualquier momento durante la ejecución del programa, podemos añadir nuevos métodos a un prototipo y todos los objetos vinculados a él (tanto los ya existentes como los nuevos que se creen) recibirán dinámicamente el nuevo método.

Más recientemente, JavaScript ha incorporado la palabra reservada ``class`` que permite crear objetos y asociarles prototipos de una forma más parecida a como otros lenguajes definen clases y crean objetos. En realidad, esta otra manera de definir los objetos es lo que se conoce como *azúcar sintáctica*, porque no añade nuevas características al lenguaje, sino que el intérprete transforma la nueva notación a la clásica basada en prototipos que hemos visto:

.. code-block:: javascript
  :linenos:

  class OkapiBis { 
    constructor(edad) { 
      this.edad= edad;
    } 
    charla() {
      console.log("¿Qué tal? Tengo "+this.edad+" años.");
    }
  }
  
  let o5= new OkapiBis(10);
  o5.charla();
  o5.toString();

Finalmente, encadenando prototipos podemos definir relaciones de herencia, lo que con la nueva notación se puede hacer con la palabra reservada ``extends``:

.. code-block:: javascript
  :linenos:

  class Empleado {
    constructor(nombre,apellidos) {...}
    getNombreCompleto() {...};
  }

  class Director extends Empleado {
    constructor(nombre,apellidos) {
      super(nombre,apellidos);
      this._empleados = [];
    }
    añadeEmpleado(empleado) {
      this._empleados.push(empleado);
    }
  }

Para acabar, daremos un ejemplo de herencia usando la notación clásica de JavaScript:

.. code-block:: javascript
  :linenos:

  // Clase base
  function CuerpoCeleste(nombre) {
      this.nombre = nombre;
  }

  CuerpoCeleste.prototype.obtenerInformacion = function() {
      return `${this.nombre} es un cuerpo celeste en el universo.`;
  };

  // Clase derivada
  function Planeta(nombre, tieneVida) {
      CuerpoCeleste.call(this, nombre);
      this.tieneVida = tieneVida;
  }

  // Establece el [[Prototype]] de Planeta.prototype a CuerpoCeleste.prototype
  Object.setPrototypeOf(Planeta.prototype, CuerpoCeleste.prototype);

  Planeta.prototype.verificarVida = function() {
      return this.tieneVida ? `¡El planeta ${this.nombre} tiene vida!` : `El planeta ${this.nombre} no tiene vida.`;
  };

  // Atributo estático
  Planeta.cantidadPlanetasConocidos = 8;

  let tierra = new Planeta('Tierra', true);
  console.log(tierra.obtenerInformacion());  // Tierra es un cuerpo celeste en el universo.
  console.log(tierra.verificarVida());       // ¡El planeta Tierra tiene vida!
  console.log(Planeta.cantidadPlanetasConocidos); // 8

Observa cómo al establecer el ``[[Prototype]]`` de ``Planeta.prototype`` a ``CuerpoCeleste.prototype`` con la llamada a ``Object.setPrototype``, estamos consiguiendo encadenar los prototipos de forma que cualquier objeto que se cree haciendo ``new Planeta()`` tendrá como prototipo un objeto cuyo prototipo apunta a la información de la clase base ``CuerpoCeleste``. Por otro lado, la función ``call`` permite llamar a una función con un determinado valor para ``this`` y con los argumentos que se deseen. La representación en el *heap* de todos los objetos implicados y sus dependencias es la siguiente:

.. figure:: _static/img/planetas-prototipos.png
  :target: _static/img/planetas-prototipos.png
  :alt: objetos y prototipos en memoria
  :figwidth: 100 %

  Representación en memoria de los objetos creados en el código de cuerpos celestes y planetas.

.. Note::

  Observa cómo la variable estática del código anterior se ha implementado como una *own property* del objeto ``Planeta`` a la que podemos acceder mediante ``Planeta.cantidadPlanetasConocidos`` o también mediante ``tierra.constructor.cantidadPlanetasConocidos``. En principio, podríamos pensar que otra forma de implementar variables de clase sería añadiéndolas a ``Planeta.prototype`` mediante un código como ``Planeta.prototype.cantidadPlanetasConocidos = 8``. Sin embargo, aunque esto permitiría acceder en modo lectura a las variable desde los objetos instanciados (haciendo ``tierra.cantidadPlanetasConocidos``), en el momento en que intentáramos modificar el valor (por ejemplo, con ``tierra.cantidadPlanetasConocidos = 9``), estaríamos creando una nueva *own property* en el objeto ``tierra`` que ocultaría la variable de clase. Es por ello, que la forma correcta de implementar variables de clase es añadiéndolas directamente al objeto ``Planeta``.
  
  
.. _label-js-clausuras:

Ámbitos y clausuras
-------------------

En JavaScript es habitual definir una función dentro de otra de forma que la función interna utilice variables definidas en el ámbito de la externa y *sobreviva* a ella, en el sentido de que la función interna acabe ejecutándose cuando la externa ya finalizó:

.. code-block:: javascript
  :linenos:

  function creaLista() {
    var list = document.querySelector("#list");
    for (let i = 1; i <= 5; i++) {
      let item = document.createElement("li");
      item.appendChild(document.createTextNode("Elemento " + i));
      item.addEventListener("click", function (e) {
        console.log("Se ha hecho clic en el elemento "+i+".");
      }, false);
      list.appendChild(item);
    }
  }

Para que este código funcione es necesario que las variables locales de la función externa no se destruyan al finalizar la ejecución de la función como ocurriría en principio con todas sus variables locales cuando son eliminadas de la pila. Una *clausura* de JavaScript es la combinación de una función (como la función manejadora de evento del código anterior) junto con las variables locales del ámbito exterior que utiliza (la variable ``i`` en este caso). Una clausura se implementa como un registro que almacena una función y un entorno de la pila.

Las clausuras y su relación con las variables declaradas con ``var`` o ``let`` es uno de los aspectos que más cuesta entender a los programadores que acaban de empezar con JavaScript (con el permiso de los prototipos, claro). Existen cuatro tipos de ámbitos para las variables en JavaScript:

- ámbito de función: corresponde a las variables locales declaradas con ``var``; estas variables se almacenan en la pila y pueden usarse incluso antes de haber sido definidas; esto es así por un mecanismo conocido como *izado* (*hoisting*) que aupa las declaraciones de variables locales (pero no sus inicializaciones) al comienzo de la función; declarar dos o más veces una variable con ``var`` dentro de la misma función equivale a declararla una sola vez al comienzo de esta; si intentamos leer el valor de una variable antes de su declaración en el código y antes de haberle asignado ningún valor obtenemos el valor *undefined*;
- ámbito de bloque: corresponde a las variables locales declaradas con ``let``; estas variables se almacenan en la pila también, pero no hay ningún proceso de izado y la variable se circunscribe al ámbito en el que ha sido declarada; dos variables declaradas en ámbitos diferentes de una misma función tienen espacios separados en la pila; no se pueden declarar dos variables de este tipo con el mismo nombre dentro del mismo contexto; si se declara una variable con ``let`` dentro de un bucle, se reserva sitio en la pila para una variable distinta en cada iteración;  el uso de ``let`` está permitido en el lenguaje desde la versión 6 de ECMAScript, publicada en 2015, por lo que es normal que encuentres muchos ejemplos de código que no lo usan;
- ámbito global: corresponde a las variables globales declaradas fuera de cualquier función; estas variables se almacenan en el *heap* y sus declaraciones también son *izadas* al principio del ámbito global;
- ámbito léxico: corresponde al hecho de que una función definida dentro de otra función puede acceder a las variables locales de esta última; si una función interna *sobrevive* a la función contenedora, las variables referenciadas no se borran de la memoria (a la asociación entre la función y las variables externas se le conoce, como hemos mencionado, como *clausura*);

Las declaraciones de funciones locales y globales también sufren el mecanismo de izado en sus ámbitos respectivos.

.. admonition:: Hazlo tú ahora
  :class: hazlotu

  Estudia el siguiente código y ejécutalo después de dedicar un rato a pensar qué valores imprime por la consola.

  .. code-block:: javascript
    :linenos:

    function f() {
      var i = 0;
      var x = {};
      {
        var i = 0;
        x.f1 = function() {
          console.log(i);
        };
      }
      i++;
      {
        var i = 1;
        x.f2 = () => { console.log(i); };
      }
      i++;
      return x;
    }

    var x = f();
    x.f1();

  .. la barra introduce una línea en blanco en restructured text

La variable ``i`` se declara con ``var`` y, por tanto, su ámbito es el de la función ``f``. No importa que usemos ``var`` varias veces a continuación dentro de la función, incluso aunque estas declaraciones adicionales estén dentro de un nuevo ámbito. En la pila de ejecución solo se reserva sitio para una variable cuando se ejecuta la función y esta única posición es la que no se destruye al salir de la función debido a las clausuras que se crean por las dos funciones anónimas asignadas a ``x.f1`` y ``x.f2``. La variable ``i`` vale 2 al salir de la función y este valor es el que se usa al llamar a las dos funciones.

.. Note::

  Observa de paso que para introducir nuevos ámbitos no es necesario usar una instrucción condicional o un bucle, sino que en JavaScript, como en la mayoría de lenguajes, basta con encerrar un bloque de código entre llaves para conseguirlo.

Sin embargo, si usamos ``let`` en lugar de ``var`` en las declaraciones de ``i``, el ámbito de cada variable será el del bloque y tendremos tres variables distintas en la pila de ejecución justo antes de salir de la función. La primera de ellas será destruida en ese momento, pero las otras dos se *salvarán* de dicha destrucción para mantener las clausuras:

.. code-block:: javascript
  :linenos:

  function f () {
    let i=0;
    let x= {};
    {
      let i=0;
      x.f1= function() {
        console.log(i);
      };
    }
    i++;
    {
      let i=1;
      x.f2= () => {console.log(i);};
    }
    i++;
    return x;
  }

  let x= f();
  x.f1();
  x.f2();

.. admonition:: Hazlo tú ahora
  :class: hazlotu

  Las clausuras llevan fácilmente a confusión si no se entiende bien cómo funcionan. Intenta predecir la salida del siguiente código antes de ejecutarlo:

  .. code-block:: javascript
    :linenos:

    function f () {
      var funcs = [];
      for (var i = 0; i < 3; i++) {
        funcs[i] = function() {
          console.log("My value: " + i);
        };
        funcs[i]();  // Aquí se obtiene un resultado
      }
      return funcs;
    }

    var m= f();
    for (var j = 0; j < 3; j++) {
      m[j]();   // Aquí otro diferente
    }

  Intenta predecir ahora la salida cuando las variables se declaran con ``let`` en lugar de con ``var``:

  .. code-block:: javascript
    :linenos:

    function f () {
      var funcs = [];
      for (let i = 0; i < 3; i++) {
        funcs[i] = function() {
          console.log("My value: " + i);
        };
        funcs[i]();
      }
      return funcs;
    }

    var m= f();
    for (var j = 0; j < 3; j++) {
      m[j]();
    }

  Al usar ``let`` se crea un nuevo enlace entre la función interior y la variable del bucle en cada iteración. Comprueba después si tus predicciones eran correctas ejecutando el código en un intérprete de JavaScript.


Profundizar en JavaScript
-------------------------

JavaScript tiene obviamente muchos más elementos que los que hemos explorado en este tema. Si quieres ampliar por tu cuenta tu conocimiento del lenguaje, puedes seguir con referencias como "`The Modern JavaScript Tutorial`_", "`JavaScript for impatient programmers`_", "`Eloquent JavaScript`_" o "`Deep JavaScript: theory and techniques`_".

.. _`The Modern JavaScript Tutorial`: https://javascript.info/
.. _`JavaScript for impatient programmers`: https://exploringjs.com/impatient-js/index.html
.. _`Eloquent JavaScript`: https://eloquentjavascript.net/
.. _`Deep JavaScript: theory and techniques`: https://exploringjs.com/deep-js/index.html
