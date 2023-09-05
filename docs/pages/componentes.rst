.. role:: problema-contador

Componentes web
===============

Los componentes web son un conjunto de estándares que permiten crear elementos de HTML reutilizables en diferentes aplicaciones web. Estos componentes encapsulan su comportamiento y apariencia de forma independiente al resto de la aplicación. La idea es que los programadores tengan a su disposición un abánico de componentes web específicos para las diferentes necesidades de su aplicación web (mostrar un selector de fecha, reproducir un fichero de audio, mostrar un mapa interactivo, etc.) y que puedan integrarlos cómodamente en sus aplicaciones. Aunque las tecnologías implicadas tienen ya cierto tiempo, su uso explícito por los programadores de aplicaciones web no está muy extendido todavía, en parte por la proliferación de *frameworks* y herramientas (`Angular`_, `React`_, `Vue`_, `Stencil`_, `Ionic`_, `LitElement`_...) que ofrecen una sintaxis de más alto nivel para su definición y uso, además de ampliar su funcionalidad. En la línea seguida en este curso de abordar las tecnologías web a niveles no muy elevados de abstracción, estudiaremos aquí las tecnologías subyacentes y crearemos nuestros componentes web con ellas.

.. _`Angular`: https://angular.io/
.. _`React`: https://reactjs.org/
.. _`Vue`: https://vuejs.org/
.. _`Stencil`: https://stenciljs.com/
.. _`Ionic`: https://ionicframework.com/
.. _`LitElement`: https://lit-element.polymer-project.org/

.. Important::

  Las habilidades que deberías adquirir con este tema incluyen las siguientes:

    - Comprender la diferencia entre *shadow DOM* y *light DOM*.
    - Entender cómo se modifica la representación de una página tras incluir un *shadow tree* en ella.
    - Comprender la utilidad de encapsular partes de una página web en un componente web.
    - Saber como crear componentes web mediante las API estándar.
    - Saber cómo modificar la presentación de un componente sin modificar el DOM global.


.. _label-intro-comp:

Introducción a los componentes web
----------------------------------

Los componentes web permiten crear elementos de HTML reutilizables. Por ejemplo, una librería de componentes web podría permitirnos insertar en una página web un `indicador del progreso`_ de una descarga con el siguiente fragmento de HTML:

.. code-block:: html

    <fast-progress-ring value="10" max="100" min="0"></fast-progress-ring>

.. _`indicador del progreso`: https://explore.fast.design/components/fast-progress-ring

El componente web podría definir adicionalmente una serie de funciones (una API) para interactuar con él desde nuestro código en JavaScript. El elemento HTML creará normalmente al iniciarlo algunos nodos de HTML adicionales. Cuando el navegador inserta en el DOM el subárbol resultante, crea una especie de *barrera protectora* que impide que los estilos aplicados al documento permeen a dicho subárbol y que funciones como ``document.querySelector`` puedan encontrar sus nodos; será necesario, como veremos, buscarlos mediante ``nodo.shadowRoot.querySelector``, donde ``nodo`` es una referencia al nodo que incluye el subárbol DOM como, por ejemplo, ``fast-progress-ring`` en el caso anterior. Se facilita así que los componentes web tengan su propio estilo y comportamiento diferenciado de los del resto de la aplicación.

.. ejemplo de uso del componente de indicación de progreso con la librería Fast: https://codepen.io/jaspock/pen/RwRMMqe


La tecnología de los componentes web se basa principalmente en las siguientes tecnologías estandarizadas: 

- el *DOM ensombrecido* (*shadow DOM*), que permite crear un subárbol DOM aislado del árbol DOM global (también llamado *DOM iluminado*, *light DOM*, nombre que se ha popularizado para diferenciar el DOM global del DOM ensombrecido);
- los *elementos personalizados* (*custom elements*), que permiten al desarrollador definir sus propios elementos de HTML; los elementos personalizados son elementos HTML como ``<p>`` o ``<a>`` pero definidos por nuestro código usando una serie de funciones estándar soportadas por los navegadores;
- más secundariamente, las *plantillas* (*templates*), que permiten encapsular bloques de contenido (HTML), presentación (CSS) y funcionalidad (JavaScript) de forma que no son tenidos en cuenta inmediatamente por el navegador y solo se *activan* posteriormente al ejecutar determinado código de JavaScript.

