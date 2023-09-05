
Lenguajes de marcado
====================


HTML (*HyperText Markup Language*) es el lenguaje *declarativo* en el que están escritas las páginas web y es la piedra angular de la web. En este tema, aprenderemos sobre HTML centrándonos en las versiones más recientes del lenguaje.


.. Note::

  HTML es un *estándar vivo*, mantenido por el grupo de trabajo WHATWG_ (Web Hypertext Application Technology Working Group). Échale un vistazo por encima a la especificación_. Otra entidad, el W3C_ (World Wide Web Consortium), *empaqueta* la especificación estándar de vez en cuando y le asigna un número de versión (por ejemplo, 5.0 en 2014, 5.1 en 2016 o 5.2 en 2017). El W3C sí es el principal responsable de otros estándares de la web como CSS, que estudiaremos más adelante.

  .. _WHATWG: https://whatwg.org/
  .. _especificación: https://html.spec.whatwg.org/multipage/
  .. _W3C: https://www.w3.org/


.. Important::

  Las habilidades que deberías adquirir con este tema incluyen las siguientes:

  - Entender la diferencia entre un lenguaje de marcado con propósito semántico como HTML y un lenguaje de estilo.
  - Conocer la semántica de los elementos de HTML discutidos en clase.
  - Gestionar correctamente diferentes codificaciones de caracteres.
  - Saber crear documentos HTML válidos.
  - Usar correctamente las herramientas de desarrolladores integradas en navegadores; en particular, las Chrome DevTools.
  - Entender el papel jugado por un servidor web y cómo publicar en él contenido estático.


Sintaxis y elementos del lenguaje HTML
--------------------------------------

HTML es el lenguaje informático básico que se usa para escribir el contenido de las páginas web (por otro lado, CSS se usa para especificar los aspectos estéticos que afectan a la presentación de las páginas y JavaScript para programar los aspectos dinámicos). En esta actividad vas a conocer los elementos fundamentales de HTML. Te basarás para ello en el código de la página web mínima que aparece a continuación, que iremos ampliando con otros elementos del lenguaje. 


.. Attention::

  La forma normal de trabajar con HTML es usar tu editor de texto favorito para editar el fichero y abrir el documento resultante (con extensión ``.html``) en un navegador. No obstante, cuando se dan los primeros pasos en el aprendizaje del lenguaje puede ser más cómodo usar entornos en línea como JSBin_, que evitan tener que guardar y recargar constantemente. Hay otras herramientas similares como JSFiddle_ o CodePen_, pero son menos recomendables desde el punto de vista educativo, ya que ocultan ciertas partes del documento HTML (por ejemplo, la cabecera) para no *distraer* al usuario con elementos obvios.

  .. _JSBin: http://jsbin.com/
  .. _JSFiddle: https://jsfiddle.net/
  .. _CodePen: http://codepen.io/


Una de los documentos web más sencillos que se pueden escribir es el siguiente. Comienza con la declaración de tipo de documento (``doctype``). Le sigue el *elemento* (o *etiqueta*) raíz ``html`` con un *atributo* opcional ``lang`` que indica el idioma del texto. El elemento ``head`` incluye metadatos sobre el documento: en este caso, la codificación de caracteres utilizada (hablaremos sobre ello más adelante) y el título del documento que aparecerá en la pestaña del navegador. El elemento ``body`` contiene el texto principal del documento, que en este caso es un único párrafo (elemento ``p``) con un saludo.


.. code-block:: html
  :caption: Un documento HTML válido y corto.
  :linenos:

  <!doctype html>
  <html lang="es">
    <head>
      <meta charset="utf-8">
      <title>Título del documento</title>
    </head>
    <body>
      <p>¡Hola, mundo!</p>
    </body>
  </html>


Una de las ideas que tienes que tener más claras es que los diferentes elementos de HTML no representan propiedades *estéticas* de su contenido (como, por ejemplo, si un texto se muestra en negrita o si se ha de mostrar separado del texto precedente por un espacio vertical), sino únicamente propiedades *semánticas* (este texto enfatiza una determinada idea o este otro texto constituye un párrafo). Los aspectos estéticos se definen mediante lenguajes de estilo como CSS, que estudiaremos más adelante. Esta separación de presentación y contenido hace que el documento HTML sea independiente de la representación visual, táctil o auditiva que hagamos de él: en diferentes contextos podrían usarse diferentes hojas de estilo para el mismo documento; o un *screen reader* podría usar el contenido del bloque `nav` para permitir a una persona ciega elegir directamente qué sección del documento desea escuchar o consultar en un `terminal braille`_; o un programa que procesa automáticamente un documento HTML (por poner un ejemplo, un buscador) no tendría que lidiar con aspectos secundarios meramente cosméticos. Además, gracias a la *externalización* de los estilos en un fichero aparte, es posible reutilizar los mismos estilos en múltiples documentos de HTML sin tener que duplicar su definición.

