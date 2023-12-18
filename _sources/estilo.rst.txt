
Lenguajes de estilo
===================

El lenguaje HTML dota de contenido a una página web. El lenguaje JavaScript de interactividad. Y el lenguaje CSS (*cascading style sheets*), que vamos a estudiar en este tema, es el encargado de representar los aspectos relacionados con la presentación. Sin alterar el HTML de una página, solo modificando su hoja de estilo en CSS, pueden conseguirse `vistas completamente diferentes de un mismo documento`_. El World Wide Web Consortium (W3C) ha ido definiendo varios niveles para CSS (que se corresponden, más o menos, con la idea de versiones) de forma que cada nivel extiende las funcionalidades del nivel anterior. Hasta CSS 2.1 (revisión 1 del nivel 2), la recomendación venía recogida en un único documento, pero a partir del nivel 3 se divide en varias `decenas de módulos`_, cada uno de los cuales puede encontrarse en un estatus diferente (desde borrador a recomendación formal); además, el W3C ya trabaja en algunos módulos del nivel 4.

.. _`vistas completamente diferentes de un mismo documento`: http://csszengarden.com/
.. _`decenas de módulos`: https://www.w3.org/Style/CSS/


.. Important::

    Las habilidades que deberías adquirir con este tema incluyen las siguientes:

    - Entender la diferencia entre un lenguaje de marcas como HTML y un lenguaje de estilo como CSS.
    - Conocer el propósito de los atributos de CSS estudiados en este tema.
    - Entender las regla de herencia y especificidad de CSS.
    - Aplicar el modelo de caja de CSS.
    - Saber posicionar los elementos HTML usando posicionamiento estático, relativo, fijo o absoluto.
    - Saber crear hojas de estilo CSS válidas.
    - Usar las herramientas para desarrolladores integradas en los navegadores, como Chrome DevTools, para inspeccionar el estilo de una parte de un documento HTML.


.. _label-intro-css:

Selectores y propiedades del lenguaje CSS
-----------------------------------------

.. admonition:: Hazlo tú ahora
  :class: hazlotu

  Estudia todos los vídeos de la serie "Selectores y propiedades de CSS" en los que se introducen los elementos principales del lenguaje CSS, especialmente los conceptos de propiedad y selector que se usan a la hora de definir la reglas de estilo: `parte 1`_, `parte 2`_ y `parte 3`_.

  .. _`parte 1`: https://drive.google.com/file/d/1i3s-LKeMsCam5-kmD65G-BMGWsJjmaA8/view?usp=sharing
  .. _`parte 2`: https://drive.google.com/file/d/1XpPhulZBzbsS-ODtjuwZUzDNznKVphj6/view?usp=sharing
  .. _`parte 3`: https://drive.google.com/file/d/1PhItC2tHklcq82pHclsrt1sG5eD8PmNl/view?usp=sharing

Como se estudia en los vídeos anteriores, los selectores de CSS permiten identificar uno o más elementos de un documento HTML. Aunque en este tema vamos a usar los selectores como parte de las reglas de CSS, esta notación tiene otros usos que veremos más adelante (como identificar los nodos del árbol DOM sobre los que realizar ciertas operaciones en JavaScript). La sintaxis de los selectores puede ser más elaborada para definir criterios de selección más avanzados. Estudiando algunas de las propiedades de CSS (hay muchas más), has visto también cómo especificar medidas (por ejemplo, el tamaño de la letra), colores o tipos de letra en CSS.

.. admonition:: Hazlo tú ahora
  :class: hazlotu

  Practica con los diferentes tipos de selectores así como con los diferentes valores de las propiedades hasta tener claro su uso.