.. figure:: https://media.prod.mdn.mozit.cloud/attachments/2018/01/29/15788/9d23f749f26b93a00f5c2aa72f00e720/shadow-dom.png
  :target: https://developer.mozilla.org/en-US/docs/Web/Web_Components/Using_shadow_DOM
  :alt: shadow DOM
  :figwidth: 70 %

  El DOM ensombrecido tiene un nodo raíz virtual (*shadow-root*). El *shadow-host* es el nodo del componente web que alberga este subárbol.  


.. _label-ejemplo-comp:

Un ejemplo sencillo de componente web
-------------------------------------

Vamos a ver las tecnologías de *shadow DOM*, elementos personalizados y plantillas juntas en acción, comenzando con el siguiente ejemplo (que puedes probar `aquí <https://codepen.io/jaspock/pen/oNLqyKB>`_) de un componente web sencillo y bastante poco útil que iremos ampliando sucesivamente:

.. code-block:: html
  :linenos:
  :force:

  <!DOCTYPE html>
  <html>
    <head>
      <title>Definición de componentes web</title>
      <meta charset="utf-8">
    </head>
    <body>

      <template id="operaciones">
        <style>
          h1 {
            color: steelblue;
          }
          .contenido {
            background-color: gainsboro;
            color: royalblue;
          }
        </style>

        <script>
          console.log("Template instanciado");
        </script>

        <h1>Operaciones binarias</h1>
        <div class="contenido">
          Multiplicación: 3 x 2 = 6.
        </div>
      </template>

      <h1>Definición de componentes web</h1>
      
      <calcula-operaciones></calcula-operaciones>
      
      <script>
        class Operaciones extends HTMLElement {
          constructor() {
            super();
            let template = document.querySelector('#operaciones');
            let clone = template.content.cloneNode(true);  // true para clonar también los hijos
            let shadowRoot = this.attachShadow({
              mode: 'open'
            });
            shadowRoot.appendChild(clone);
          }
        }
        customElements.define("calcula-operaciones", Operaciones);
      </script>
      
      <p>Fin de la pagina.</p>

    </body>
  </html>

La página web anterior incluye un elemento ``<template>`` cuyo contenido no es mostrado en principio por el motor del navegador; la idea es que un script de JavaScript se referirá posteriormente a esta plantilla (a través de su id) para instanciar un elemento e insertarlo convenientemente en el árbol DOM, como puedes observar en el constructor de la clase ``Operaciones``. Como esta plantilla será instanciada dentro de un *shadow DOM*, los estilos CSS que incluye no modificarán a elementos de otras partes del árbol DOM. También se incluye en la plantilla código en JavaScript que no será ejecutado hasta que el componente se instancie. Por último, la plantilla contiene código HTML que será el que se inserte en el árbol DOM ensombrecido al instanciar el elemento.

Como veremos a continuación, nuestro ejemplo define un elemento personalizado ``<calcula-operaciones>`` que se puede usar (es decir, instanciar) en una o más partes de nuestro documento HTML (aquí en la línea 32). 

La definición del elemento personalizado se hace mediante una clase (recuerda que desde ES6 puede usarse ``class``) que deriva de ``HTMLElement``. El nombre de la clase (``Operaciones`` en este caso) se pasa al método ``customElements.define`` para definir el elemento HTML personalizado; el nombre del elemento ha de llevar obligatoriamente un guión para diferenciarlo de los elementos estándar de HTML. La clase ``Operaciones`` tiene en este ejemplo solo un método constructor que llama al constructor de la clase padre, clona la plantilla mediante el método ``cloneNode``, crea un nodo ensombrecido vinculado a la instancia del elemento y, finalmente, añade el nodo clonado al nodo ensombrecido del elemento.

.. Note::

  La referencia ``this`` en el constructor (o en cualquiera de los métodos de la clase) apunta al nodo del *shadow host* que incluirá el árbol ensombrecido, por lo que sobre ella se pueden invocar métodos como ``this.attachShadow`` o, como veremos más adelante, acceder al atributo ``this.shadowRoot`` para acceder al *shadow DOM* subyacente.

El *árbol ensombrecido* se comporta como un árbol DOM normal, salvo que no es visible desde fuera: por ejemplo, el elemento ``<h1>`` del *DOM ensombrecido* no aparecerá nunca si buscamos nodos con ``document.querySelectorAll("h1")`` desde un script de fuera del componente web; además, los estilos que definamos para ``<h1>`` dentro del *shadow DOM* no afectarán a los elementos del árbol principal y a la inversa. Si inspeccionamos el nodo correspondiente a ``calcula-operaciones`` (el *shadow host*) con las herramientas para desarrolladores del navegador, observaremos que contiene una etiqueta ``#shadow-root`` de la que cuelgan los nodos ``h1`` y ``div`` (además de ``style`` y ``script``).