.. _`terminal braille`: https://en.wikipedia.org/wiki/Refreshable_braille_display

.. Attention::

  Una parte importante de la sociedad tiene alguna discapacidad (visual, motora, intelectual...), ya sea congénita o adquirida (por enfermedad, accidente o edad, por ejemplo), que le puede dificultar la interacción con una página o aplicación web si esta no se desarrolla adecuadamente bajo principios de accesibilidad que atiendan a la diversidad funcional de la sociedad. El uso de HTML como lenguaje de anotación semántica de contenido es uno de los principios fundamentales para cumplir este objetivo.

HTML tiene aproximadamente un centenar de elementos diferentes, cada uno de ellos con un propósito semántico bien definido. En este curso vamos a estudiar un subconjunto de ellos, cuyo cometido puedes consultar en `MDN web docs`_ y que se muestran en este documento más completo_.

.. _`MDN web docs`: https://developer.mozilla.org/en-US/docs/Web/HTML/Element
.. _completo: _static/data/franz.html


.. admonition:: Hazlo tú ahora
  :class: hazlotu

  La especificación estándar de HTML es un documento demasiado técnico para los propósitos de este curso y para la mayoría de los desarrolladores. La web `MDN`_ muestra esta información de forma más sencilla. En principio, acostúmbrate a usar esta web como referencia, frente a otras que pueden aparecer más arriba en los resultados de los buscadores. Usa la versión en inglés, ya que otros idiomas no siempre están actualizados. Estudia en `MDN web docs`_ todos los elementos de HTML que aparecen en este tema y asegúrate de que entiendes su propósito. Elementos adicionales, como los relacionados con los formularios, se estudiarán en otro tema. Reserva cita para tutoría si crees que no lo tienes todo claro.

  .. _MDN: https://developer.mozilla.org/en-US/

El código del documento HTML más completo enlazado anteriormente es el siguiente:

.. literalinclude:: _static/data/franz.html
  :language: html
  :linenos:

.. ficheros de código: ../../code/a.java


Representación en memoria de un documento HTML
----------------------------------------------

Imaginemos que tenemos que escribir un programa que cargue en memoria un documento HTML para luego realizar algún procesamiento sobre sus elementos (por ejemplo, mostrarlo en la ventana de un navegador, extraer los datos de una tabla desde un programa en Java u obtener sus palabras para indexarlas en la base de datos de un buscador). La estructura de datos que se utiliza para ello es un árbol en el que cada nodo es un objeto que representa una parte del documento. El DOM (*Document Object Model*) es un conjunto estándar de métodos (una interfaz) independientes del lenguaje para interactuar con este árbol que suele, por tanto, llamarse *árbol DOM*. En un tema posterior estudiaremos algunos de los métodos del DOM, pero por ahora centrémonos en la forma del árbol.

La siguiente figura muestra parte de un árbol DOM:

.. figure:: https://upload.wikimedia.org/wikipedia/commons/5/5a/DOM-model.svg
  :target: https://commons.wikimedia.org/wiki/File:DOM-model.svg
  :alt: ejemplo de árbol DOM
  
  Árbol DOM por Birger Eriksson


.. admonition:: Hazlo tú ahora
  :class: hazlotu

  Dibuja el árbol DOM de los documentos HTML que hemos estudiado anteriormente y utiliza la herramienta `Live DOM Viewer`_ para comprobar si tu solución es correcta. Observa en especial el tratamiento que se hace de los espacios en blanco entre dos elementos: estos blancos tienen su propio nodo asociado lo que puede ser necesario tener en cuenta al movernos por el árbol. HTML es un lenguaje en el que, en general, las secuencias de más de un espacio en blanco, tabulador o salto de línea se tratan como si fueran un único espacio en blanco.

  .. _`Live DOM Viewer`: https://software.hixie.ch/utilities/js/live-dom-viewer/