.. Attention::

  El hecho de introducir propiedades cosméticas a nivel de clase o identificador no debe distraer al desarrollador web de seguir usando los elementos de HTML para indicar la semántica del contenido (Selectores y propiedades de CSS (como se estudió en el tema de lenguajes de marcado), evitando así el abuso de elementos como ``div`` o ``span``: por ejemplo, si queremos aplicar un estilo específico a una cita, definiremos en la hoja de estilo el valor de las propiedades oportunas para el elemento ``<q>``, que será el que usemos en el documento HTML en lugar de un elemento del tipo ``<span class="cita">``.

.. Note::

  No todas las propiedades se propagan *en cascada* a los elementos interiores. Las propiedades ``color``, ``font-size`` y muchas otras se heredan, pero hay muchas propiedades de CSS no heredadas como ``border``, ``margin``, ``padding``, ``width``, ``position``, etc.

.. Note::

  De la misma manera que un documento HTML puede (y debe) ser validado para asegurar su corrección, existen también validadores de documentos CSS, como el `validador del W3C`_. La validación no asegura que el documento se vaya a ver como el desarrollador tiene en la cabeza ni que se muestre de igual manera en todos los navegadores, pero permite detectar errores sintácticos que, por otra parte, posiblemente sean también detectados por el editor de texto que utilices.

  .. _`validador del W3C`: http://jigsaw.w3.org/css-validator/


.. admonition:: Hazlo tú ahora
  :class: hazlotu

  Practica tu conocimiento de CSS con este entretenido `juego sobre selectores`_.

  .. _`juego sobre selectores`: https://flukeout.github.io/


Conexión entre los estilos y el documento HTML
----------------------------------------------

La forma más habitual (y normalmente la más correcta) de vincular los estilos a un documento HTML es mediante el elemento ``<link>`` empleado en la cabecera (``<head>``) del documento:

.. code-block:: html
  :linenos:

  <head>
    ...
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/style2.css">
    ...
  </head>

Observa cómo se puede vincular más de una hoja de estilo a la vez a un documento. Si un elemento recibe estilos incompatibles de más de una regla, se aplican los criterios de *especificidad* que comentaremos más adelante. 

La segunda manera de vincular estilos con un documento HTML es usando el elemento ``<style>`` en la cabecera del documento HTML e incluyendo las reglas CSS en su interior, pero esta forma no es muy recomendable ya que introduce una dependencia excesiva entre contenido y presentación, e impide la aplicación de los mismos estilos a otros documentos.

Existe una tercera vía que es todavía menos recomendable. La contamos aquí para que conozcas su existencia ya que es posible que te la encuentres en código de terceros. Consiste en usar el atributo ``style`` sobre un elemento del documento HTML:

.. code-block:: html
  :linenos:

  <body>
    ...
    <p style="color:red; font-style:italic;">
      ...
    </p>
    ...
  </body>

Esta tercera forma se aleja definitivamente de la idea de separar presentación y contenido, anulando todas sus ventajas.

Respecto a la *especificidad*, para los mismos selectores el último en declararse tiene precedencia; además, existe un orden principal establecido por el estilo del documento, el definido por el usuario y el por defecto del navegador, en este orden. En el caso de conflictos, es decir, cuando más de un selector puede aplicarse a un elemento del documento HTML y las propiedades asociadas a cada selector son incompatibles, se aplican las siguientes reglas de cálculo de la especificidad de un selector para determinar el selector *ganador*: 

- un estilo aplicado en línea con el atributo ``style`` suma 1000 a la especificidad
- cada identificador (*id*) que aparezca en el selector suma 100
- cada selector de clase, de atributo o de pseudo-clase (``:hover``) suma 10
- cada elemento o pseudo-elemento (``::before``) suma 1

Estos son algunos ejemplos de cálculo de especificidad para diferentes selectores:

.. list-table::
    :widths: 50 20
    :header-rows: 1
    
    * - Selector
      - Especificidad
    * - ``p``
      - 1
    * - ``div p``
      - 2
    * - ``.menu``
      - 10
    * - ``div ul.menu``
      - 12
    * - ``#activo``
      - 100
    * - ``body #contenido .principal p``
      - 112

En la tabla anterior aparecen algunos *selectores compuestos* que estudiarás más adelante.

.. Note::

  El criterio de especificidad puede sobrescribirse usando ``!important`` en la declaración de estilo. Aunque no lo veremos en este curso por ser poco recomendable la mayoría de las veces (normalmente podremos conseguir que el valor de un estilo se aplique sobre otros aumentando la especificidad del selector), puede ser útil cuando no podemos modificar ni el código HTML ni el CSS de una página (por ejemplo, porque son generados automáticamente por una herramienta), sino únicamente aportar una nueva hoja de estilo (en ese contexto, si queremos que alguna propiedad se aplique a un elemento que ya tiene la misma propiedad aplicada con otro valor por la hoja de estilo generada automáticamente y no existe un selector más específico que el ya usado en la hoja de estilo generada, modificaremos la propiedad en nuestra hoja de estilo con ``!important``).


.. _label-inline-css:

Elementos en línea y de bloque
------------------------------

El motor de renderizado (*layout engine* o *rendering engine*) es un complejo componente de los navegadores que aplica los diferentes estilos definidos mediante CSS al contenido del documento HTML para mostrarlo en el dispositivo del usuario.  Cuando los motores de renderizado de los navegadores tienen que mostrar un elemento de un documento de HTML, determinan la ubicación, medidas y propiedades de una *caja rectangular de píxeles* que incluirá el contenido del elemento. La forma en la que se calculan estos parámetros de la caja depende del tipo de elemento. 

La mayoría de los elementos de HTML que pueden aparecer en el cuerpo (``<body>``) del documento caen en una de estas dos categorías: de bloque o en línea.

En el caso de los elementos *de bloque* (*block elements*),

- su caja comienza en una nueva línea *debajo* de la caja anterior y, salvo que se restrinja explícitamente (mediante propiedades como ``width``), se extiende completamente a derecha e izquierda hasta ocupar todo el ancho disponible para el elemento padre (elemento contenedor); 
- la caja de cualquier elemento posterior también aparece en una nueva línea; 
- la altura de la caja depende del contenido (si se estrecha la ventana del navegador, la caja se alarga convenientemente para que el contenido quepa en ella), aunque puede fijarse explícitamente con propiedades como ``height``; 
- elementos como ``<p>``, ``<div>`` o ``<section>`` son ejemplos de elementos de bloque; ``<div>`` es un elemento de bloque especial de HTML ya que no tiene una semántica asociada: su propósito es delimitar contenido cuya representación tiene algún estilo diferenciado, pero que no tiene un matiz semántico que se pueda representar mediante un elemento de HTML. 

En el caso de los elementos *en línea* (*inline elements*),
  
- estos elementos no se muestran en una nueva línea ni provocan la aparición de una nueva línea al final de ellos;
- las cajas en línea no afectan al espaciado vertical;
- el ancho de su caja depende de su contenido (propiedades como ``width`` y ``height`` son ignoradas), no del ancho del elemento padre; 
- ejemplos de elementos en línea son ``<strong>``, ``<span>`` o ``<a>``; al igual que ``<div>``, ``<span>`` no tiene semántica asociada y su propósito es el mismo que el de ``<div>`` pero para contenido en línea.

Los comportamientos de las listas anteriores responden al flujo normal que se aplica por defecto a las cajas y constituye lo que se conoce como posicionamiento *estático*. Más adelante, veremos que hay otros tipos de posicionamiento.

Observa el resultado mostrado por el navegador para el siguiente bloque de código (puedes obviar los estilos por ahora) en el que hay tanto elementos en línea (``span``) como de bloque (``div``):

.. code-block:: html
  :linenos:

  <div>
    <span>inline naranja</span><span>inline azul</span>
    <span>inline lavanda</span>
    <div>bloque naranja</div>
    <div>bloque azul</div>
  </div>

.. raw:: html

  <div id="basico">
    <script>
      var root = document.querySelector('#basico').attachShadow({mode:'open'});
      root.innerHTML = `
        <style>
        .cuadrados {
          background: gainsboro; 
          padding: 10px; 
          margin-bottom: 20px;
        }
        .orange {         
          background: orange;
          height: 100px;
          width: 100px;
        }
        .blue {
          background: lightskyblue;
          height: 100px;
          width: 100px; 
        }
        .lavender {
          background: lavender;
          height: 100px;
          width: 100px; 
        }
        </style>
        <div class="cuadrados">
          <span class="orange">inline naranja</span><span class="blue">inline azul</span>
          <span class="lavender">inline lavanda</span>
          <div class="orange">bloque naranja</div>
          <div class="blue">bloque azul</div>
        </div>`;
    </script>
  </div>

.. admonition:: Hazlo tú ahora
  :class: hazlotu

  Mira bien el código HTML y asegúrate de que sabes por qué la caja con el texto *inline lavanda* está separada de la caja con *inline azul*, pero esta no lo está de la caja que contiene *inline naranja*. Observa también cómo el texto *bloque naranja* se ajusta automáticamente dentro de la caja sin salirse por su margen derecho y prueba a sustituirlo por textos de mayor longitud.

Un elemento en línea puede aparecer dentro de un elemento en línea o de un elemento de tipo bloque. Un elemento de tipo bloque puede estar anidado dentro de otro elemento de tipo bloque; sin embargo, un elemento de tipo bloque no puede aparecer dentro de un elemento en línea.


.. _label-caja-css:

Modelo de caja en CSS
---------------------

Todos los elementos de HTML se muestran en una caja *imaginaria* que se extiende alrededor de su contenido. Si bien el posicionamiento o el tamaño de estas cajas sigue reglas por defecto como las que hemos visto, muchas de estas propiedades geométricas pueden modificarse mediante reglas de CSS. Entender el modelo de caja de CSS es fundamental a la hora de dar estilo a una página web. Esto implica, entre otras cosas, entender bien la forma de definir los márgenes, el borde y el relleno (*padding*) de cada caja.

.. figure:: https://img.alicdn.com/tfs/TB13u.4n5rpK1RjSZFhXXXSdXXa-377-340.png
  :target: https://weex.apache.org/docs/styles/common-styles.html#box-model
  :alt: modelo de caja CSS

  Modelo de caja CSS por Apache Weex

Esta es una lista de los principales parámetros de una caja que podemos modificar mediente propiedades de CSS:

- El ancho y alto de cada caja se pueden definir explícitamente mediante las propiedades ``width`` y ``height``.
- Cada caja tiene un borde alrededor. El grosor de este borde se define con las propiedades ``border-top-width``, ``border-right-width``, ``border-bottom-width`` y ``border-bottom-left``; estas propiedades suelen tener valor cero por defecto. El color del borde se define con las propiedades ``bottom-top-color``, ``bottom-right-color``, etc. El trazo del borde puede, además, mostrarse con una línea continua (``solid``), con una línea discontinua (``dashed``) o con una línea de puntos (``dotted``), entre otros; estos valores pueden asignarse a las propiedades ``border-top-style``, ``border-right-style``, etc.
- Cada caja tiene un relleno (*padding*), que es la distancia entre el borde y el contenido de la caja; este relleno se define con las propiedades ``padding-top``, ``padding-right``, etc.
- Por último, es posible definir los márgenes entre una caja y las cajas de alrededor mediante las propiedades ``margin-top``, ``margin-right``, etc.

Las separaciones y grosores anteriores se definen en base a las múltiples unidades de medida permitidas en CSS, como *píxeles* o *ems*. Si el valor es cero, no es necesario indicar la unidad de medida (0 píxeles y 0 *ems* es lo mismo en este caso).

Existen formas compactas de definir algunas de las propiedades anteriores. Así, la propiedad ``padding: 3em 2em 1em 0`` establece el relleno, por este orden, superior, derecho, inferior e izquierdo; la propiedad ``padding: 2em 1em`` establece los rellenos superior e inferior (rellenos verticales) a ``2em`` y el relleno derecho e izquierdo (rellenos horizontales) a ``1em``; si solo tiene un valor, la propiedad ``padding: 2em`` establece todos los rellenos a ``2em``. La propiedad ``margin`` puede tener un número variable de valores, al igual que ``padding`` y con la misma semántica. Existe también una propiedad para dar valor al grosor de varios bordes a la vez, pero no es ``border`` (un error bastante común), sino ``border-width``. La propiedad ``border`` a secas cambia el grosor de todos los bordes, su estilo y su color a la vez, como en ``border: 1px solid blue``. 

Considera el siguiente fragmento de HTML:

.. code-block:: html
  :linenos:

  <div class="cuadrados">
    <div class="orange">naranja</div>
    <div class="blue">azul</div>
    <div class="lavender">lavanda</div>
  </div>

Y considera el siguiente código CSS:

.. code-block:: css
  :linenos:

  .cuadrados {
    background: gainsboro; 
    padding: 10px; 
  }
  .orange {         
    background: orange;
    height: 100px;
    width: 100px;
    border: 4px dotted olive
  }
  .blue {
    background: lightskyblue;
    height: 100px;
    width: 100px; 
    margin-top: 10px;
    margin-left: 20px;
    margin-bottom: 10px;
  }
  .lavender {
    background: lavender;
    height: 100px;
    width: 100px;
    padding: 1em 2em;
    border-top-width: 2px;
    border-top-color: olive;
    border-top-style: solid;
  }

La visualización del código anterior por el navegador es la siguiente:

.. raw:: html
  
  <div id="estatico1">
    <script>
      var root = document.querySelector('#estatico1').attachShadow({mode:'open'});
      root.innerHTML = `
      <style>
        .cuadrados {
          background: gainsboro; 
          padding: 10px; 
        }
        .orange {         
          background: orange;
          height: 100px;
          width: 100px;
          border: 5px dotted olive
        }
        .blue {
          background: lightskyblue;
          height: 100px;
          width: 100px; 
          margin-top: 10px;
          margin-left: 20px;
          margin-bottom: 10px;
        }
        .lavender {
          background: lavender;
          height: 100px;
          width: 100px;
          padding: 1em 2em;
          border-top-width: 2px;
          border-top-color: olive;
          border-top-style: solid;
        }
        </style>
        <div class="cuadrados">
          <div class="orange">naranja</div>
          <div class="blue">azul</div>
          <div class="lavender">lavanda</div>
        </div>`;
    </script>
  </div>

|

.. Note::

  Cuando estés depurando tus estilos, ten en cuenta que los navegadores suelen *colapsar* los márgenes de elementos adyacentes. Así, si una caja tiene un margen inferior de 10 píxeles y la caja que aparece bajo esta tiene un margen superior de 15 píxeles, se deja únicamente una separación de 15 píxeles entre ambas.

Dado que los márgenes y rellenos por defecto que aplica el navegador a cada elemento de tipo bloque pueden variar de un navegador a otro, es una práctica muy habitual *resetear* estos valores de manera que todas las medidas sean predecibles:

.. code-block:: css
  :linenos:

    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

De paso, hemos hecho que las medidas de todas las cajas se determinen usando el criterio ``border-box``, lo que también constituye una buena práctica. Con el criterio por defecto, ``content-box``, si se define el ancho de una caja en 100 píxeles, por ejemplo, la subcaja del contenido del elemento tendrá 100 pixeles de ancho y el ancho de cualquier borde o relleno especificado se sumará al ancho final reflejado; es por ello que las cajas del ejemplo anterior tiene tamaños diferentes. Esto provocaba hace años que a menudo los desarrolladores tuvieran que andar restando al ancho total deseado las medidas del borde y el relleno de cara a obtener el valor adecuado del atributo ``width``.  Con el valor ``border-box`` de la propiedad ``box-sizing`` la caja completa tendrá 100 píxeles de ancho y, si hay borde o relleno, la subcaja de contenido reducirá su tamaño para que el ancho final mostrado para la caja sea de 100 píxeles. Observa que los márgenes no modifican la caja con uno u otro valor de la propiedad, ya que no definen en sí propiedades de la caja del contenido sino del espacio entre ella y las cajas adyacentes.

.. Note::

  Independientemente del tipo (en línea o bloque) que un elemento tenga por defecto en HTML, el tipo puede cambiarse mediante la propiedad ``display`` usando los valores ``block`` e ``inline``. Además, podemos dar a un elemento el tipo ``inline-block`` que hace que se comporte como un elemento en línea, pero para el que se tienen en cuenta el ancho, el alto o los márgenes de manera que los elementos circundantes respetan el espacio de la caja, lo que no ocurre con los elementos en línea. La propiedad ``display`` también puede tomar el valor ``none``; en ese caso, el contenido del elemento no se visualiza en la ventana del navegador ni se reserva sitio alguno para él.


.. _label-posicionamiento-css:

Posicionamiento
---------------

Las opciones anteriores son bastante limitadas y es habitual que necesitemos más libertad a la hora de distribuir el contenido de los elementos en una página web. Una de las formas básicas de conseguirlo es a través del atributo ``position``, que puede tener los valores ``static``, ``relative``, ``absolute``, ``fixed`` y ``sticky``.

Posicionamiento estático
~~~~~~~~~~~~~~~~~~~~~~~~

El posicionamiento ``static`` corresponde al comportamiento por defecto que ya hemos visto: por ejemplo, cada elemento de tipo bloque se muestra en la línea siguiente al elemento anterior. Si un elemento no tiene asociado ningún valor en su propiedad ``position`` esta tomará el valor ``static``. 

.. Note::

  Normalmente no usaremos explícitamente este valor de ``position`` por ser el valor por defecto, pero excepcionalmente nos podría interesar sobrescribir un valor diferente que un elemento dado tome de alguna hoja de estilo que no podemos cambiar (por ejemplo, porque se genera automáticamente o porque se define en una librería); esta propiedad no se hereda, en cualquier caso, por lo que se tratará de algo excepcional como hemos comentado.

Considera el siguiente fragmento de HTML:

.. code-block:: html
  :linenos:

  <div class="cuadrados">
    <div class="orange">naranja</div>
    <div class="blue">azul</div>
    <div class="lavender">lavanda</div>
  </div>

Y considera el siguiente código CSS:

.. code-block:: css
  :linenos:

  .cuadrados {
    background: gainsboro; 
    padding: 10px; 
  }
  .orange {
    background: orange;
    height: 100px;
    width: 100px;
  }
  .blue {
    background: lightskyblue;
    height: 100px;
    width: 100px; 
    position: static; 
  }
  .lavender {
    background: lavender;
    height: 100px;
    width: 100px; 
  }

Puedes observar cómo el uso de ``static`` en la propiedad ``position`` de uno de los cuadrados no introduce ningún cambio respecto a la forma que ya conocíamos de representar los elementos de tipo bloque:

.. raw:: html
  
  <div id="estatico">
    <script>
      var root = document.querySelector('#estatico').attachShadow({mode:'open'});
      root.innerHTML = `
        <style>
        .cuadrados {
          background: gainsboro; 
          padding: 10px; 
          margin-bottom: 20px;
        }
        .orange {         
          background: orange;
          height: 100px;
          width: 100px;
        }
        .blue {
          background: lightskyblue;
          height: 100px;
          width: 100px; 
          position: static; 
        }
        .lavender {
          background: lavender;
          height: 100px;
          width: 100px; 
        }
        </style>
        <div class="cuadrados">
          <div class="orange">naranja</div>
          <div class="blue">azul</div>
          <div class="lavender">lavanda</div>
        </div>`;
    </script>
  </div>
  
Posicionamiento relativo
~~~~~~~~~~~~~~~~~~~~~~~~

El posicionamiento ``relative`` nos permite cambiar la posición por defecto de un elemento, moviéndolo de la posición que le habría correspondido por defecto con ayuda de las propiedades ``top``, ``bottom``, ``left`` y ``right``. Por poner un ejemplo, extensible a las otras tres propiedades, el valor de ``left`` es aquí la distancia del borde izquierdo de la ubicación donde se habría colocado la caja del elemento por defecto al borde izquierdo de la ubicación en la que finalmente se colocará. Si no se da valor a ninguna de estas cuatro proiedades, el elemento se mostrará exactamente en su lugar por defecto; como veremos más adelante, definir ``position`` como ``relative``, aun sin cambiar ninguna de las propiedades ``top``, ``bottom``, ``left`` o ``right``, puede ser muy útil para que un elemento se considere como *posicionado* cuando usemos el posicionamiento de tipo absoluto.

Este posicionamiento es muy utilizado para realizar pequeños ajustes en la posición por defecto en la que se muestra un determinado elemento.

Vamos a mover el cuadrado azul a la derecha del lavanda; para ello indicamos que vamos a sumar 100 píxeles a la posición de su parte superior y la misma cantidad a su posición izquierda:

.. code-block:: css
  :linenos:

  .blue {
    background: lightskyblue;
    height: 100px;
    width: 100px; 
    position: relative;
    top: 100px;
    left: 100px;
  }

.. raw:: html
  
  <div id="relativo">
    <script>
      var root = document.querySelector('#relativo').attachShadow({mode:'open'});
      root.innerHTML = `
        <style>
        .cuadrados {
          background: gainsboro; 
          padding: 10px; 
          margin-bottom: 20px;
        }
        .orange {         
          background: orange;
          height: 100px;
          width: 100px;
        }
        .blue {
          background: lightskyblue;
          height: 100px;
          width: 100px; 
          position: relative;
          top: 100px;
          left: 100px; 
        }
        .lavender {
          background: lavender;
          height: 100px;
          width: 100px; 
        }
        </style>
        <div class="cuadrados">
          <div class="orange">naranja</div>
          <div class="blue">azul</div>
          <div class="lavender">lavanda</div>
        </div>`;
    </script>
  </div>

Observa cómo el espacio por defecto que ocupaba el cuadrado azul no ha sido ocupado por ningún otro elemento. Es como si el motor de visualización del navegador ignorara el posicionamiento relativo en una primera pasada y lo tuviera en cuenta en una segunda pasada tras haber colocado todos los elementos de la página.

Podemos incluso *invadir* el espacio de otros cuadrados, usar valores negativos o salirnos del espacio del elemento contenedor:

.. code-block:: css
  :linenos:

    .blue {
      background: lightskyblue;
      height: 100px;
      width: 100px; 
      position: relative;
      top: 50px;
      left: -25px;
    }

.. raw:: html
  
  <div id="relativo3">
    <script>
      var root = document.querySelector('#relativo3').attachShadow({mode:'open'});
      root.innerHTML = `
        <style>
        .cuadrados {
          background: gainsboro; 
          padding: 10px; 
          margin-bottom: 20px;
        }
        .orange {         
          background: orange;
          height: 100px;
          width: 100px;
        }
        .blue {
          background: lightskyblue;
          height: 100px;
          width: 100px; 
          position: relative;
          top: 50px;
          left: -25px;
        }
        .lavender {
          background: lavender;
          position: relative;
          height: 100px;
          width: 100px; 
        }
        </style>
        <div class="cuadrados">
          <div class="orange">naranja</div>
          <div class="blue">azul</div>
          <div class="lavender">lavanda</div>
        </div>`;
    </script>
  </div>

Como ves, la caja lavanda se ha superpuesto a la azul. Para que se quede "debajo", es necesario usar la propiedad ``z-index`` que permite especificar *capas* en la página web, de manera que la capa 0 es la capa de visualización por defecto y valores negativos o positivos corresponden a capas más alejadas o cercanas al *visualizador*, respectivamente:

.. code-block:: css
  :linenos:

  .blue {
    background: lightskyblue;
    height: 100px;
    width: 100px; 
    position: relative;
    top: 50px;
    left: -25px;
    z-index: 2;
  }
  .lavender {
    background: lavender;
    height: 100px;
    width: 100px; 
    position: relative;
    z-index: 1;
  }

.. raw:: html
  
  <div id="relativo4">
    <script>
      var root = document.querySelector('#relativo4').attachShadow({mode:'open'});
      root.innerHTML = `
        <style>
        .cuadrados {
          background: gainsboro; 
          padding: 10px; 
          margin-bottom: 20px;
        }
        .orange {         
          background: orange;
          height: 100px;
          width: 100px;
        }
        .blue {
          background: lightskyblue;
          height: 100px;
          width: 100px; 
          position: relative;
          top: 50px;
          left: -25px;
          z-index: 2;
        }
        .lavender {
          background: lavender;
          height: 100px;
          width: 100px;
          position: relative;
          z-index: 1;
        }
        </style>
        <div class="cuadrados">
          <div class="orange">naranja</div>
          <div class="blue">azul</div>
          <div class="lavender">lavanda</div>
        </div>`;
    </script>
  </div>

La propiedad ``z-index`` solo funciona si el elemento *está posicionado*. Diremos que un elemento *está posicionado* si el valor de su posición es cualquiera excepto ``static``. Por ello es por lo que hemos tenido que añadir un posicionamiento relativo a la caja lavanda (pero no hemos cambiado ninguna propiedad como ``top``, ``bottom``, ``left`` o ``right`` para no cambiar su posición).

Finalmente, observa cómo con el uso adecuado del posicionamiento relativo podemos cambiar el orden en el que se muestra la información en el navegador respecto al orden inicialmente definido en el documento HTML:

.. code-block:: css
  :linenos:

  .orange {         
    background: orange;
    height: 100px;
    width: 100px;
    position: relative;
    top: 200px;
  }
  .blue {
    background: lightskyblue;
    height: 100px;
    width: 100px;
  }
  .lavender {
    background: lavender;
    height: 100px;
    width: 100px;
    position: relative;
    top: -200px;
  }

.. raw:: html
  
  <div id="relativo6">
    <script>
      var root = document.querySelector('#relativo6').attachShadow({mode:'open'});
      root.innerHTML = `
        <style>
        .cuadrados {
          background: gainsboro; 
          padding: 10px; 
          margin-bottom: 20px;
        }
        .orange {         
          background: orange;
          height: 100px;
          width: 100px;
          position: relative;
          top: 200px;
        }
        .blue {
          background: lightskyblue;
          height: 100px;
          width: 100px;
        }
        .lavender {
          background: lavender;
          height: 100px;
          width: 100px;
          position: relative;
          top: -200px;
        }
        </style>
        <div class="cuadrados">
          <div class="orange">naranja</div>
          <div class="blue">azul</div>
          <div class="lavender">lavanda</div>
        </div>`;
    </script>
  </div>

Posicionamiento absoluto
~~~~~~~~~~~~~~~~~~~~~~~~

Si el posicionamiento ``relative`` que acabamos de ver permite colocar un elemento de forma relativa a su posición por defecto, el posicionamiento ``absolute`` permite colocarlo de forma relativa al elemento padre (más abajo matizaremos esto). En este caso, no *deja hueco*, porque nunca llega a tener una posición original propia. Además, de nuevo podemos usar las propiedades ``top``, ``bottom``, ``left`` y ``right`` para moverlo. Por poner un ejemplo, extensible a las otras tres propiedades, el valor de ``left`` es la distancia del borde izquierdo de la caja contenedora al borde izquierdo de la caja que resultará para el nuevo elemento. Un elemento con posicionamiento absoluto no influye en otros elementos ni otros elementos influyen en él.

.. code-block:: css
  :linenos:

  .cuadrados {
    background: gainsboro; 
    padding: 10px; 
    position: relative;
  }
  .blue {
    background: lightskyblue;
    height: 100px;
    width: 100px; 
    position: absolute;
    top: 0px;
    right: 0px;
  }

.. raw:: html
  
  <div id="relativo5">
    <script>
      var root = document.querySelector('#relativo5').attachShadow({mode:'open'});
      root.innerHTML = `
        <style>
        .cuadrados {
          position: relative;
          background: gainsboro; 
          padding: 10px; 
          margin-bottom: 20px;
        }
        .orange {         
          background: orange;
          height: 100px;
          width: 100px;
        }
        .blue {
          background: lightskyblue;
          height: 100px;
          width: 100px; 
          position: absolute;
          top: 0px;
          right: 0px;
        }
        .lavender {
          background: lavender;
          height: 100px;
          width: 100px;
        }
        </style>
        <div class="cuadrados">
          <div class="orange">naranja</div>
          <div class="blue">azul</div>
          <div class="lavender">lavanda</div>
        </div>`;
    </script>
  </div>

Observa cómo además de añadir las propiedades ``position``, ``left`` y ``right`` al elemento azul, hemos añadido ``position: relative`` al padre (esto es, al elemento contenedor). Esto es así porque las reglas son un poco más complejas que las mencionadas anteriormente: en realidad, el posicionamiento absoluto usa como referencia el primer ancestro que *esté posicionado*, es decir, como ya hemos dicho antes, aquel que tenga un posicionamiento no estático. Si tras ascender por el árbol buscando un ancestro posicionado, el navegador no encontrara ninguno, el elemento con posicionamiento absoluto se posicionaría con respecto al elemento ``<body>``.

.. Note::

  Es muy recomendable que al usar el posicionamiento absoluto siempre indiques el valor para uno de las desplazamientos ``left``/``right`` y para uno de los desplazamientos ``top``/``bottom``, ya que el comportamiento por defecto puede no coincidir con el esperado. Por ejemplo, si se omiten todos los desplazamientos, estos toman el valor por defecto ``auto``, que implica que el elemento permanece en su posición estática, aunque sin ocupar espacio propio por ser un elemento absoluto. Por otro lado, si se indican valores tanto para ``left`` como para ``right`` (lo que no es recomendable) el valor de la propiedad ``left`` prevalece. En el caso de ``top`` y ``bottom``, es el valor de ``top`` el que gana. En realidad, ``left`` prevalece si el sentido de escritura es de izquierda a derecha y no de derecha a izquierda como pasa en lenguas como el árabe, pero no entraremos en esos detalles en esta asignatura.

  .. Valores por defecto de los offsets: https://stackoverflow.com/a/19969046

Posicionamiento fijo
~~~~~~~~~~~~~~~~~~~~

Al igual que con el posicionamiento absoluto, en el posicionamiento ``fixed`` no se aplica el flujo normal para el elemento correspondiente y este no deja ningún hueco. Las diferencias con el posicionamiento absoluto son:

- Los desplazamientos son relativos a la ventana del documento.
- La caja se mantiene en esa posición de la ventana aunque el usuario se desplace arriba o abajo (*scroll*) por el documento.

.. admonition:: Hazlo tú ahora
  :class: hazlotu

  Juega con el posicionamiento fijo y con los otros tipos de posicionamiento estudiados en este tema, usando inicialmente para ello el ejemplo de los cuadrados de colores. Usar un entorno de trabajo como JSFiddle (puedes partir de `este código`_ y modificarlo) te simplificará la tarea ya que puedes ir realizando cambios en las propiedades CSS y viendo inmediatamente su efecto en la visualización del documento pulsando :guilabel:`Run` o con el atajo de teclado :kbd:`Ctrl+Enter`. Para poder estudiar bien el posicionamiento fijo tendrás que añadir más contenido al documento hasta conseguir que aparezca la barra de desplazamiento. Cuando un desarrollador web necesita rellenar con texto un documento HTML para observar el resultado en un navegador pero no le interesa el contenido del texto en sí, es habitual que recurra a `generadores de texto de relleno`_ basados en frases escritas en latín.

  .. _`este código`: https://jsfiddle.net/d0pqgzr7/
  .. _`generadores de texto de relleno`: https://getlorem.com/


.. Note::

  Las variables de CSS (también conocidas como propiedades personalizables) son muy útiles al jugar con los tamaños y desplazamientos de las diferentes cajas y evitan al desarrollador tener que rehacer los cálculos continuamente. El siguiente ejemplo define una variable ``--lado`` y ajusta en base a su valor los tamaños y desplazamientos de los diferentes bloques:

  .. code-block:: css
    :linenos:

    :root {
      --lado: 200px;
      --grisaceo: #dadada;
    }
    .cuadrados {
      background: var(--grisaceo);
      padding: 10px;
      position: relative;
      width: calc(var(--lado) * 3);
      height: var(--lado);
    }
    .orange {
      background: orange;
      height: var(--lado);
      width: var(--lado);
      position: absolute;
      top: 10px;
      left: calc(var(--lado) * 0 + 10px);
    }
    .blue {
      background: lightskyblue;
      height: var(--lado);
      width: var(--lado);
      position: absolute;
      top: 10px;
      left: calc(var(--lado) * 1 + 10px);
    }
    .lavender {
      background: lavender;
      height: var(--lado);
      width: var(--lado);
      position: absolute;
      top: 10px;
      left: calc(var(--lado) * 2 + 10px);
    }

  Los espacios en blanco alrededor de los operadores son necesarios. Solo cambiando el valor inicial de la variable se consigue que se recalculen los tamaños y posiciones de todos los elementos (¡pruébalo!). Las propiedades personalizadas también se heredan, por lo que suele ser una práctica común (como en el ejemplo) declararlas para la pseudo-clase ``:root`` de CSS. Esta pseudo-clase selecciona el elemento raíz del árbol DOM. En HTML, este elemento es ``<html>``, aunque la especificidad de ``:root`` es mayor. Las hojas de estilo pueden aplicarse a documentos escritos en otros lenguajes (XML, por ejemplo), por lo que ``:root`` es un selector más aconsejable e independiente del documento.


Herramientas para desarrolladores
---------------------------------

Las herramientas para desarrolladores que incorporan los navegadores permiten no solo inspeccionar información referente a HTML, sino también verificar o modificar aspectos relativos a los estilos de CSS.

.. admonition:: Hazlo tú ahora
  :class: hazlotu

  Familiarízate, siguiendo esta `página de su documentación`_, con la sección :guilabel:`Styles` de la pestaña :guilabel:`Elements` del entorno de las Chrome DevTools. Después, estudia opciones más avanzadas siguiendo esta `otra página`_. Practica las distintas posibilidades de los estilos en DevTools con un documento de HTML como este_.

  .. _`página de su documentación`: https://developers.google.com/web/tools/chrome-devtools/css
  .. _`otra página`: https://developers.google.com/web/tools/chrome-devtools/css/reference
  .. _este: https://htmldog.com/guides/html/intermediate/sectioning/


.. _label-extracss:

Elementos adicionales de CSS
----------------------------

En esta actividad vas a estudiar algunos elementos adicionales del lenguaje de estilo CSS que son más o menos comunes en las páginas web modernas y que han quedado fuera de los contenidos anteriores. Esta actividad puede ser opcional para la asignatura según el curso académico, por lo que en principio solo has de seguirla si te lo ha indicado explícitamente tu profesor o si te interesa profundizar en el tema por tu cuenta.

.. admonition:: Hazlo tú ahora
  :class: hazlotu

  Estudia el `vídeo completo sobre la rejilla`_ (``grid``) de CSS del desarrollador Miguel Ángel Durán. Toma nota de las principales ideas y de las propiedades relevantes. Opcionalmente, puedes jugar al juego del `jardín con grid`_ para practicar de forma divertida con lo aprendido.`
  
  .. _`vídeo completo sobre la rejilla`: https://youtu.be/iTjkiI8QQsM?si=EoFA7Qzy-wMqxM8F
  .. _`jardín con grid`: https://cssgridgarden.com/
  
.. admonition:: Hazlo tú ahora
  :class: hazlotu

  Estudia el `vídeo sobre animaciones`_ con CSS del desarrollador Miguel Ángel Durán, pero solo hasta 1:03:54. Toma nota de las principales ideas y de las propiedades relevantes. 

  .. _`vídeo sobre animaciones`: https://youtu.be/RwjgfNX41TE?si=B3Xu2ujvVtjSSyD4

.. Note:: 

  Algunos vídeos más compactos sobre los elementos anteriores que te pueden servir para afianzar ideas son los siguientes: `rejilla`_, `transiciones`_, `uso de transiciones`_ y `animaciones`_.

  .. _`rejilla`: https://youtu.be/-kgGATnsPbs?si=ZRjGthXg2LaR2Xg1
  .. _`transiciones`: https://youtu.be/Nloq6uzF8RQ?si=3kvXwOLyHS_nB8Ng
  .. _`uso de transiciones`: https://youtu.be/YYlFFMc0RAg?si=P1gUYskfnQcCQx-6
  .. _`animaciones`: https://youtu.be/YszONjKpgg4?si=tjAA9AvnUGZMC2V7


Chuletas de resumen
-------------------

Ahora que ya sabes HTML y CSS te puede venir bien tener a mano esta `chuleta de CSS`_ de Adam Marsdem y esta `otra de HTML y CSS`_ de acchou.

.. _`chuleta de CSS`: https://adam-marsden.co.uk/css-cheat-sheet
.. _`otra de HTML y CSS`: https://acchou.github.io/html-css-cheat-sheet/html-css-cheat-sheet.html