.. Attention::

  Algunos estilos definidos para el árbol *iluminado* sí que pueden afectar a los elementos del árbol *ensombrecido*. En concreto, el criterio_ es el siguiente:

  1. Los estilos que se heredan desde nodos superiores también son heredados por defecto por los nodos ensombrecidos. Así, si la página principal tiene una regla de estilo como ``body {color:purple}``, el texto del interior del componente web se mostrará en principio en color púrpura (aunque este comportamiento puede sobrescribirse mediante reglas locales).
  2. Por otro lado, los selectores de CSS aplicados en el nivel exterior no atravesarán por defecto las fronteras del árbol ensombrecido y no se emparejarán con sus nodos. Así, si la página principal tiene una regla de estilo como ``h2 {color:magenta}``, el color de los posibles encabezados de nivel 2 del componente web no se verá afectado por ella.

  Para aislar el componente web de la influencia descrita en el primer elemento, se puede usar la propiedad de CSS all_ y definir dentro de los estilos locales una regla como ``* {all:initial}``.

  .. _criterio: https://github.com/WICG/webcomponents/issues/314#issuecomment-137654422
  .. _all: https://developer.mozilla.org/en-US/docs/Web/CSS/all


.. Note::

  Cuando el atributo ``mode`` del objeto pasado como argumento a ``attachShadow`` toma el valor *open*, el código de JavaScript externo puede acceder al DOM ensombrecido mediante código como el siguiente:

  .. code-block:: javascript
    :force:

    document.querySelector("calcula-operaciones").shadowRoot.querySelector("h1");

  Esto, en principio, no es posible si ``mode`` vale *closed*. Realmente, aunque no los veremos, hay varios `trucos`_ que permiten acceder al árbol ensombrecido incluso aunque el atributo ``mode`` sea *closed*, por lo que se suele dejar a *open*. Se espera que el código externo no interactúe más de lo estrictamente necesario con el contenido del elemento personalizado.

.. _`trucos`: https://blog.revillweb.com/open-vs-closed-shadow-dom-9f3d7427d1af



.. _label-avanzado-comp:

Características adicionales de los componentes web
--------------------------------------------------

Permitamos ahora parametrizar los mensajes del componente web introducido en la actividad anterior. Para ello, vamos a incluir dentro de cada instancia del elemento ``calcula-operaciones`` dos bloques de código HTML identificados mediante un nombre indicado en el atributo ``slot``. Dentro de la plantilla, podemos insertar el contenido de estos bloques usando el elemento ``slot`` e indicando en su atributo ``name`` el identificador del bloque a insertar. Además, vamos a mejorar también un poco el estilo del componente web rodeándolo con un borde; como se trata de un estilo asociado al elemento completo (el *shadow host*), usamos el selector de CSS ``:host``. Observa en el ejemplo que podemos instanciar un componente web más de una vez en un mismo documento HTML.

.. code-block:: html
  :linenos:
  :force:

  <!DOCTYPE html>
  <html>
    <head>
      <title>Definición de componentes web</title>
      <meta charset="utf-8">
    </head>
    <body>

      <template id="operaciones">
        <style>
          * {
            margin: 0;
            padding: 0;
          }
          h1 {
            color: steelblue;
            font-size: 110%;
            margin-bottom: 10px;
            border-bottom: 1px solid lightgray;
          }
          .contenido {
            background-color: gainsboro;
            color: royalblue;
          }
          :host {
            border: 1px solid lightgray;
            padding: 5px;
            display: block;
            margin: 5px;
            margin-bottom: 15px;
          }
        </style>

        <script>
          console.log("Template instanciado");
        </script>

        <h1><slot name="title">Sin título</slot></h1>
        <div class="contenido">
          <slot name="mult">Sin nombre</slot>: 3 x 2 = 6.
        </div>
      </template>

      <h1>Definición de componentes web</h1>
      
      <calcula-operaciones>
        <span slot="title">Operaciones binarias</span>
        <span slot="mult">Multiplicación</span>
      </calcula-operaciones>

      <calcula-operaciones>
        <span slot="title">Binary <strong>operations</strong></span>
        <span slot="mult">Multiplication</span>
      </calcula-operaciones>

      <calcula-operaciones>
        <span slot="mult">Multiplicación</span>
      </calcula-operaciones>
      
      <script>
        class Operaciones extends HTMLElement {
          constructor() {
            super();
            let template = document.querySelector('#operaciones');
            let clone = template.content.cloneNode(true);
            let shadowRoot = this.attachShadow({
              mode: 'open'
            });
            shadowRoot.appendChild(clone);
          }
        }
        customElements.define("calcula-operaciones", Operaciones);
      </script>
      
      <p>Fin de la pagina.</p>

    </body>
  </html>