.. Hint::

  Podría ser que en alguna ocasión necesites que entre dos elementos (por ejemplo, entre dos palabras) de tu página haya un espacio más grande lo habitual. Podrías en ese caso tener la tentación de usar la entidad ``&nbsp;`` (también ``&NonBreakingSpace;``), repetida varias veces, para obtener aproximadamente este espacio extra. Comprueba una vez cómo funciona (observa la diferencia entre ``a &nbsp;&nbsp; b`` y ``a b``) y luego no vuelvas a usarla nunca más (salvo para su verdadero propósito; sigue leyendo). Posteriormente veremos que, dentro del espíritu de separar presentación y contenido, son las hojas de estilo las que se han de encargar de definir de forma precisa la separación entre los elementos de una página. ¿Para qué existe entonces una entidad como ``&nbsp;``? Su propósito es indicar al navegador que nunca introduzca un salto de línea en el punto en el que aparece la entidad (cosa que el navegador puede decidir hacer con cualquier otro espacio en blanco) y la interprete estrictamente como un espacio en blanco. Escribe una latitud como ``40°&nbsp;41′&nbsp;21.4”&nbsp;N`` en un documento HTML, cambia el ancho de la ventana del navegador e intenta que se separen sus componentes en dos líneas consecutivas.



Herramientas para desarrolladores
---------------------------------

Los navegadores suelen incorporar de serie un conjunto de herramientas para facilitar el trabajo de los desarrolladores. En particular, a estas alturas del curso ya puedes usar el panel :guilabel:`Elements` de las *Chrome DevTools* para inspeccionar los distintos elementos de tu página; para ello, en el navegador Google Chrome (o Chromium) sitúa el puntero del ratón encima de alguna posición de tu página web y selecciona :guilabel:`Inspeccionar` en el menú contextual; otra opción para acceder a estas herramientas es abrirlas desde el menú :menuselection:`Más herramientas --> Herramientas para desarrolladores` del navegador o mediante el atajo de teclado :kbd:`Ctrl+Shift+I` o :kbd:`F12`. Existen extensiones similares para otros navegadores, como *Firebug* para *Mozilla Firefox*.

.. admonition:: Hazlo tú ahora
  :class: hazlotu

  Familiarízate, siguiendo esta `página de su documentación`_, con la pestaña :guilabel:`Elements` del entorno de las Chrome DevTools, ya que te será extremadamente útil. Práctica después las distintas posibilidades con un documento de HTML más complejo como este_.

  .. _`página de su documentación`: https://developers.google.com/web/tools/chrome-devtools/dom/
  .. _este: https://htmldog.com/guides/html/intermediate/sectioning/


.. Attention:: 

  El panel :guilabel:`Elements` de las *Chrome DevTools* muestra una información potencialmente distinta de la opción :guilabel:`Ver código fuente la página` que aparece en el menú contextual de una página (atajo de teclado :kbd:`Ctrl+U`), ya que esta última opción muestra siempre el código inicial descargado por el navegador y no el HTML dinámico que el navegador tiene en memoria en un determinado momento, que puede ser diferente al inicial por manipulaciones del árbol DOM, como veremos en posteriores temas.

.. Important::
  
  Durante el ciclo de desarrollo de una aplicación web es habitual realizar cambios en los ficheros de la aplicación (por ejemplo en el documento HTML, en las hojas de estilo o en el código de JavaScript) y comprobar a continuación cómo queda la aplicación tras recargarla. En algunas ocasiones el navegador puede optar, pese a la recarga, por utilizar el contenido previo almacenado en la caché lo que nos puede llevar a la falsa impresión de que nuestros cambios no tienen efecto. Dentro de la pestaña ``Network`` de las Chrome DevTools existe una opción ``Disable cache`` que hace que el navegador ignore el contenido de la caché, pero solo mientras las herramientas de desarrolladores estén abiertas. Es recomendable tenerla siempre marcada.

Codificación de caracteres
--------------------------

Aunque hoy día la mayor parte de los sistemas operativos trabajan con la codificación de caracteres de longitud variable UTF-8, que permite representar todos los caracteres del juego de caracteres Unicode, es importante que seas capaz de saber qué codificación de caracteres se usa en tus documentos web, en los de terceros, o en tu servidor web. No tener esto en cuenta puede hacer que tu web se visualice incorrectamente en algunos navegadores. En esta actividad hablaremos de codificación de caracteres siguiendo `estas diapositivas`_. 