Que el componente web realice siempre la multiplicación de los mismos números no tiene mucha gracia. Vamos a hacer que los valores a multiplicar se definan como atributos del elemento. 

.. Note::

  Recuerda que en HTML los atributos que no sean estándar han de tener el prefijo ``data-``.

Según la especificación de los componentes web, en el constructor no se puede acceder a los atributos del elemento; por ello, el acceso con el método ``this.getAttribute`` lo dejamos para el método estándar ``connectedCallback`` que será invocado por el navegador tras instanciar el componente web:

.. code-block:: html
  :linenos:
  :force:

  <!DOCTYPE html>
  <html>
    <head>
      <title>Definición de componentes web</title>
      <meta charset="utf-8">
    </head>
    <body>

      <template id="operaciones">
        <style>
          * {
            margin: 0;
            padding: 0;
          }
          h1 {
            color: steelblue;
            font-size: 110%;
            margin-bottom: 10px;
            border-bottom: 1px solid lightgray;
          }
          .contenido {
            background-color: gainsboro;
            color: royalblue;
          }
          :host {
            border: 1px solid lightgray;
            padding: 5px;
            display: block;
            margin: 5px;
            margin-bottom: 15px;
          }
        </style>

        <script>
          console.log("Template instanciado");
        </script>

        <h1><slot name="title">Sin título</slot></h1>
        <div class="contenido">
          <slot name="mult">Sin nombre</slot>: 
          <span id="a"></span> x <span id="b"></span> = 
          <span id="resultado"></span>.
        </div>
      </template>

      <h1>Definición de componentes web</h1>
      
      <calcula-operaciones data-a="4" data-b="5">
        <span slot="title">Operaciones binarias</span>
        <span slot="mult">Multiplicación</span>
      </calcula-operaciones>

      <calcula-operaciones data-a="8">
        <span slot="title">Binary operations</span>
        <span slot="mult">Multiplication</span>
      </calcula-operaciones>
    
      <script>
        class Operaciones extends HTMLElement {
          constructor() {
            super();
            let template = document.querySelector('#operaciones');
            let clone = template.content.cloneNode(true);
            let shadowRoot = this.attachShadow({
              mode: 'open'
            });
            shadowRoot.appendChild(clone);
          }

          connectedCallback() {
            this.a= this.hasAttribute('data-a')?this.getAttribute('data-a'):0;
            this.b= this.hasAttribute('data-b')?this.getAttribute('data-b'):0;
            this.shadowRoot.querySelector('#a').textContent= this.a;
            this.slotb= this.shadowRoot.querySelector('#b');
            this.slotb.textContent= this.b;
            let resultado= this.shadowRoot.querySelector('#resultado');
            resultado.textContent= this.a*this.b;
          }

        }
        customElements.define("calcula-operaciones", Operaciones);
      </script>
      
      <p>Fin de la pagina.</p>

    </body>
  </html>


.. Attention::

  El estándar de HTML es muy claro al decir que en el constructor "the element's attributes and children must not be inspected", que "work should be deferred to ``connectedCallback`` as much as possible" y que "the constructor should be used to set up initial state and default values, and to set up event listeners and possibly a shadow root". No obstante, dependiendo del navegador y de cuándo se ejecute el código es posible que aparentemente puedas `saltarte estas restricciones`_. Ten en cuenta que el comportamiento de tu código si, por ejemplo, accedes a los atributos en el constructor puede ser muy diferente (e incluso producir errores) en otros navegadores o en versiones diferentes del mismo navegador, por lo que es más que recomendable que no lo hagas.

  .. _`saltarte estas restricciones`: https://stackoverflow.com/questions/43836886/failed-to-construct-customelement-error-when-javascript-file-is-placed-in-head#answer-43837330


Ahora vamos a modularizar y encapsular el diseño anterior para que otros puedan usar nuestro componente web sin tener que incluir todo lo anterior en su documento HTML:

.. code-block:: html
  :linenos:
  :force:

  <!DOCTYPE html>
  <html>
    <head>
      <title>Definición de componentes web</title>
      <meta charset="utf-8">
      <script defer src="calcula-operaciones.js"></script>
    </head>
    <body>

      <h1>Definición de componentes web</h1>
      
      <calcula-operaciones data-a="4" data-b="5">
        <span slot="title">Operaciones binarias</span>
        <span slot="mult">Multiplicación</span>
      </calcula-operaciones>
  
      <p>Fin de la pagina.</p>

    </body>
  </html>

El contenido del fichero ``calcula-operaciones.js`` es el siguiente:

.. code-block:: javascript
  :linenos:
  :force:

  (function() {
    const template = document.createElement('template');

    template.innerHTML = `
      <style>
        * {
          margin: 0;
          padding: 0;
        }
        h1 {
          color: steelblue;
          font-size: 110%;
          margin-bottom: 10px;
          border-bottom: 1px solid lightgray;
        }
        .contenido {
          background-color: gainsboro;
          color: royalblue;
        }
        :host {
          border: 1px solid lightgray;
          padding: 5px;
          display: block;
          margin: 5px;
          margin-bottom: 15px;
        }
      </style>

      <script>
        console.log("Template instanciado");
      </script>

      <h1><slot name="title">Sin título</slot></h1>
      <div class="contenido">
        <slot name="mult">Sin nombre</slot>: 
        <span id="a"></span> x <span id="b"></span> = 
        <span id="resultado"></span>.
      </div>`;

    class Operaciones extends HTMLElement {
      constructor() {
        super();
        let clone = template.content.cloneNode(true);
        let shadowRoot = this.attachShadow({
          mode: 'open'
        });
        shadowRoot.appendChild(clone);
      }

      connectedCallback() {
        this.a= this.hasAttribute('data-a')?this.getAttribute('data-a'):0;
        this.b= this.hasAttribute('data-b')?this.getAttribute('data-b'):0;
        this.shadowRoot.querySelector('#a').textContent= this.a;
        this.slotb= this.shadowRoot.querySelector('#b');
        this.slotb.textContent= this.b;
        let resultado= this.shadowRoot.querySelector('#resultado');
        resultado.textContent= this.a*this.b;
      }
    }

    customElements.define("calcula-operaciones", Operaciones);

  })();

El código anterior se ha encapsulado dentro de lo que se conoce como una *función invocada inmediatamente* (*immediately-invoked function expressions*, IIFE), que permite no contaminar el espacio de nombres global con variables que podrían estar siendo también definidas en otras librerías, evitando así potenciales conflictos.

Finalmente, vamos a sobrescribir el método estándar ``attributeChangedCallback``, que se dispara cuando alguno de los atributos del componente web se inicializa o se cambia. Sin este código, si el valor del atributo ``a`` o ``b`` cambiara dinámicamente (mediante JavaScript), el resultado de la multiplicación no se actualizaría; puedes comprobarlo fácilmente cambiando el valor de uno de los atributos desde las Chrome DevTools. Dado que ``attributeChangedCallback`` se llama también cuando el atributo recibe valor por primera vez y dado que nuestra implementación de ``connectedCallback`` no hacía nada más que usar los atributos, podemos eliminar esta última función. El método ``attributeChangedCallback`` solo se invoca para aquellos atributos incluidos en la lista devuelta por el método ``static get observedAttributes()`` (así evitamos que la función se invoque cuando se cambien otros atributos como ``style`` o ``class``).


.. Note::

  Hemos cambiado también el cálculo de la multiplicación para que se realice en un servidor web externo, aunque esto estrictamente no tenga que ver con la tecnología de componentes web. Observa cómo, aunque en este caso no es necesario ya que los atributos deberían ser números (opcionalmente con un punto o un signo más o menos, que también son un caracteres válidos en URLs), hemos seguido la buena práctica de utilizar ``encodeURI`` para obtener un URL sin caracteres no aceptados. Los caracteres válidos en un URL son::

    ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-._~:/?#[]@!$&'()*+,;=

  Cualquier otro carácter necesita ser convertido a la *codificación por ciento*, como ya hemos comentado otras veces.

El `código final`_ de nuestro componente web es el siguiente:

.. _`código final`: https://repl.it/@jaspock/InstructiveWhoppingAmpersand