.. _`estas diapositivas`: ./slides/070-codificacion-slides.html

Puedes ver los valores de los bytes en UTF-8 de los diferentes bytes de una cadena en JavaScript ejecutando:

.. code-block:: javascript

  e=new TextEncoder(); s="Avión a reacción: ✈"; for (let i of s) console.log(`'${i}': ${e.encode(i)}`);


.. Note::

  Cuando abres un documento con un editor de texto, el editor lee todos los bytes del fichero y los interpreta (y muestra) en base a la codificación con la que está configurado. Si, por ejemplo, el fichero se ha escrito con un programa que usa una codificación (llamémosla C1) en la que todos los caracteres ocupan un byte, pero se intenta mostrar con un editor configurado con una codificación (llamémosla C2) en la que todos los caracteres ocupan dos bytes, los caracteres mostrados probablemente no coincidirán con los originales, ya que el editor los agrupará de dos en dos. Además, al abrirlo con el editor, el fichero parecerá tener la mitad de caracteres que el original.

  Por ejemplo, puede que los bytes F3 y A1 (representados en hexadecimal) en la codificación C1 correspondan al signo ``+`` y a la ``M``, respectivamente, pero que en la codificación C2 la secuencia de dos bytes F3A1 corresponda al símbolo ``%``, que sería lo que mostraría en pantalla el editor que usa C2. Es posible incluso que algunos pares de bytes no representen caracteres válidos en la codificación C2, porque en C2 no se usan todos los posibles valores para representar caracteres; en ese caso, el editor de texto puede hacer varias cosas dependiendo de su configuración: no mostrar nada (saltarse ese carácter) o mostrar un símbolo especial que identifique caracteres inválidos.

.. Note::

  Los aspectos más relevantes mostrados en las diapositivas son:

  - UTF-8 es una codificación que asigna diferentes cantidades de bytes a los caracteres: algunos se representan con un byte, otros con dos, otros con tres y otros con cuatro bytes.
  - Cada uno de los 128 caracteres del ASCII (que se representan con un byte) se representan exactamente con el mismo byte en UTF-8. Los caracteres del ASCII se corresponden aproximadamente con los de un teclado estadounidense, por lo que no se incluyen entre ellos los caracteres acentuados, los kanjis del japonés o los emojis, entre otros muchos.
  - Los caracteres específicos del español o del catalán (á, à, ñ, Ñ, ç, Ç, etc.) ocupan dos bytes en UTF-8.


.. admonition:: Hazlo tú ahora
  :class: hazlotu

  Observa que indicar una determinada codificación en el atributo ``charset`` del elemento ``meta`` no garantiza que los caracteres del documento usen realmente dicha codificación. Usa un editor de textos que permita redactar documentos bajo diferentes codificaciones y graba tu documento HTML usando las codificaciones *UTF-8* e *ISO-8859-15* (Latin-1); prueba a poner el valor correcto y el incorrecto en la directiva ``meta`` y observa el resultado con los caracteres especiales al abrir el documento en el navegador. Estudia cómo se representan a nivel de bytes los caracteres en las distintas codificaciones con editores hexadecimales como `HexEd.it`_ o el `incorporado`_ en Visual Studio Code.

  .. _`HexEd.it`: https://hexed.it/
  .. _`incorporado`: https://marketplace.visualstudio.com/items?itemName=ms-vscode.hexeditor


Alojamiento en un servidor
--------------------------

Una página web normalmente se aloja en un servidor web. Si la máquina en la que lo hacemos fuera pública (nuestro ordenador personal normalmente no lo será), se podría acceder entonces al documento desde cualquier máquina conectada a internet usando convenientemente la URL del servidor. Existen muchos servidores web diferentes; algunos de los más conocidos son Apache HTTP Server (HTTPD), nginx, LiteSpeed, Internet Information Services, Apache Tomcat o Jetty. Mientras un programador desarrolla una aplicación web es habitual que lance un servidor en su máquina para ir probando sus cambios; en ese caso, el URL de acceso al servidor suele tener la forma ``http://localhost:8080`` donde ``localhost`` es el nombre de la propia máquina como *host* (IP 127.0.0.1) y ``8080`` es un puerto libre que es necesario indicar en el URL, ya que de no hacerlo el protocolo HTTP usa por defecto el puerto 80 (y HTTPS el 443), que estará normalmente reservado para comunicarse mediante HTTP con otros ordenadores. 

.. admonition:: Hazlo tú ahora
  :class: hazlotu

  Una de las formas más sencillas de lanzar un servidor local es usar el que Python incluye por defecto. Colócate en el directorio raíz del contenido que quieres servir y haz:

  .. code-block::

    python -m http.server

  o con versiones más antiguas de Python:

  .. code-block::

    python -m SimpleHTTPServer

  La extensión `LiveServer`_ de Visual Studio Code permite lanzar el servidor local desde el propio editor de texto.
  
  .. _`LiveServer`: https://marketplace.visualstudio.com/items?itemName=ritwickdey.LiveServer


Validación de documentos HTML
-----------------------------

Un aspecto básico de los documentos HTML es que estos cumplan estrictamente con las directrices de HTML, tanto a nivel sintáctico (por ejemplo, las marcas de apertura y clausura respetan el anidamiento entre elementos) como semántico (no hay dos atributos *id* con el mismo valor o no se usan en un elemento atributos que correspondan a otros elementos). De esta manera, se allana el camino hacia la compatibilidad entre navegadores y la usabilidad de la página web; la validación, sin embargo, no asegura que el documento se vaya a ver como el desarrollador tiene en la cabeza ni que se muestre de igual manera en todos los navegadores. 

.. admonition:: Hazlo tú ahora
  :class: hazlotu

  Usa el `validador del W3C`_ para validar alguna de las páginas web usadas en actividades anteriores; corrige todos los errores que te indique el validador hasta conseguir validarla. Algunas de las cosas que puedes probar son:

  - dejar una etiqueta sin cerrar
  - mover el elemento ``meta`` de la cabecera al cuerpo (``body``) del documento
  - mover un párrafo (``p``) a la cabecera (``head``) del documento
  - eliminar el título (``title``) de la cabecera del documento
  - poner una imagen (``img``) sin el atributo ``alt``
  - colocar un elemento de lista (``li``) fuera de la marca de lista (``ul``)

  .. _`validador del W3C`: http://validator.w3.org/


.. Attention::

  En `determinadas ocasiones`_ el estándar de HTML permite omitir algunas etiquetas de clausura (por ejemplo, en ciertas ocasiones no es necesario cerrar la etiqueta ``</body>`` de antes de ``</html>`` y, aun así, el documento sigue siendo válido), pero son situaciones muy específicas, por lo que es más que recomendable crear siempre documentos que son válidos al margen de estas excepciones.

  .. _`determinadas ocasiones`: https://html.spec.whatwg.org/multipage/syntax.html#optional-tags


.. Note::

  El lenguaje HTML evoluciona como cualquier otro lenguaje informático. Así, lo que hoy en día se representa como:

  .. code-block:: html

    <meta charset=utf-8>

  en XHTML o HTML4 se representaba como:

  .. code-block:: html

    <meta http-equiv="content-type" content="text/html; charset=iso-8859-1" >

  Ten en cuenta estas diferencias cuando encuentres código de ejemplo en HTML en alguna web. Los navegadores suelen procesar correctamente la mayor parte de la última versión del estándar existente cuando son publicados, pero no debes perder de vista que un gran número de usuarios tendrán probablemente versiones antiguas del navegador. Aunque no las veremos en este curso, existen maneras de desarrollar aplicaciones web teniendo en cuenta estas versiones antiguas sin renunciar necesariamente a la versatilidad de las recientes.

.. Note::

  Las ventajas de trabajar con documentos validados no son solo para terceros que accedan a tu página, sino también para el desarrollador. Imagina que olvidas la primera línea de un documento HTML, es decir, la que reza ``<!DOCTYPE html>``. Recuerda que hemos comentado que los navegadores son bastante laxos a la hora de mostrar los documentos y los procesan aunque no sean válidos, potencialmente introduciendo efectos colaterales inesperados. En concreto, la ausencia del tipo de documento pone al navegador en un modo especial que se denomina quirks_. En este modo el navegador toma decisiones que lo alejan del estándar, intentando mostrar el documento como lo habrían hecho navegadores antiguos. En este modo, los márgenes o tamaños de ciertos elementos pueden variar, por ejemplo, pero ello puede cambiar de un navegador a otro.

  .. _quirks: https://developer.mozilla.org/en-US/docs/Web/HTML/Quirks_Mode_and_Standards_Mode