.. code-block:: javascript
  :linenos:
  :force:

  (function() {
    const template = document.createElement('template');

    template.innerHTML = `
      <style>
        * {
          margin: 0;
          padding: 0;
        }
        h1 {
          color: steelblue;
          font-size: 110%;
          margin-bottom: 10px;
          border-bottom: 1px solid lightgray;
        }
        .contenido {
          background-color: gainsboro;
          color: royalblue;
        }
        :host {
          border: 1px solid lightgray;
          padding: 5px;
          display: block;
          margin: 5px;
          margin-bottom: 15px;
        }
      </style>

      <script>
        console.log("Template instanciado");
      </script>

      <h1><slot name="title">Sin título</slot></h1>
      <div class="contenido">
        <slot name="mult">Sin nombre</slot>: 
        <span id="a"></span> x <span id="b"></span> = 
        <span id="resultado"></span>.
      </div>`;

    class Operaciones extends HTMLElement {

      static get observedAttributes() { return ['data-a', 'data-b']; }

      constructor() {
        super();
        let clone = template.content.cloneNode(true);
        let shadowRoot = this.attachShadow({
          mode: 'open'
        });
        shadowRoot.appendChild(clone);
      }

      actualizaPrimerOperando() {
        this.shadowRoot.querySelector('#a').textContent= this.a;
      }

      actualizaSegundoOperando() {
        this.shadowRoot.querySelector('#b').textContent= this.b;
      }

      actualizaResultado() {
        let resultado= this.shadowRoot.querySelector('#resultado');
        fetch(encodeURI(`https://api.mathjs.org/v4/?expr=${this.a}*${this.b}`))
        .then( r => r.text() )
        .then( t => resultado.textContent= t )
        .catch( () => resultado.textContent= 'error' );
      }

      attributeChangedCallback(name,oldValue,newValue) {
        // ningún uso de this es opcional en esta función
        if (name==='data-a') {
          this.a= newValue;
          this.actualizaPrimerOperando();
          if (this.b) {
            this.actualizaResultado();
          }
        } else if (name==='data-b') {
          this.b= newValue;
          this.actualizaSegundoOperando();
          if (this.a) {
            this.actualizaResultado();
          }
        }
      }
    }

    customElements.define("calcula-operaciones", Operaciones);

  })();


.. Note::

  La palabra reservada ``get`` en JavaScript liga un atributo a un método (diremos que la función es un *getter* para la propiedad) de forma que aunque en el código cliente estemos accediendo a una propiedad en realidad estamos llamando a una función como puedes ver en el siguiente ejemplo:

  .. code-block:: javascript
    :linenos:

    class Polygon {
      constructor(height, width) {
        this.height = height;
        this.width = width;
      }

      get area() {
        return this.calcArea()
      }

      calcArea() {
        return this.height * this.width;
      }
    }

    var p = new Polygon(10, 20);
    console.log(p.area);


.. Warning::

  Como el método de nuestro componente anterior es estático, nos podríamos referir a él como ``Operaciones.observedAttributes``. Observa que, en cualquier caso, el código que termine accediendo a ``Operaciones.observedAttributes`` en el ejemplo anterior no es nuestro sino que forma parte de la API del navegador.


.. PENDIENTE: dilucidar por qué un console.log en un script dentro de un elemento <template> se ejecuta al insertar el árbol duplicado en el shadowRoot (como en los primeros ejemplos) de modo que la salida se ve por consola, pero no lo hace si la plantilla se define desde JavaScript con template.innerHTML (como en los últimos ejemplos).


.. Hint::

  Si tu aplicación web tiene que funcionar en versiones de los navegadores de hace unos años, es posible que estos no tuvieran implementados todavía los estándares relacionados con los componentes web. Para que los componentes web funcionen en navegadores antiguos es necesario cargar el `polyfill`_ correspondiente. El nombre de *polyfill* se utiliza para referirse a una librería que añade a un navegador una funcionalidad que no tiene implementada. Otra forma de asegurar el funcionamiento en navegadores antiguos de programas que usan características recientes de JavaScript es mediante compiladores como `Babel`_.

  .. _`polyfill`: https://cdnjs.com/libraries/webcomponentsjs
  .. _`Babel`: https://github.com/babel/babel
  

Ejercicio de ampliación del componente web
------------------------------------------

Las actividades anteriores han introducido las tecnologías fundamentales relacionadas con los componentes web. Ahora puedes intentar modificar el `código final`_ para introducirle algunas mejoras.
  
.. admonition:: Hazlo tú ahora
  :class: hazlotu

  Modifica nuestro componente web para que desde el código cliente pueda indicarse qué operación realizar de entre las cuatro operaciones matemáticas básicas.