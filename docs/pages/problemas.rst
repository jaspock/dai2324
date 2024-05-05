.. role:: problema-contador-marcado
.. role:: problema-contador-estilo
.. role:: problema-contador-cliente
.. role:: problema-contador-servicios
.. role:: problema-contador-componentes
.. role:: problema-contador-rest
.. role:: problema-contador-nube

.. _label-problemas:

Problemas
=========

Lenguajes de marcado
--------------------

.. admonition:: :problema-contador-marcado:`Problema`
  :class: problema

  Indica con qué código HTML es necesario sustituir la cadena ``@1`` para que el siguiente bloque HTML sea válido y corresponda a una tabla con dos filas (la primera de encabezado) y una columna.

  .. code-block:: html
    :linenos:

    <table>
      <thead><tr><td><em>Nombre del río</em>@1<td>Ebro</td></tr>
    </table>

  .. @1=</td></tr></thead><tr>

.. ------

.. admonition:: :problema-contador-marcado:`Problema`
  :class: problema

  Indica en qué orden colocar las líneas de HTML de más abajo para que el fragmento de código HTML resultante sea correcto y se visualice en un navegador aproximadamente como sigue, sin usar ninguna hoja de estilo adicional:

  .. raw:: html

    <div id="limon4">
      <script>
        var root = document.querySelector('#limon4').attachShadow({mode:'open'});
        root.innerHTML = `
          <style>
            .cuadrados {
              width: 500px;
              background: gainsboro;
              padding: 10px;
              margin-bottom: 10px;
            }
          </style>
          <div class="cuadrados">
            <section><h4>Colores
            </h4>
            <ul>
            <li>azul
            </li>
            </ul>
            </section>
          </div>`;
      </script>
    </div>

  .. code-block:: html
    :linenos:

    <li>azul
    <ul>
    </section>
    </li>
    <section><h4>Colores
    </h4>
    </ul>

  Una posible respuesta (incorrecta) tendría el formato ``1,2,3,4,5,6,7``.

  .. 5,6,2,1,4,7,3

.. ------

.. admonition:: :problema-contador-marcado:`Problema`
  :class: problema

  Dibuja el árbol DOM correspondiente al siguiente documento HTML. Representa todos los nodos, incluyendo aquellos que representan secuencias de blancos.

  .. code-block:: html
    :linenos:

    <!doctype html>
    <html lang="es"><head>
          <title>La historia interminable</title></head>
      <body><section><h2>La ciudad de los espectros</h2><p>Fújur se esforzó
      desesperadamente por encontrar otra vez el lugar en que Atreyu debía de haber
      caído al agua, pero hasta para un dragón blanco de la suerte es imposible
      descubrir en la espuma hirviente de un mar revuelto el puntito diminuto de un
      cuerpo que flota... o el de un ahogado en su fondo.</p><p>Sin embargo, Fújur
      no quiso renunciar.</p></section>
    </body>
    </html>

.. ------

.. admonition:: :problema-contador-marcado:`Problema`
  :class: problema

  Considera los siguientes datos: 

  - El carácter ``a`` (*Latin small letter a*, U+0061) en US-ASCII se repesenta como ``61`` en hexadecimal (``01100001`` en binario), igual que en ISO/IEC 8859 y que en UTF-8; en UTF-16 es ``FEFF0061`` (o en binario ``11111110 11111111 00000000 01100001``).
  - El carácter ``á`` (*Latin small letter a with acute*, U+00E1) se representa en ISO/IEC 8859-15 como ``E1`` y en UTF-8 como ``C3A1``.
  - El carácter ``Ã`` se representa en ISO/IEC 8859-15 como ``C3``.
  - El carácter ``¡`` se representa en ISO/IEC 8859-15 como ``A1``.

  Teniendo en cuenta los datos de las diapositivas anteriores, ¿cómo se ve un fichero de texto escrito en UTF-8 que contiene la cadena ``aáa`` en un editor de texto configurado para ISO/IEC 8859-15? ¿Cómo se ve un fichero de texto escrito en ISO/IEC 8859-15 que contiene la cadena ``aáa`` en un editor de texto configurado para UTF-8?

.. ------

.. admonition:: :problema-contador-marcado:`Problema`
  :class: problema

  Indica con qué código HTML es necesario sustituir las marcas ``@1`` y ``@2`` para que el siguiente bloque de HTML sea válido.

  .. code-block:: html
    :linenos:
    :force:

    <div>
      <img src="imagen.png" @1="diagrama de clases">
      <span @2-paquete="es.ua.dai">compilado sin errores</span>
    </div>

  .. solución: @1=alt,@2=data 
  .. examen enero 2020

.. ------

.. admonition:: :problema-contador-marcado:`Problema`
  :class: problema

  ¿Qué tamaño en bytes tiene en UTF-8 el carácter del avión (✈) si sabemos que con UTF-8 la cadena (sin las comillas) "Avión a reacción: ✈" ocupa 23 bytes? Nota: por si no se distingue bien, la cadena tiene 3 espacios en blanco.

  .. solución: 3
  .. examen enero 2020

.. ------

.. admonition:: :problema-contador-marcado:`Problema`
  :class: problema

  Considera estos tres caracteres: ``鮨``, ``ü``, ``$``. Si sabemos que el kanji japonés ``鮨`` (sushi) no ocupa dos caracteres en UTF-8, indica cuál de los caracteres de la lista hay que añadir a un fichero de texto codificado en UTF-8 que contenía inicialmente los caracteres "``鮨sushi鮨ñamñam``" (sin las comillas) para que el fichero pase a tener 21 bytes de tamaño. La respuesta no es *ninguno*.

  .. solución: inicialmente 19, 鮨=sushi son 3 caracteres en UTF-8, hay que añadir ü
  .. examen enero 2021

.. --------

.. admonition:: :problema-contador-marcado:`Problema`
  :class: problema

  Aunque en el idioma birmano es habitual usar los números arábigos, las cantidades pueden encontrarse también representadas con números que usan una grafía propia. Los números del 1 al 5 en esta grafía del birmano son: "၁", "၂", "၃", "၄" y "၅". El sistema de numeración usado es el indo-arábigo (el mismo que usamos nosotros) y, por lo tanto, el número 12345 se representa como "၁၂၃၄၅". Sin más información que la que has estudiado en la asignatura respecto al estándar Unicode, indica una cota inferior y una cota superior de la cantidad de bytes que son necesarios para representar en UTF-8 la cadena que representa el número "၁၂၂၄၂၄".

  .. solución: 6*2= 12, 6*4=24
  .. examen julio 2021

.. -------

.. admonition:: :problema-contador-marcado:`Problema`
  :class: problema

  Indica con qué código HTML es necesario sustituir las marcas ``@1`` y ``@2`` para que el siguiente bloque de HTML sea válido.

  .. code-block:: html
    :linenos:
    :force:

    <section>
        <span @2-color="yellow">NEW!</span>
        <img src="rainbow.svg" @1="vector graphic">
    </section>

  .. solución: @1=alt, @2=data
  .. examen julio 2021

.. --------



Lenguajes de estilo
-------------------

.. admonition:: :problema-contador-estilo:`Problema`
  :class: problema

  Considera el siguiente fragmento de un documento HTML:

  .. code-block:: html
    :linenos:

    <body>
      <section>
        <header><h1>The Boy Who Lived</h1></header>
        <p>Mr. and Mrs. Dursley, of number four, Privet Drive, 
          were proud to say that they were perfectly normal, 
          thank you very much.</p>
        <p class="last">They were the last people you'd expect to 
          be involved in anything strange or mysterious, because they
          just didn't hold with such nonsense.</p>
      </section>
    </body>

  Considera también los siguientes estilos de CSS:

  .. code-block:: css
    :linenos:

    p {
      color: red;
    }
    p.last {
      color: gray;
    }
    section > p {
      color: blueviolet;
    }
    header h1 p {
      color: green;
    }
    section {
      color: lightskyblue;
    }
    p {
      color: black;
    }

  ¿De qué color se muestra el párrafo que comienza por "They were the last people..."? ¿Y el párrafo anterior a ese? Indica como respuesta los dos colores separados por una coma.

  .. solución: gray, blueviolet; https://jsfiddle.net/vhbc4t5s/

.. ------

.. admonition:: :problema-contador-estilo:`Problema`
  :class: problema

  Considera el siguiente fragmento de CSS:

  .. code-block:: css
    :linenos:

    .a {font-weight: normal;}
    .a .b {color: blue;}
    .a .b #c {color: red;}
    .destaca {font-weight: bold;}

  Indica con qué sustituir las dos arrobas (``@1``, ``@2``) para que dado el siguiente fragmento de HTML el texto *Privet Drive* se muestre en negrita y color rojo. Usa la notación ``@1=...,@2=...`` para tu respuesta.

  .. code-block:: html
    :linenos:

    <p class="a">El señor y la señora Dursley, que vivían en el 
    número 4 de @1 Privet Drive @2, estaban orgullosos de decir 
    que eran muy normales, afortunadamente.</p>

  .. solución: @1=<span class="b"><span class="destaca" id="c">, @2=</span></span>

.. ------

.. admonition:: :problema-contador-estilo:`Problema`
  :class: problema

  Dibuja de la forma más precisa que puedas cómo representaría un navegador el siguiente bloque de código. No es necesario que los colores o el tipo de letra coincidan. Todos los tamaños han de mantener de forma aproximada la misma proporcionalidad que tendrían en la ventana del navegador: decide cuál es el tamaño en papel de, por ejemplo, 10 píxeles, y mantén la escala en todos los elementos.

  .. code-block:: html
    :linenos:

    <body>
      <div id="peligrosas">
        colacuerno
        <div id="basilisco">basilisco</div>
      </div>
      <div id="hipogrifo">hipogrifo</div>
    <body>

  Considera que se están aplicando los siguientes estilos:

  .. code-block:: css
    :linenos:

    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }
    body {
      margin: 10px;
    }
    #peligrosas {         
      width: 200px;
      border: 1px solid darkgray;
      padding-left: 50px;
      padding-bottom: 50px;
    }
    #basilisco {
      width: 50px; 
    }
    #hipogrifo {
      width: 100px;
      border: 1px dotted darkgray;
      text-align: right;
      padding-bottom: 50px;
    }

  .. solución: https://jsfiddle.net/xep58sr7/

.. ------

.. admonition:: :problema-contador-estilo:`Problema`
  :class: problema

  Considera el siguiente fragmento de un documento HTML:

  .. code-block:: html
    :linenos:

    <body>
      <h1>Lista</h1>
      <section>
        <article>artículo1</article>
        <article>artículo2</article>
      </section>
    </body>

  Teníamos una hoja de estilo que asignaba estilos a cada elemento para que el documento se visualizara como sigue (el fondo gris representa la ventana del navegador):
  
  .. raw:: html

    <div id="problema-borrado">
      <script>
        var root = document.querySelector('#problema-borrado').attachShadow({mode:'open'});
        root.innerHTML = `
          <style>
          .cuadrados {
            background: gainsboro; 
            padding: 10px; 
            margin-bottom: 20px;
          }
          h1, section, article {
            display: inline;
          }
          h1::after {
            content: ": ";
          }
          h1 {
            font-family: sans-serif;
            font-style: italic;
          }
          article {
            font-family: serif;
          }
          </style>
          <div class="cuadrados">
            <h1>Lista</h1>
            <section>
              <article>artículo1</article>
              <article>artículo2</article>
            </section>
          </div>`;
      </script>
    </div>
  
  Lamentablemente, las propiedades del fichero CSS se nos han borrado y solo nos han quedado las siguientes reglas vacías que únicamente tienen selector pero ninguna propiedad:

  .. code-block:: css
    :linenos:

    h1, section, article {  }
    h1::after {  }
    h1 {  }
    article {  }

  Indica en qué regla de las anteriores hay que colocar cada una de las siguientes propiedades CSS para que el documento HTML se vuelva a visualizar como antes:

  1. ``font-family:serif``
  2. ``display:inline``
  3. ``font-family:sans-serif``
  4. ``content:": "``
  5. ``font-style:italic``

  Para abreviar, usa una notación como la de la siguiente posible respuesta (incorrecta): ``h1, section, article {1}`` / ``h1::after {1;2}`` / ``h1 {3;4}`` / ``article {5}``.

  .. solución: h1, section, article {2} / h1::after {4} / h1 {3,5} / article {1}; https://jsfiddle.net/b6qnrpy3/

.. ------

.. admonition:: :problema-contador-estilo:`Problema`
  :class: problema

  Dado el siguiente fragmento de un documento HTML, indica un selector que tenga menos de 10 caracteres y que permita seleccionar el párrafo que contiene la cadena ``dos``:

  .. code-block:: html
    :linenos:

    <body>
      <header>
        <h1>a</h1>
      </header>
      <main id="principal" class="info-descripción act">
        <h2>b</h2>
        <p>uno</p>
        <p id="info-detalle" class="act">dos</p>
      </main>
      <section>
        <h2>c</h2>
        <p>tres</p>
        <p lang="ca" class="act">quatre</p>
      </section>
    </body>

  .. solución: main .act; https://jsfiddle.net/2mt1p7he/

.. ------

.. admonition:: :problema-contador-estilo:`Problema`
  :class: problema

  Indica la palabra con la que rellenar el hueco de la siguiente frase para que sea correcta: el selector ``#a[href="https://example.org"]`` es un selector compuesto que incluye un selector de ``_____`` y un selector de identificador.

  .. solución: atributos

.. ------

.. admonition:: :problema-contador-estilo:`Problema`
  :class: problema

  Dados los siguientes estilos de CSS:
  
  .. code-block:: css
    :linenos:

    li {
      display: inline;
      margin: 0px 25px 0px 25px;
      padding: 10px 50px 10px 0px;
      border: 2px solid #000000;
    }

  Dibuja de la forma más aproximada posible cómo representaría el navegador el siguiente fragmento de HTML. Comienza pintando un recuadro que represente la ventana del navegador.

  .. code-block:: html
    :linenos:

    <p>Recuerdo cada varita que he vendido, Harry Potter. 
    Cada una de las varitas. 
    Y resulta que la cola de fénix de donde salió la pluma 
    que está en tu varita dio otra pluma,</p>
    <ul>
      <li>solo</li>
      <li>una</li>
      <li>más.</li>
    </ul>

  .. solución: https://jsbin.com/howativusi

.. ------

.. admonition:: :problema-contador-estilo:`Problema`
  :class: problema

  Considera el siguiente fragmento de un documento HTML:

  .. code-block:: html
    :linenos:

    <body>
      <div class="cuadrados">
        <div class="orange">naranja</div>
        <div class="blue">azul</div>
        <div class="lavender">lavanda</div>
        <div class="palegreen">verde</div>
      </div>
    </body>
    
  Considera también los siguientes estilos de CSS:

  .. code-block:: css
    :linenos:
    :force:

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
      top: -100px;
      left: 100px;
    }
    .lavender {
      background: lavender;
      height: 100px;
      width: 100px;
      position: relative;
      top: -100px;
    }
    .palegreen {
      background: palegreen;
      height: 100px;
      width: 100px;
      position: relative;
      @1
    }

  Indica el código CSS por el que es necesario sustituir la marca ``@1`` para que el fragmento HTML se muestre como sigue:

  .. raw:: html

    <div id="problema-puzle">
    <script>
      var root = document.querySelector('#problema-puzle').attachShadow({mode:'open'});
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
          top: -100px;
          left: 100px;
        }
        .lavender {
          background: lavender;
          height: 100px;
          width: 100px;
          position: relative;
          top: -100px;
        }
        .palegreen {
          background: palegreen;
          height: 100px;
          width: 100px;
          position: relative;
          top: -200px;
          left: 100px;
        }
        </style>
        <div class="cuadrados">
          <div class="orange">naranja</div>
          <div class="blue">azul</div>
          <div class="lavender">lavanda</div>
          <div class="palegreen">verde</div>
        </div>`;
    </script>
    </div>
    
  Considera que no hay otros estilos definidos que puedan entrar en conflicto con los que escribas.

.. ------

.. admonition:: :problema-contador-estilo:`Problema`
  :class: problema

  Dibuja de la forma más precisa que puedas cómo representaría un navegador el siguiente bloque de código. No es necesario que los colores o el tipo de letra coincidan. Todos los tamaños han de mantener de forma aproximada la misma proporcionalidad que tendrían en la ventana del navegador: decide cuál es el tamaño en papel de, por ejemplo, 50 píxeles, y mantén la escala en todos los elementos.

  .. code-block:: html
    :linenos:

    <div class="cuadrados">
      <div class="blue">azul</div>
      <div class="lavender">lavanda</div>
    </div>

  Considera que se están aplicando los siguientes estilos:

  .. code-block:: css
    :linenos:

    * {
      margin: 0;
      box-sizing: border-box;
    }
    .cuadrados {
      padding: 10px;
      border: 1px solid darkgray;
      height: 200px;
      width: 200px;
    }
    .blue {
      border: 1px dashed darkgray;
      height: 50px;
      width: 50px;
      position: relative;
      top: 100px;
      left: 50px;
    }
    .lavender {
      border: 1px solid darkgray;
      height: 100px;
      width: 100px;
    }

  .. solución: https://jsfiddle.net/3m6w1gbx/2/ 
  .. examen enero 2020

.. ------

.. admonition:: :problema-contador-estilo:`Problema`
  :class: problema

  Dibuja de la forma más precisa que puedas cómo representaría un navegador el siguiente bloque de código. No es necesario que los colores o el tipo de letra coincidan. Todos los tamaños han de mantener de forma aproximada la misma proporcionalidad que tendrían en la ventana del navegador: decide cuál es el tamaño en papel de, por ejemplo, 50 píxeles, y mantén la escala en todos los elementos.

  .. code-block:: html
    :linenos:

    <div class="cuadrados">
      <div class="blue">azul</div>
      <div class="lavender">lavanda</div>
    </div>

  Considera que se están aplicando los siguientes estilos:

  .. code-block:: css
    :linenos:

    * {
      margin: 0;
      box-sizing: border-box;
    }
    .cuadrados {
      padding: 10px;
      border: 1px solid darkgray;
      position: relative;
      height: 200px;
      width: 200px;
    }
    .blue {
      border: 1px dashed darkgray;
      height: 50px;
      width: 50px;
      position: absolute;
      top: 50px;
      left: 50px;
    }
    .lavender {
      border: 1px solid darkgray;
      height: 100px;
      width: 100px;
    }

  .. solución: https://jsfiddle.net/5zowyq0p/1/
  .. examen enero 2020



.. admonition:: :problema-contador-estilo:`Problema`
  :class: problema

  Considera el siguiente código de una página web:

  .. code-block:: html
    :linenos:

    <!doctype html>
    <html lang="es">
      <head>
        <meta charset="utf-8">
        <title>Cuadrados</title>
        <style>
          .cuadrados {
            width: 500px;
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
          }
          .lavender {
            background: lavender;
            height: 100px;
            width: 100px;
          }
          .lemonchiffon {
            background: lemonchiffon;
            height: 100px;
            width: 100px;
          }      
        </style>
      </head>
      <body>
        <div class="cuadrados">
          <div class="orange">naranja</div>
          <div class="blue">azul</div>
          <div class="lavender">lavanda</div>
          <div class="lemonchiffon">lemonchiffon</div>
        </div>
      </body>
    </html>

  La página anterior se muestra en el navegador como sigue: 

  .. raw:: html

    <div id="limon1">
      <script>
        var root = document.querySelector('#limon1').attachShadow({mode:'open'});
        root.innerHTML = `
          <style>
            .cuadrados {
              width: 500px;
              background: gainsboro;
              padding: 10px;
              margin-bottom: 10px;
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
            .lemonchiffon {
              background: lemonchiffon;
              height: 100px;
              width: 100px;
            }      
          </style>
          <div class="cuadrados">
            <div class="orange">naranja</div>
            <div class="blue">azul</div>
            <div class="lavender">lavanda</div>
            <div class="lemonchiffon">lemonchiffon</div>
          </div>`;
      </script>
    </div>

  Considera ahora una versión ligeramente diferente del código anterior:

  .. code-block:: html
    :linenos:

    <!doctype html>
    <html lang="es">
      <head>
        <meta charset="utf-8">
        <title>Cuadrados del problema 4</title>
        <style>
          .cuadrados {
            width: 500px;
            background: gainsboro;
            padding: 10px;
          }
          .orange {
            background: orange;
            height: 100px;
            width: 100px;
            position: relative;
            left: @1;
          }
          .blue {
            background: lightskyblue;
            height: 100px;
            width: 100px;
            position: relative;
            right: @2;
          }
          .lavender {
            background: lavender;
            height: 100px;
            width: 100px;
            position: relative;
            left: @1;
          }
          .lemonchiffon {
            background: lemonchiffon;
            height: 100px;
            width: 100px;
            position: relative;
            right: @2;
          }      
        </style>
      </head>
      <body>
        <div class="cuadrados">
          <div class="orange">naranja</div>
          <div class="blue">azul</div>
          <div class="lavender">lavanda</div>
          <div class="lemonchiffon">lemonchiffon</div>
        </div>
      </body>
    </html>

  Indica con qué sustituir @1 y @2 en el código anterior para que el documento se muestre cómo sigue:

  .. raw:: html

    <div id="limon2">
      <script>
        var root = document.querySelector('#limon2').attachShadow({mode:'open'});
        root.innerHTML = `
          <style>
          .cuadrados {
            width: 500px;
            background: gainsboro;
            padding: 10px;
            margin-bottom: 10px;
          }
          .orange {
            background: orange;
            height: 100px;
            width: 100px;
            position: relative;
            left: 400px;
          }
          .blue {
            background: lightskyblue;
            height: 100px;
            width: 100px;
            position: relative;
            right: -400px;
          }
          .lavender {
            background: lavender;
            height: 100px;
            width: 100px;
            position: relative;
            left: 400px;
          }
          .lemonchiffon {
            background: lemonchiffon;
            height: 100px;
            width: 100px;
            position: relative;
            right: -400px;
          }      
        </style>
        <div class="cuadrados">
          <div class="orange">naranja</div>
          <div class="blue">azul</div>
          <div class="lavender">lavanda</div>
          <div class="lemonchiffon">lemonchiffon</div>
        </div>`;
      </script>
    </div>

  Como pista, recuerda que en el posicionamiento relativo un valor positivo de la propiedad ``right`` especifica la distancia que el límite derecho del elemento se ha de mover a la izquierda respecto a su posición normal; un valor negativo de la propiedad ``right`` especifica, al contrario, la distancia que el límite derecho del elemento se ha de mover a la derecha respecto a su posición normal. En el caso de la propiedad ``left`` un valor positivo representa un movimiento a la derecha de la caja y un valor negativo representa un movimiento a la izquierda.

  .. solución: @1=400px, @2=-400px
  .. examen julio 2020
  .. jugar con left y right para hacer distintas combinaciones poniendo left y right en distintas combinaciones y en otros



.. admonition:: :problema-contador-estilo:`Problema`
  :class: problema

  Considera el siguiente código de una página web:

  .. code-block:: html
    :linenos:

    <!doctype html>
    <html lang="es">
      <head>
        <meta charset="utf-8">
        <title>Cuadrados del problema 5</title>
        <style>
          .cuadrados {
            width: 500px;
            background: gainsboro;
            padding: 10px;
          }
          .orange {
            background: orange;
            height: 100px;
            width: 100px;
            position: relative;
            bottom: @1;
          }
          .blue {
            background: lightskyblue;
            height: 100px;
            width: 100px;
            position: relative;
            bottom: @2;
          }
          .lavender {
            background: lavender;
            height: 100px;
            width: 100px;
            position: relative;
            bottom: @3;
          }
          .lemonchiffon {
            background: lemonchiffon;
            height: 100px;
            width: 100px;
            position: relative;
            bottom: @4;
          }      
        </style>
      </head>
      <body>
        <div class="cuadrados">
          <div class="orange">naranja</div>
          <div class="blue">azul</div>
          <div class="lavender">lavanda</div>
          <div class="lemonchiffon">lemonchiffon</div>
        </div>
      </body>
    </html>

  Indica con qué sustituir ``@1``, ``@2``, ``@3`` y ``@4`` en el código anterior para que el documento se muestre cómo sigue: 

  .. raw:: html

    <div id="limon3">
      <script>
        var root = document.querySelector('#limon3').attachShadow({mode:'open'});
        root.innerHTML = `
          <style>
            .cuadrados {
              width: 500px;
              background: gainsboro;
              padding: 10px;
              margin-bottom: 10px;
            }
            .orange {
              background: orange;
              height: 100px;
              width: 100px;
              position: relative;
              bottom: -300px;
            }
            .blue {
              background: lightskyblue;
              height: 100px;
              width: 100px;
              position: relative;
              bottom: -100px;
            }
            .lavender {
              background: lavender;
              height: 100px;
              width: 100px;
              position: relative;
              bottom: 100px;
            }
            .lemonchiffon {
              background: lemonchiffon;
              height: 100px;
              width: 100px;
              position: relative;
              bottom: 300px;
            }      
          </style>
          <div class="cuadrados">
            <div class="orange">naranja</div>
            <div class="blue">azul</div>
            <div class="lavender">lavanda</div>
            <div class="lemonchiffon">lemonchiffon</div>
          </div>`;
      </script>
    </div>

  Como pista, recuerda que en el posicionamiento relativo un valor positivo de la propiedad ``right`` especifica la distancia que el límite derecho del elemento se ha de mover a la izquierda respecto a su posición normal; un valor negativo de la propiedad ``right`` especifica, al contrario, la distancia que el límite derecho del elemento se ha de mover a la derecha respecto a su posición normal. En el caso de la propiedad ``left`` un valor positivo representa un movimiento a la derecha de la caja y un valor negativo representa un movimiento a la izquierda. Para este problema en concreto puedes adaptar la pista anterior sobre las propiedades ``left`` y ``right`` al caso de las propiedades ``top`` y ``bottom``.

  .. solución: @1=-300px,@2=-100px,@3=100px,@4=300px
  .. examen julio 2020



.. admonition:: :problema-contador-estilo:`Problema`
  :class: problema

  Considera el siguiente código de una página web:

  .. code-block:: html
    :linenos:
    :force:

    <!doctype html>
    <html lang="es">
      <head>
        <meta charset="utf-8">
        <title>Cuadrados del problema 6</title>
        <style>
          .cuadrados {
            width: 500px;
            height: 400px;
            background: gainsboro;
            padding: 10px;
            position: @1;
          }
          .orange {
            background: orange;
            height: 100px;
            width: 100px;
            position: absolute;
            top: 10px;
            @2: 10px;
          }
          .blue {
            background: lightskyblue;
            height: 100px;
            width: 100px;
            position: absolute;
            top: 110px;
          }
          .lavender {
            background: lavender;
            height: 100px;
            width: 100px;
            position: absolute;
            top: 210px;
          }
          .lemonchiffon {
            background: lemonchiffon;
            height: 100px;
            width: 100px;
            position: @3;
            top: @4;
          }      
        </style>
      </head>
      <body>
        <div class="cuadrados">
          <div class="orange">naranja</div>
          <div class="blue">azul</div>
          <div class="lavender">lavanda</div>
          <div class="lemonchiffon">lemonchiffon</div>
        </div>
      </body>
    </html>

  Indica con qué sustituir ``@1``, ``@2``, ``@3`` y ``@4`` en el código anterior para que el documento se muestre cómo sigue: 

  .. raw:: html

    <div id="limon5">
      <script>
        var root = document.querySelector('#limon5').attachShadow({mode:'open'});
        root.innerHTML = `
          <style>
            .cuadrados {
              width: 500px;
              height: 410px;
              background: gainsboro;
              padding: 10px;
              position: relative;
              margin-bottom: 10px;
            }
            .orange {
              background: orange;
              height: 100px;
              width: 100px;
              position: absolute;
              top: 10px;
              right: 10px;
            }
            .blue {
              background: lightskyblue;
              height: 100px;
              width: 100px;
              position: absolute;
              top: 110px;
            }
            .lavender {
              background: lavender;
              height: 100px;
              width: 100px;
              position: absolute;
              top: 210px;
            }
            .lemonchiffon {
              background: lemonchiffon;
              height: 100px;
              width: 100px;
              position: absolute;
              top: 310px;
            }      
          </style>
          <div class="cuadrados">
            <div class="orange">naranja</div>
            <div class="blue">azul</div>
            <div class="lavender">lavanda</div>
            <div class="lemonchiffon">lemonchiffon</div>
          </div>`;
      </script>
    </div>

  Como pista, recuerda que en el posicionamiento absoluto la propiedad ``top`` especifica la distancia entre el límite superior del elemento y el límite superior de *cierto* elemento contenedor; si el valor es negativo, el límite superior de dicho elemento contenedor queda por debajo del límite superior del elemento contenido. De forma análoga, puedes deducir el propósito de las propiedades ``left``, ``top`` o ``bottom``.

  .. solución: @1=relative,@2=right,@3=absolute,@4=310px
  .. considerar esta solución: @3=relative,@4=300px
  .. examen julio 2020


.. admonition:: :problema-contador-estilo:`Problema`
  :class: problema

  Considera el siguiente fragmento de un documento en HTML:

  .. code-block:: html
    :linenos:

    <ol id="o3">
      <li class="c9">orangered</li>
      <li class="c7">tomato</li>
      <li class="c9 c7">firebrick</li>
      <li id="choco">chocolate</li>
      <ul>
        <li class="c9">mintcream</li>
      </ul>
    </ol>


  Considera que al documento anterior se le están aplicando los siguientes estilos:

  .. code-block:: css
    :linenos:

    *       {color: aqua;}
    @1      {color: firebrick;}
    #choco  {color: chocolate;}
    @2      {color: mintcream;}
    @3      {color: orangered;}
    @4      {color: tomato;}

  Indica con qué sustituir las marcas ``@1``, ``@2``, ``@3`` y ``@4`` en el fragmento de CSS anterior para que cada elemento de la lista se muestre en el color que corresponde a su nombre, es decir, la palabra *chocolate* se muestre en color ``chocolate``, etc. Asume que cualquier valor asignado a un atributo ``class`` puede estar asignado a otro atributo ``class`` en otras partes no mostradas del documento HTML y que cualquiera de los elementos HTML pueden estar siendo usados en otras partes del documento. Si hay más de una posibilidad para sustituir una determinada marca, pon la que menos caracteres ocupe.

  .. solución: @1=#o3 .c9.c7, @2=#o3 ul .c9, @3=#o3 .c9, @4=#o3 .c7
  .. examen julio 2020


.. ------

.. admonition:: :problema-contador-estilo:`Problema`
  :class: problema

  *Nota:* este problema está basado en la rejilla de CSS, un tema que puede ser opcional en algunos cursos académicos; asegúrate de si este año lo es o no antes de intentar resolverlo. 
  
  Considera el siguiente fragmento de HTML:

  .. code-block:: html
    :linenos:

    <div class="container">
      <div class="cell">1</div>
      <div class="cell">2</div>
      <div class="cell">3</div>
      <div class="cell">4</div>
      <div class="cell menu">5</div>
    </div>

  Y los siguientes estilos de CSS:

  .. code-block:: css
    :linenos:
    :force:

    .container {
      display: grid;
      grid-template-columns: 1fr 1fr 1fr;
      grid-template-rows: repeat(@1, 2fr);
      grid-gap: 10px;
      text-align: center;
      background-color: #eee;
      border: 1px solid #000;
      color: #000;
      width: 500px;
      height: 250px;
      --bg-color: #658db5;
    }

    .cell {
      background-color: var(--bg-color);
      padding: 25px;
      border-radius: 6px;
    }

    .menu {
      background-color: #898989;
      grid-column: @2;
      grid-row: @3 / 3;
    }

  Indica con qué sustituir ``@1``, ``@2`` y ``@3`` en el código anterior para que el documento se muestre como sigue:

  .. raw:: html

    <div id="problema-grid1">
      <script>
        var root = document.querySelector('#problema-grid1').attachShadow({mode:'open'});
        root.innerHTML = `
          <style>
              .container {
                display: grid;
                grid-template-columns: 1fr 1fr 1fr;
                grid-template-rows: repeat(2, 2fr);
                grid-gap: 10px;
                text-align: center;
                background-color: #eee;
                border: 1px solid #000;
                color: #000;
                width: 500px;
                height: 250px;
                --bg-color: #658db5;
                }
                .cell {
                background-color: var(--bg-color);
                padding: 25px;
                border-radius: 6px;
                }
                .menu {
                background-color: #898989;
                grid-column: 3 ;
                grid-row: 1 / 3;
                }
          </style>
          <div class="container">
            <div class="cell">1</div>
            <div class="cell">2</div>
            <div class="cell">3</div>
            <div class="cell">4</div>
            <div class="cell menu">5</div>
          </div>`;
      </script>
    </div>

  .. solución: @1=2, @2=3, @3=1

.. ------

.. admonition:: :problema-contador-estilo:`Problema`
  :class: problema

  *Nota:* este problema está basado en la rejilla de CSS, un tema que puede ser opcional en algunos cursos académicos; asegúrate de si este año lo es o no antes de intentar resolverlo. 
  
  Este problema incluye código que permite mostrar un *sprite* de 8x8 píxels usando rejillas de CSS. El código HTML es el siguiente:

  .. code-block:: html
    :linenos:

    <div class="duck">
      <!-- fila 1: -->
      <div class="i fondo"></div>
      <div class="i pato"></div>
      <div class="i pato"></div>
      <div class="i pato"></div>
      <div class="i pato"></div>
      <div class="i pato"></div>
      <div class="i pato"></div>
      <div class="i pato"></div>
      <!-- fila 2: -->
      <div class="i fondo"></div>
      <div class="i fondo"></div>
      <div class="i pato"></div>
      <div class="i pato"></div>
      <div class="i pato"></div>
      <div class="i pato"></div>
      <div class="i pato"></div>
      <div class="i pato"></div>
      <!-- fila 3: -->
      <div class="i fondo"></div>
      <div class="i fondo"></div>
      <div class="i pato"></div>
      <div class="i pato"></div>
      <div class="i pato"></div>
      <div class="i pato"></div>
      <div class="i pato"></div>
      <div class="i pato"></div>
      <!-- fila 4: -->
      <div class="i fondo"></div>
      <div class="i gafas"></div>
      <div class="i gafas"></div>
      <div class="i gafas"></div>
      <div class="i gafas"></div>
      <div class="i gafas"></div>
      <div class="i gafas"></div>
      <div class="i gafas"></div>
      <!-- fila 5: -->
      <div class="i fondo"></div>
      <div class="i gafas"></div>
      <div class="i gafas"></div>
      <div class="i pato"></div>
      <div class="i gafas"></div>
      <div class="i gafas"></div>
      <div class="i gafas"></div>
      <div class="i pato"></div>
      <!-- fila 6: -->
      <div class="i pico"></div>
      <div class="i pico"></div>
      <div class="i pico"></div>
      <div class="i pico"></div>
      <div class="i pato"></div>
      <div class="i pato"></div>
      <div class="i pato"></div>
      <div class="i pato"></div>
      <!-- fila 7: -->
      <div class="i fondo"></div>
      <div class="i fondo"></div>
      <div class="i pato"></div>
      <div class="i pato"></div>
      <div class="i pato"></div>
      <div class="i pato"></div>
      <div class="i pato"></div>
      <div class="i pato"></div>
      <!-- fila 8: -->
      <div class="i fondo"></div>
      <div class="i fondo"></div>
      <div class="i pato"></div>
      <div class="i pato"></div>
      <div class="i pato"></div>
      <div class="i pato"></div>
      <div class="i pato"></div>
      <div class="i pato"></div>
    </div>

  Y los estilos de CSS son:

  .. code-block:: css
    :linenos:
    :force:

    .duck {
      display: grid;
      grid-template-columns: repeat(@1, 10px);
      grid-template-rows: repeat(@2, 10px);
      grid-gap: 0;
      border: 1px solid black;
      width: 80px;
      height: 80px;
    }

    .i {
      width: @3;
      height: @4;
    }

    .pato { background-color: white; }
    .pico { background-color: yellow; }
    .gafas { @5; }
    .fondo { background-color: gray; }

  Indica con qué sustituir ``@1``, ``@2``, ``@3``, ``@4`` y ``@5`` en el código anterior para que se muestre un *sprite* (tomado de [aquí](https://pixeljoint.com/pixelart/45130.htm)) de un pato con gafas de sol negras mirando a la izquierda como el siguiente:

  .. raw:: html

    <div id="problema-pato">
      <script>
        var root = document.querySelector('#problema-pato').attachShadow({mode:'open'});
        root.innerHTML = `
          <style>
            .duck {
              display: grid;
              grid-template-columns: repeat(8, 10px);
              grid-template-rows: repeat(8, 10px);
              grid-gap: 0;
              border: 1px solid black;
              width: 80px;
              height: 80px;
            }

            .i {
              width: 10px;
              height: 10px;
            }

            .pato { background-color: white; }
            .pico { background-color: yellow; }
            .gafas { background-color: black; }
            .fondo { background-color: gray; }

          </style>
      <div class="duck">
      <!-- fila 1: -->
      <div class="i fondo"></div>
      <div class="i pato"></div>
      <div class="i pato"></div>
      <div class="i pato"></div>
      <div class="i pato"></div>
      <div class="i pato"></div>
      <div class="i pato"></div>
      <div class="i pato"></div>
      <!-- fila 2: -->
      <div class="i fondo"></div>
      <div class="i fondo"></div>
      <div class="i pato"></div>
      <div class="i pato"></div>
      <div class="i pato"></div>
      <div class="i pato"></div>
      <div class="i pato"></div>
      <div class="i pato"></div>
      <!-- fila 3: -->
      <div class="i fondo"></div>
      <div class="i fondo"></div>
      <div class="i pato"></div>
      <div class="i pato"></div>
      <div class="i pato"></div>
      <div class="i pato"></div>
      <div class="i pato"></div>
      <div class="i pato"></div>
      <!-- fila 4: -->
      <div class="i fondo"></div>
      <div class="i gafas"></div>
      <div class="i gafas"></div>
      <div class="i gafas"></div>
      <div class="i gafas"></div>
      <div class="i gafas"></div>
      <div class="i gafas"></div>
      <div class="i gafas"></div>
      <!-- fila 5: -->
      <div class="i fondo"></div>
      <div class="i gafas"></div>
      <div class="i gafas"></div>
      <div class="i pato"></div>
      <div class="i gafas"></div>
      <div class="i gafas"></div>
      <div class="i gafas"></div>
      <div class="i pato"></div>
      <!-- fila 6: -->
      <div class="i pico"></div>
      <div class="i pico"></div>
      <div class="i pico"></div>
      <div class="i pico"></div>
      <div class="i pato"></div>
      <div class="i pato"></div>
      <div class="i pato"></div>
      <div class="i pato"></div>
      <!-- fila 7: -->
      <div class="i fondo"></div>
      <div class="i fondo"></div>
      <div class="i pato"></div>
      <div class="i pato"></div>
      <div class="i pato"></div>
      <div class="i pato"></div>
      <div class="i pato"></div>
      <div class="i pato"></div>
      <!-- fila 8: -->
      <div class="i fondo"></div>
      <div class="i fondo"></div>
      <div class="i pato"></div>
      <div class="i pato"></div>
      <div class="i pato"></div>
      <div class="i pato"></div>
      <div class="i pato"></div>
      <div class="i pato"></div>
    </div>`;
      </script>
    </div>

  .. solución: @1=@2=8, @3=@4=10px, @5=background-color:black

.. ------

.. admonition:: :problema-contador-estilo:`Problema`
  :class: problema

  *Nota:* este problema está basado en las animaciones de CSS, un tema que puede ser opcional en algunos cursos académicos; asegúrate de si este año lo es o no antes de intentar resolverlo. 
  
  Considera los siguientes estilos de CSS que permiten animar el carácter de la mano que saluda (en realidad, cualquier carácter) haciendo ``<span class="wave">👋🏾</span>``. La idea es que la mano se pause durante la segunda mitad de la animación y que el movimiento se repita indefinidamente:

  .. code-block:: css
    :linenos:
    :force:

    .wave {
      animation-name: wave-animation;
      animation-duration: 2.5s;
      animation-iteration-count: @1;
      transform-origin: 70% 70%;
      display: inline-block;
    }

    @keyframes wave-animation {
      0% { transform: rotate( 0.0deg) }
      10% { transform: rotate(14.0deg) }
      20% { transform: rotate(-8.0deg) }
      30% { transform: rotate(14.0deg) }
      40% { transform: rotate(-4.0deg) }
      50% { transform: rotate(10.0deg) }
      60% { transform: rotate(@2) } 
      100% { transform: rotate(0.0deg) }
    }

  Indica con qué sustituir ``@1`` y ``@2`` para conseguir el efecto deseado. No es relevante para este problema, pero poner ``display`` a ``inline-block`` permite que la animación tenga realmente lugar porque estas no son posibles en elementos ``inline``. Por otro lado, el valor de ``transform-origin`` se ha ajustado para que la mano rote desde la muñeca y no desde el punto central.

  .. solución: @1=infinite  @2=0.0deg




Programar el lado del cliente
-----------------------------

.. admonition:: :problema-contador-cliente:`Problema`
  :class: problema

  ¿Qué imprime el siguiente programa de JavaScript por la consola?

  .. code-block:: javascript
    :linenos:

    function outer(z) {
      var b = z;
      function inner() {
        var a = 20; 
        console.log(a+b);
      }
      b+= 10;
      return inner;
    }

    var X = outer(10);
    var Y = outer(20); 
    X();
    Y();
    X();

  .. solución: 40, 50, 40

.. ------

.. admonition:: :problema-contador-cliente:`Problema`
  :class: problema

  Indica *una expresión* con la que sustituir la marca ``@1`` en el siguiente código en JavaScript para que la siguiente función permita contar el número de veces que el carácter indicado como parámetro aparece dentro de la cadena sobre la que se invoca el método (por ejemplo, ``"foo".count('o')`` ha de devolver 2).

  .. code-block:: javascript
    :linenos:
    :force:

    String.prototype.count=function(c) { 
      var count=0, i=0;
      while (i<this.length) {
        count+= @1;
      }
      return count;
    };

  .. solución: this[i++]===c

.. ------

.. admonition:: :problema-contador-cliente:`Problema`
  :class: problema

  Indica *una única instrucción* en JavaScript que use la siguiente declaración para imprimir un 100 por la consola.
  
  .. code-block:: javascript
    :linenos:

    var logger= function () {
      return function () {
        return function () {
          console.log(100);
        }
      }
    }

  .. solución: logger()()();

.. ------

.. admonition:: :problema-contador-cliente:`Problema`
  :class: problema

  Indica con qué es necesario sustituir las marcas ``@1``, ``@2`` y ``@3`` para que la siguiente función de JavaScript devuelva un valor booleano que indique si el array pasado como parámetro está ordenado de forma ascendente. Usa la notación ``@1=...,@2=...,@3=...`` para tu respuesta.

  .. code-block:: javascript
    :linenos:
    :force:

    function isSorted(array) {
      const l = array.length - 1;
      for (@1 i = 0; i < l; i++) {
        const c = @2;
        const n = @3;
        if (c > n) { return false; }
      }
      return true;
    }

  .. solución: @1=var/let, @2=array[i], @3=array[i + 1]

.. ------

.. admonition:: :problema-contador-cliente:`Problema`
  :class: problema

  Indica con qué es necesario sustituir la marca ``@1`` para que el siguiente código en JavaScript muestre por la consola el valor 42. Atención: el carácter de punto y coma no puede aparecer en tu respuesta para evitar que añadas instrucciones adicionales.

  .. code-block:: javascript
    :linenos:
    :force:

    (function(y) {
      var answer = 40 + y;
      console.log(answer);
    })@1;

  .. solución: @1=(2)    

.. ------

.. admonition:: :problema-contador-cliente:`Problema`
  :class: problema

  ¿Qué salida muestra por consola el siguiente programa en JavaScript?
  
  .. code-block:: javascript
    :linenos:

    function done(){
      console.log("Done");
    }
      
    function increment(num, callBack){
      var f= callBack;
      for(var i = 0; i <= num; i++){
        console.log(i);
      }
      return callBack();
    }
      
    increment(4, done);

  .. solución: 0,1,2,3,4,Done

.. ------

.. admonition:: :problema-contador-cliente:`Problema`
  :class: problema

  Indica cuál es la salida por consola tras ejecutar el siguiente programa en JavaScript asumiendo que la función ``emit`` imprime por consola el valor pasado como parámetro tras realizar una serie de cálculos durante 1 segundo y que el tiempo de ejecución de cualquier otro elemento del código es despreciable.

  .. code-block:: javascript
    :linenos:

    function f(x) {
      emit("f"+(x||0));
    }

    function g() {
      emit("g1");
      f(3);
      setTimeout(f,5000);
      emit("g2");
    }

    f(1);
    setTimeout(f,6000);
    g();
    f(2);

  Para resolver este tipo de problemas te puede ayudar representar un cronograma similar al siguiente donde vayas registrando el código que se está ejecutando en cada momento, así como el código asíncrono que terminará encolando una función de *callback*:

  .. figure:: _static/img/cronograma.svg
    :target: _static/img/cronograma.svg
    :alt: cronograma
    :figwidth: 70 %

  .. solución: f1,g1,f3,g2,f2,f0,f0; https://jsfiddle.net/obqj50zx/
  .. function emit(s) { function pause(milliseconds) { let dt = new Date(); while ((new Date())-dt<=milliseconds) { /* Do nothing */} } pause(1000); let dt= new Date(); let seconds= dt.getSeconds(); console.log(seconds+"': "+s); }

.. ------

.. admonition:: :problema-contador-cliente:`Problema`
  :class: problema

  Considera el siguiente fragmento de un documento de HTML:

  .. code-block:: html
    :linenos:

    <body>
      <section>
        <header><h1>The Boy Who Lived</h1></header>
        <p class="first">Mr. and Mrs. Dursley, of number four, 
          Privet Drive, were proud to say that they were perfectly 
          normal, thank you very much.</p>
        <p class="last">They were the last people you'd expect to
          be involved in anything strange or mysterious, because they
          just didn't hold with such nonsense.</p>
      </section>
    </body>

  Considera que al documento anterior se le están aplicando los siguientes estilos:

  .. code-block:: css
    :linenos:

    p {
      color: silver;
    }
    #ch1 {
      color: tomato;
    }
    p.last {
      color: blueviolet;
    }
    header h1 {
      color: forestgreen;
    }
    p.first {
      color: lightskyblue;
    }

  Indica en qué colores se mostrarán, por este orden, el primer y segundo párrafo tras ejecutar el siguiente código de JavaScript:

  .. code-block:: javascript
    :linenos:

    document.querySelector('p.last').parentNode.children[0].id= 'ch1';
    let e= document.querySelectorAll('p')[1]; 
    e.classList.toggle('first');
    e.previousSibling.previousSibling.classList.toggle('first');

  .. solución: silver, lightskyblue; https://jsfiddle.net/ztk4bw67/

.. ------

.. admonition:: :problema-contador-cliente:`Problema`
  :class: problema

  Considera el siguiente fragmento en HTML de una página web:

  .. code-block:: html
    :linenos:

    <aside>
      <nav>
        <h1>Obras de Federico García Lorca</h1>
        <ol>
          <li>Poema del cante jondo</li>
          <li>Romancero gitano</li>
          <li>Poeta en Nueva York</li>
        <ol>
        <div>Sonetos del amor oscuro</div>
        <ul>
          <li>Bodas de sangre</li>
        </ul>
        <ul>
          <li>La casa de Bernarda Alba</li>
          <li>La zapatera prodigiosa</li>
        </ul>
      </nav>
    </aside>

  Indica cuál es la salida por consola ejecutar el siguiente código en JavaScript:

  .. code-block:: javascript
    :linenos:

    let l=document.querySelectorAll("aside > nav li");
    for (var i=0; i<l.length; i++) {
      if (l[i].parentNode.querySelectorAll("li").length===1) {
        console.log(l[i].textContent.length);
      }
    }

  .. solución: 15, https://jsfiddle.net/34n9aw6o/
  .. examen enero 2020

.. ------

.. admonition:: :problema-contador-cliente:`Problema`
  :class: problema

  ¿Qué imprime el siguiente programa de JavaScript por la consola?

  .. code-block:: javascript
    :linenos:

    function f(g,x) {
      return {a:g,b:g(x)}
    }
    var h= f(x=>3*x,4);
    console.log(h.b-h.a(2));

  .. solución: 6, https://jsfiddle.net/zdm4y21v/
  .. examen enero 2020

.. ------

.. admonition:: :problema-contador-cliente:`Problema`
  :class: problema

  Indica con qué sustituir las marcas ``@1`` y ``@2`` en el siguiente código en JavaScript para que la función *every* devuelva cierto si todos los elementos de un array cumplen una determinada condición pasada como parámetro y falso en otro caso.

  .. code-block:: javascript
    :linenos:
    :force:

    function every(array, predicate) {
      for (var i=0;i<array.@1;i++) {
        if (!@2) return false;
      }
      return true;
    }

  Lo siguiente son un par de ejemplos de llamadas a la función; la primera devuelve cierto y la segunda devuelve falso:

  .. code-block:: javascript
    :linenos:

    console.log(every([1, 3, 5], n => n < 10));
    console.log(every([2, 4, 16], n => n < 10));

  .. solución: @1=length,@2=predicate(array[i])
  .. examen enero 2020

.. ------

.. admonition:: :problema-contador-cliente:`Problema`
  :class: problema

  Indique con qué sustituir ``@1``, ``@2`` y ``@3`` en el siguiente código en JavaScript para que defina correctamente una clase ``Cilindro`` con un constructor y un método que calcula su volumen, además de crear un objeto de dicha clase e invocar sobre él la función ``volumen``.

  .. code-block:: javascript
    :linenos:
    :force:

    function Cilindro(a,d) {
      @1.altura = a;
      @1.diametro = d;
    }

    Cilindro.@2.volumen = function () {
      var r = this.diametro / 2;
      return this.altura * Math.PI * r * r;
    };

    var c = @3 Cilindro(7, 4);
    console.log(c.volumen().toFixed(4));  // imprime 87.9646

  .. solución: @1=this,@2=prototype,@3=new
  .. examen enero 2020

.. ------

.. admonition:: :problema-contador-cliente:`Problema`
  :class: problema

  Indica cuál es la salida por consola tras ejecutar el siguiente programa en JavaScript, asumiendo que la función ``emit`` imprime por consola el valor pasado como parámetro tras realizar una serie de cálculos durante 1 segundo y que el tiempo de ejecución de cualquier otro elemento del código es despreciable. La función ``setTimeout`` es estándar de JavaScript y registra una función que se ejecutará asíncronamente después del número de milisegundos indicados como segundo parámetro.

  .. code-block:: javascript
    :linenos:

    function f(x) {
      if (x) {
        emit("f"+x);
      }
      else {
        setTimeout( ()=>emit("#") ,1000)
      }
    }

    function g() {
      f();
      setTimeout(f,1000);
      emit("g1");
      setTimeout(f,1000);
      emit("g2");
      for(var i=0;i<3;i++) {
        emit("g3");
      }
      
    }

    f(7);
    g();

  .. solución: f7,g1,g2,g3,g3,g3,#,#,#,  https://jsfiddle.net/0rvdw2xh/ 
  .. function emit(s) { function pause(milliseconds) { let dt = new Date(); while ((new Date())-dt<=milliseconds) { /* Do nothing */} } 
  .. pause(1000); let dt= new Date(); let seconds= dt.getSeconds(); console.log(seconds+"': "+s); }
  .. examen enero 2020
 
.. ------

.. admonition:: :problema-contador-cliente:`Problema`
  :class: problema

  Considera el siguiente fragmento de un documento en HTML:

  .. code-block:: html
    :linenos:

    <ol id="c3">
      <li class="a b">Gather ingredients</li>
      <li class="b">Mix ingredients together</li>
      <li class="a">Place ingredients in a baking dish</li>
      <li>Bake in oven for an hour</li>
      <li class="c">Remove from oven</li>
      <li class="b" id="c1">Allow to stand for ten minutes</li>
      <li id="c2">Serve</li>
    </ol>

  Considera que al documento anterior se le están aplicando los siguientes estilos:

  .. code-block:: css
    :linenos:

    *     {color: aqua;}
    li    {color: silver;}
    li#c1 {color: darksalmon;}
    li    {color: forestgreen;}
    #c1   {color: lightskyblue;}
    .a .b {color: orangered;}
    ol li {color: firebrick;}
    ol > li#c2 {color: lemonchiffon;}
    li.a  {color: darkorchid;}
    li.b  {color: tomato;}
    li    {color: chocolate;}
    li#c3 {color: mintcream;}

  Indica en el mismo orden la secuencia de los siete nombres de colores en los que se mostrarán los siete elementos de la lista de HTML tras ejecutar el siguiente código de JavaScript:

  .. code-block:: javascript
    :linenos:

    let e=document.querySelectorAll('li');
    for(var i=0;i<e.length;i++) {
      if (e[i].textContent.length===5) {
        e[i].classList.add("a");
      }  
    }

  .. solución: tomato,tomato,darkorchid,firebrick,darksalmon,darksalmon, lemonchiffon, https://jsfiddle.net/h9s4mv7y/
  .. examen enero 2020

.. ------

.. admonition:: :problema-contador-cliente:`Problema`
  :class: problema

  Considera el siguiente fragmento del HTML de una página web:

  .. code-block:: html
    :linenos:
  
    <nav id="i100">
      <div class="a">
        <div>
          <span>Anduin</span>
          <span>Bruinen</span>
          <div>
            <span>Calenhir</span>
          </div>
          <span>Celduin</span>
        </div>
      </div>
      <div lang="sjn">
        <div>
          <span>Celebrant</span>
        </div>
      </div>
      <span>Bruinen</span>
      <div lang="art">
        <span>Anduin</span>
        <span>Ciril</span>
        <span>Entwash</span>
        <span>Erui</span>
        <span>Ethir<span>Bruinen</span></span>
      </div>
    </nav>

  Indica con qué sustituir la marca ``@1`` en el siguiente código en JavaScript para que el *primer* elemento de tipo ``span`` que tiene como contenido la cadena *Bruinen* (hay tres en total) pase a tener un atributo ``spellcheck`` con valor ``false``. Asume que cualquier valor asignado a un atributo ``class`` puede estar asignado a otro atributo ``class`` en otras partes no mostradas del documento HTML y que cualquiera de los elementos HTML pueden estar siendo usados en otras partes del documento. Si hay más de una posibilidad para sustituir una determinada marca, pon la que menos caracteres ocupe.

  .. code-block:: javascript
    :linenos:
    :force:

    var element= document.querySelector(@1);
    element.setAttribute("spellcheck",false);

  .. solución: @1="#i100 .a span:nth-child(2)" 
  .. examen julio 2020


.. admonition:: :problema-contador-cliente:`Problema`
  :class: problema

  Considera de nuevo todos los fragmentos de código del problema anterior. Indica con qué sustituir la marca ``@1`` del código de JavaScript para que el *segundo* elemento de tipo ``span`` que tiene como contenido la cadena *Bruinen* (hay tres en total) pase a tener un atributo ``spellcheck`` con valor ``false``. Asume que cualquier valor asignado a un atributo ``class`` puede estar asignado a otro atributo ``class`` en otras partes no mostradas del documento HTML y que cualquiera de los elementos HTML pueden estar siendo usados en otras partes del documento. Si hay más de una posibilidad para sustituir una determinada marca, pon la que menos caracteres ocupe.

  .. solución: @1="#i100 > span"
  .. examen julio 2020


.. admonition:: :problema-contador-cliente:`Problema`
  :class: problema

  Considera de nuevo todos los fragmentos de código del problema anterior. Indica con qué sustituir la marca ``@1`` del código de JavaScript para que el *tercer* elemento de tipo ``span`` que tiene como contenido la cadena *Bruinen* (hay tres en total) pasen a tener un atributo ``spellcheck`` con valor ``false``. Asume que cualquier valor asignado a un atributo ``class`` puede estar asignado a otro atributo ``class`` en otras partes no mostradas del documento HTML y que cualquiera de los elementos HTML pueden estar siendo usados en otras partes del documento. Si hay más de una posibilidad para sustituir una determinada marca, pon la que menos caracteres ocupe.

  .. solución: @1="#i100 span > span"
  .. solución: @1="#i100 div[lang='art'] span span"
  .. examen julio 2020


.. admonition:: :problema-contador-cliente:`Problema`
  :class: problema

  Indica con qué sustituir las marcas ``@1``, ``@2``, ``@3``, ``@4`` en el siguiente programa de JavaScript para que la salida sea 7.

  .. code-block:: javascript
    :linenos:
    :force:

    let c= {gamma:2};
    let h1= x =@1 x*x;
    let h2= (x,y) =@2 h1(x)*c.@3-h1(y);
    console.log(h2(4,@4));

  .. solución: @1=>,@2=>,@3=gamma,@4=5 


.. admonition:: :problema-contador-cliente:`Problema`
  :class: problema

  En el siguiente programa en JavaScript la función ``emit`` imprime por consola el valor pasado como parámetro tras realizar una serie de cálculos durante 1 segundo. El tiempo de ejecución de cualquier otro elemento del código es despreciable. La función ``setTimeout`` es estándar de JavaScript y registra una función que se ejecutará asíncronamente después del número de milisegundos indicados como segundo parámetro. Indica con qué sustituir la marca ``@1`` para que se impriman por consola en este orden los valores 1, 2, 3, 4, 5, 6, 7, 8.

  .. code-block:: javascript
    :linenos:
    :force:

    let lista=@1

    for(let i=0;i<lista.length;i++) {
      if (i==2 || i==3) {
        setTimeout(function() {emit(lista[i])}, 2000);
      }
      else if (i==4 || i==5) {
        setTimeout(function() {emit(lista[i])}, 1000);
      }
      else {
        emit(lista[i]);
      }
    }

  Observa que la variable ``lista`` es un *array* de números que serán impresos dentro del bucle, por lo que una posible respuesta (incorrecta) sería ``@1=[8,7,6,5,4,3,2,1]``.

  .. function emit(s) { function pause(milliseconds) { let dt = new Date(); while ((new Date())-dt<=milliseconds) { /* Do nothing */} } pause(1000); let dt= new Date(); let seconds= dt.getSeconds(); console.log(seconds+"': "+s); }
  .. solución: [1,2,7,8,5,6,3,4]
  .. examen julio 2020

.. ------

.. admonition:: :problema-contador-cliente:`Problema`
  :class: problema

  Indica con qué sustituir ``@1``, ``@2``, ``@3`` y ``@4`` en el siguiente código en JavaScript para que se creen en memoria los objetos indicados en el diagrama y se muestre por la consola la cadena ``Esta persona se llama Jane``.

  .. code-block:: javascript
    :linenos:
    :force:

    class Person {
      @1() {
        return 'Esta persona se llama '+this.name;
      }
      @2(name) {
        @3 = name;
      }
    }
    const jane = @4 Person('Jane');
    console.log(jane.describe());
    
  .. figure:: https://exploringjs.com/impatient-js/img-book/9e58a0eff1bb377a79c6c288675ac37ece33af23.svg
    :target: https://exploringjs.com/impatient-js/ch_proto-chains-classes.html#classes-under-the-hood
    :alt: objetos de JavaScript en memoria
  
    Objetos de JavaScript en memoria por Axel Rauschmayer

  .. solución: @1=describe,@2=constructor,@3=this.name,@4=new
  
.. ------

.. admonition:: :problema-contador-cliente:`Problema`
  :class: problema

  Indica cuál es la salida del siguiente código en JavaScript:

  .. code-block:: javascript
    :linenos:
    :force:

    function creaBichoBola(proto,exoesqueleto) {
      let bicho= Object.create(proto);
      bicho.exoesqueleto= exoesqueleto;
      return bicho;
    };
    protoBichoBola = {
      enrolla: function() {console.log("grrrr")},
      desplaza: function() {console.log("shhhh")}
    };
    function Bolinche() {
      this.x= -1;
    }
    Bolinche.prototype= protoBichoBola;
    var bicho = new Bolinche();
    var bicho2= creaBichoBola(protoBichoBola);
    console.log(bicho.prototype === bicho2.prototype);
    console.log(Object.getPrototypeOf(bicho) === Object.getPrototypeOf(bicho2));
    console.log(Object.getPrototypeOf(protoBichoBola) === Object.prototype);
    console.log(protoBichoBola.enrolla.prototype === protoBichoBola.desplaza.prototype);

  .. solución: true[null===null],true,true, false
  
.. ------

.. admonition:: :problema-contador-cliente:`Problema`
  :class: problema

  Indica con qué hay que sustituir ``@1`` y ``@2`` en el siguiente código para que la salida emitida sea ``30 42``.
  
  .. code-block:: javascript
    :linenos:
    :force:

    function f1(n) {
      var a= @1;
      function f2(i) {
        let k= n*a*i;
        console.log(k);
      }
      f2(@2);
      a= 7;
      return f2;
    }

    var f = f1(3);
    f(@2);

  .. solución: @1=5,@2=2
  
.. -------

.. admonition:: :problema-contador-cliente:`Problema`
  :class: problema

  Considera un documento HTML cuyo cuerpo (contenido del elemento *body*) es el siguiente:

  .. code-block:: html
    :linenos:
    :force:

    <div class="cuadrados">
      <div class="orange">naranja</div>
      <div class="blue">azul</div>
      <div class="lavender">lavanda</div>
    </div>

  y al cual se les están aplicando los siguientes estilos:

  .. code-block:: css
    :linenos:
    :force:

    * {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
    }
    .cuadrados {
        width: 400px;
        height: 400px;
        background: gainsboro;
        padding-left: 50px;
        padding-top: 50px;
        position: relative;
    }
    .orange {
        background: orange;
        height: 100px;
        width: 100px;
        position: relative;
        z-index: @1;
    }
    .blue {
        background: lightskyblue;
        height: 100px;
        width: 100px;
        position: absolute;
        left: 210px;
        top: 50px;
    }
    .lavender {
        background: lavender;
        height: 100px;
        width: 100px;
        position: relative;
    }

  El siguiente código en JavaScript tiene como objetivo mover horizontalmente el cuadrado naranja a una velocidad de 1 píxel cada 10 milisegundos desde su posición inicial hasta situarlo *encima* del cuadrado azul. La función *setTimeout* es estándar de JavaScript y registra una función que se ejecutará asíncronamente después del número de milisegundos indicados como segundo parámetro.

  .. code-block:: javascript
    :linenos:
    :force:

    let a= document.querySelector(".orange");
    let i= 0;

    function mueve() {
        i++;
        a.style.left= i+@2;
        if (i<@3) {
        setTimeout(mueve,10);
        }  
    }

    setTimeout(mueve,10);

  Indica con qué sustituir ``@1`` en la hoja de estilo y ``@2`` y ``@3`` en el código de JavaScript anterior para que se consiga el efecto deseado.

  .. solución: @1=2/3/4,@2="px",@3=160
  .. examen enero 2021

.. --------

.. admonition:: :problema-contador-cliente:`Problema`
  :class: problema

  En el siguiente programa en JavaScript la función *emit* imprime por consola el valor pasado como parámetro tras realizar una serie de cálculos durante 1 segundo. El tiempo de ejecución de cualquier otro elemento del código es despreciable. La función *setTimeout* es estándar de JavaScript y registra una función que se ejecutará asíncronamente después del número de milisegundos indicados como segundo parámetro. Indica con qué sustituir la marca ``@1`` para que se impriman por consola en este orden los valores 0, 1, 2, 3, 3, 2, 2, 1, 1, 0.

  .. code-block:: javascript
    :linenos:
    :force:

    let lista=@1;

    function foo(j) {
        emit(j);
        emit(j);
    }

    for(let i=0;i<lista.length;i++) {
        console.log(i);
        if (i > 1) {
        setTimeout(() => foo(lista[i]),2000);
        }
        else {
        setTimeout(() => emit(lista[i]), 3000-1000*i);
        }
    }

  Observa que la variable ``lista`` es un *array* de números que serán impresos dentro del bucle, por lo que una posible respuesta (incorrecta) sería ``@1=[1,5,1,5,1,5]``.

  .. function emit(s) { function pause(milliseconds) { let dt = new Date(); while ((new Date())-dt<=milliseconds) { /* Do nothing */} } pause(1000); let dt= new Date(); let seconds= dt.getSeconds(); console.log(seconds+"': "+s); }
  .. solución: [0,3,2,1]
  .. examen enero 2021

.. --------

.. admonition:: :problema-contador-cliente:`Problema`
  :class: problema

  Una vez completo, el siguiente programa en JavaScript crea dos objetos, ``t1`` y ``t2``, con atributos que representan las longitudes de los tres lados de un triángulo y les asocia un prototipo que incluye una función que permite obtener el perímetro (es decir, la suma de las longitudes de sus lados: 9 para el primer triángulo y 6 para el segundo).

  .. code-block:: javascript
    :linenos:
    :force:

    var t1={}; 
    t1.a=t1.b=t1.c=3;
    var x={getPerimeter: function () {return @1;}};
    Object.@2(t1,x);
    console.log(t1.getPerimeter());
    var t2=Object.@3;
    t2.a=t2.b=t2.c=2;
    console.log(t2.getPerimeter());

  Indica con qué sustituir ``@1``, ``@2`` y ``@3`` en el programa anterior para que el código funcione de la forma indicada e imprima los valores 9 y 6.

  .. solución: @1=this.a+this.b+this.c,@2=setPrototypeOf,@3=create(x)
  .. examen enero 2021

.. -------

.. admonition:: :problema-contador-cliente:`Problema`
  :class: problema

  Considera el siguiente fragmento HTML de una página web que representa un tablero del juego del tres en raya con piezas de ambos jugadores (representadas mediante el prefijo *X* u *O*, según el jugador):

  .. code-block:: html
    :linenos:
    :force:

    <table id="tictactoe">
        <tr>
        <td class="X">X1</td><td class="X">X2</td><td class="X">X3</td>
        </tr>
        <tr>
        <td></td><td class="O">O2</td><td></td>
        </tr>
        <tr>
        <td class="O">O1</td><td></td><td></td>
        </tr>
    </table>

  Considera los siguientes estilos CSS asociados a la página anterior:

  .. code-block:: css
    :linenos:
    :force:

    * {
        padding: 0;
        margin: 0;
    }

    table {
        border-spacing: 2px;
    }

    td {
        width: 30px;
        height: 30px;
        border: 1px solid black;
        padding: 5px;
        text-align: center;
    }

    .O {
        color: seagreen;
    }

    .X {
        color: darkslateblue;
    }

    .pieza {
        background-color: lightgray;
    }

    .izquierda {
        border-left: 3px solid gray;
    }

    .derecha {
        border-right: 3px solid darkgray;
    }

    .arriba {
        border-top: 3px solid silver;
    }

    .abajo {
        border-bottom: 3px solid dimgray;
    }

  Indica con qué sustituir ``@1``, ``@2``, ``@3`` y ``@4`` en el siguiente código de JavaScript para que todas las celdas de la tabla en las que hay una pieza de tipo *X* se muestren con fondo de color *lightgray*:

  .. code-block:: javascript
    :linenos:
    :force:

    var a= document.querySelector("#tictactoe");
    var b= a.querySelectorAll("td");
    for (var e of b) {
        if (e.@1!=="" && e.@2==="X") {
        e.@3.add(@4);
        }
    }

  .. solución: @1=textContent/innerHTML,@2=textContent[0]/innerHTML[0],@3=classList,@4="pieza"  https://jsfiddle.net/y5xqjsf2/3/
  .. examen enero 2021

.. -------

.. admonition:: :problema-contador-cliente:`Problema`
  :class: problema

  Dado el código HTML y CSS del ejercicio del tres en raya anterior, indica con qué sustituir ``@1`` y ``@2`` en el siguiente código en JavaScript para que se muestra una especie de borde alrededor del tablero. Este efecto se obtiene marcando el borde externo de las celdas con distinto color según la posición de cada una (*silver* para las celdas de la primera fila, *dimgray* para las de la última fila, *gray* para las de la primera columna y *darkgray* para las de la última columna). 

  .. code-block:: javascript
    :linenos:
    :force:

    var a= document.querySelector("#tictactoe");
    var b= a.querySelectorAll("td:nth-child(1)");
    for (var e of b) {
        e.classList.add("izquierda");
    }
    b= a.querySelectorAll("td:last-child");
    for (var e of b) {
        e.classList.add("derecha");
    }
    b= a.querySelectorAll(@1);
    for (var e of b) {
        e.classList.add("arriba");
    }
    b= a.querySelectorAll(@2);
    for (var e of b) {
        e.classList.add("abajo");
    }

  .. solución: @1="tr:nth-child(1) > td"/"tr:first-child > td",@2="tr:last-child > td"/"tr:nth-child(3) > td"  https://jsfiddle.net/y5xqjsf2/3/ 
  .. examen enero 2021

.. -------

.. admonition:: :problema-contador-cliente:`Problema`
  :class: problema

  Indica con qué sustituir ``@1`` y ``@2`` en el siguiente bloque de código para que por la salida se muestren los números 2, 2, 0 y 1 (en este orden):

  .. code-block:: javascript
    :linenos:
    :force:

    @1 i=0;
    var j=0;
    while (i<2) {
        i++;
        @2 k= j++;
        setTimeout(() => {console.log(i)}, 100);
        setTimeout(() => {console.log(k)}, 500);
    }

  .. solución: @1=var,@2=let
  .. examen enero 2021
  
.. -------

.. admonition:: :problema-contador-cliente:`Problema`
  :class: problema

  Indica con qué sustituir ``@1`` y ``@2`` en el siguiente bloque de código JavaScript para que ``compact`` sea una función que devuelva una copia del array recibido como parámetro en la que se han eliminado todos los valores que en JavaScript se consideran falsos cuando son interpretados como un booleano.

  .. code-block:: javascript
    :linenos:
    :force:

    function compact(arr1) {
        arr2= @1;
        for (var i=0;i<arr1.length;i++) {
        if (@2) {
            arr2.push(arr1[i]);
        }
        }
        return arr2;
    }

    a= [0,false,undefined,5,"",6,null];
    console.log(compact(a));  // imprime [5,6]

  .. solución: @1=[]/new Array(),@2=arr1[i]
  .. examen enero 2021

.. --------

.. admonition:: :problema-contador-cliente:`Problema`
  :class: problema

  Considera un documento HTML cuyo cuerpo (contenido del elemento *body*) es el siguiente:

  .. code-block:: html
    :linenos:
    :force:

    <div class="cuadrados"></div>

  y al cual se les están aplicando los siguientes estilos:

  .. code-block:: css
    :linenos:
    :force:

    * {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
    }
    .cuadrados {
        width: 400px;
        height: 400px;
        background: gainsboro;
        padding-left: 50px;
        padding-top: 50px;
        position: relative;
    }
    .bloque {
        height: 100px;
        width: 100px;
        position: absolute;
    } 

  Considera ahora el siguiente código incompleto en JavaScript:

  .. code-block:: javascript
    :linenos:
    :force:

    let colores=[@1,"lavender"]
    let arena= document.querySelector(".cuadrados");

    for (let i=1;i<=11;i++) {
        var n= document.createElement("div");
        n.classList.add("bloque");
        var color= colores[i%colores.length];
        n.style.background= color;
        n.style.left= 0+25*i+"px";
        n.style.top= @2;
        n.textContent= @3;
        arena.appendChild(n);
    }

  Indica con qué sustituir ``@1``, ``@2`` y ``@3`` en el código de JavaScript anterior para que se muestre en el navegador un documento como el de la imagen siguiente:

  .. figure:: _static/img/problema-lavanda1.png
    :target: _static/img/problema-lavanda1.png
    :alt: cuadrados
    :figwidth: 70 %

  .. solución: @1="orange","lightskyblue", @2=0+25*i+"px", @3=color  https://jsfiddle.net/aejk035L/1/ 
  .. examen julio 2021

.. --------

.. admonition:: :problema-contador-cliente:`Problema`
  :class: problema

  Dado el mismo código en HTML, CSS y JavaScript del problema anterior, se pretende conseguir que el navegador muestre ahora un documento como el siguiente:

  .. figure:: _static/img/problema-lavanda2.png
    :target: _static/img/problema-lavanda2.png
    :alt: cuadrados
    :figwidth: 70 %

  Para ello, se hace sobre el código en JavaScript completo (es decir, el código correcto sin los huecos de las arrobas del problema anterior) un único cambio: añadir a continuación de la línea que asigna valor a la variable ``color`` la línea:

  .. code-block:: javascript
    :linenos:
    :force:

    n.style.zIndex= @1 i;

  Indica con qué parte de una subexpresión hay que sustituir @1 en la línea anterior para conseguir que el navegador muestre el documento como en la captura de este problema. 

  *Notas:* observa que el número de cuadrados mostrados es menor que en el problema anterior, pero las condiciones del bucle no han cambiado. Recuerda que en JavaScript para cambiar una propiedad de CSS como ``margin-bottom`` es necesario modificar ``elemento.style.marginBottom`` y no ``elemento.style.margin-bottom``, ya que esto se interpretaría como la resta del valor de dos variables. Ten en cuenta que no es necesario haber resuelto correctamente el problema anterior para poder responder a este correctamente.

  .. solución: @1=8-  https://jsfiddle.net/j8egdxcu/1/ 
  .. examen julio 2021
  
.. --------

.. admonition:: :problema-contador-cliente:`Problema`
  :class: problema

  Cuando en JavaScript se utiliza el operador de comparación no estricta ``==``, el intérprete realiza una serie de conversiones de tipo entre los operandos afectados. Para simplificar, asumamos, por ejemplo, que si se está comparando un objeto con un dato de un tipo simple como una cadena o un entero, se llama a la función ``toString`` del objeto antes de realizar la comparación. Esto permite escribir una instrucción condicional como la del siguiente código que se evalúe a cierto, aunque en un principio la condición nos pueda parecer falsa.

  .. code-block:: javascript
    :linenos:
    :force:

    let a = {
        i: 1,
        toString: function () {
        return "" + @1;
        }
    }

    if(a == "1" && a == "2" && a == 3) {
        console.log('Hello world!');
    }

  Indica con qué sustituir @1 en el código anterior para que se imprima *Hello world!* por la consola. *Nota:* el operador ``&&`` se evalúa de izquierda a derecha.

  .. solución: a.i++ 
  .. true no funciona
  .. examen julio 2021

.. --------

.. admonition:: :problema-contador-cliente:`Problema`
  :class: problema

  Considera esta lista de reglas de CSS:

  1. ``aside + p {color:red}``
  2. ``#a #b {color:red}``
  3. ``section > p {color:red}``

  Considera también estos fragmentos de código en HTML:

  1. ``<section id="a"><aside><p>rainbow</p></aside><p>cat</p></section>``
  2. ``<section id="a"><aside class="b"><p>rainbow</p></aside><span>super</span><p>cat</p></section>``
  3. ``<section id="a"><aside><p>rainbow</p></aside><p>super</p><p id="b">cat</p></section>``

  Asocia cada regla con un código HTML diferente de manera que solo la palabra *cat* aparezca en rojo y las demás no. Usa una notación como *1-1* para indicar que la regla *1* se asocia con el código de la línea marcada con *1* (*nota:* este ejemplo de asociación no es necesariamente parte de la respuesta correcta).

  .. solución: 1-1, 2-3, 3-2
  .. examen julio 2021

.. -------

.. admonition:: :problema-contador-cliente:`Problema`
  :class: problema

  Indica cuál es la salida por consola del siguiente bloque de JavaScript. Asume que todas las instrucciones tienen un tiempo de ejecución despreciable pero no nulo.

  .. code-block:: javascript
    :linenos:
    :force:

    var i=1;
    var j=0;
    while (j<2) {
        i++;
        let x= i;
        let y= j;
        var z= j++;
        setTimeout(() => {console.log(x)}, 10);
        setTimeout(() => {console.log(y)}, 100);
        setTimeout(() => {console.log(z)}, 1000);
    }

  .. solución:  2,3,0,1,1,1
  .. examen julio 2021

.. ---------

.. admonition:: :problema-contador-cliente:`Problema`
  :class: problema

  Sabiendo que en el caso de que se indique cero como segundo argumento de la función ``setTimeout`` de JavaScript, la llamada a la función del primer argumento se encola inmediatamente, indica cuál es la salida por consola del siguiente bloque de JavaScript.

  .. code-block:: javascript
    :linenos:
    :force:

    (function() {
        console.log('r');
        setTimeout( () => {console.log('a')}, 0);
        (function() {
        console.log('o');
        setTimeout( () => {console.log('p')}, 0);
        console.log('c');
        setTimeout( () => {console.log('t')}, 0);
        console.log('i');
        })();
        console.log('n');
        setTimeout( () => {console.log('o')}, 0);
    })();

  .. solución: rocinapto
  .. examen enero 2022

.. ---------

.. admonition:: :problema-contador-cliente:`Problema`
  :class: problema

  El método ``Array.prototype.map()`` crea un nuevo array con los resultados de la llamada a la función indicada aplicados a cada uno de los elementos del array original. Así, el siguiente código imprime por consola ``[ 1, 4, 9, 16, 25 ]``:

  .. code-block:: javascript
    :linenos:
    :force:

    arr= [1,2,3,4,5]
    const newArr = arr.map((val) => val * val);
    console.log(newArr);

  Considera ahora el siguiente código en JavaScript:

  .. code-block:: javascript
    :linenos:
    :force:

    const animals = [
        { name: 'shark', likes: 'ocean' },
        { name: 'turtle', likes: 'pond' },
        { name: 'otter', likes: 'fish biscuits' },
        { name: 'ico', likes: ''}
    ]

    const likes = animals.map(item => {
        const container = @1;
        container@2 = item.likes;
        container.sup = item.name.@3 * 10;
        return container;
    })

    console.log(likes);

  Indica con qué sustituir ``@1``, ``@2`` y ``@3`` en el código anterior para que la salida por consola sea:

  .. code-block:: javascript
    :linenos:
    :force:

    [{"shark":"ocean","sup":50},{"turtle":"pond","sup":60},{"otter":"fish biscuits","sup":50},{"ico":"","sup":30}]

  .. solución: @1={} @2=[item.name] @3=length
  .. examen enero 2022

.. --------

.. admonition:: :problema-contador-cliente:`Problema`
  :class: problema

  Considera el siguiente código en HTML:

  .. code-block:: html
    :linenos:
    :force:

    <ul class="set">
        <li class="white do"></li> <li class="black dos"></li>
        <li class="white re"></li> <li class="black res"></li>
        <li class="white mi"></li>
        <li class="white fa"></li> <li class="black fas"></li>
        <li class="white sol"></li> <li class="black sols"></li>
        <li class="white la"></li> <li class="black las"></li>
        <li class="white si"></li>
    </ul>

  Y el siguiente código en CSS (basado en el creado por Philip Zastrow en *codepen.io*) al que le faltan algunos fragmentos:

  .. code-block:: css
    :linenos:
    :force:

    * {
        box-sizing:border-box
    }

    body {
        margin:0;
        background:#222
    }

    ul {
        height:20em;
        width:34em;
        margin:5em auto;
        padding:3em 0 0 3em;
        position:relative;
        background-color: gray;
    }

    li {
        margin:0;
        padding:0;
        list-style:none;
        position:relative;
        float: left;
    }

    ul .white {
        height:16em;
        width: @1;
        z-index:1;
        border-left:1px solid #bbb;
        border-bottom:1px solid #bbb;
        border-radius:0 0 5px 5px;
        background-color: white;
    }

    .black {
        height:8em;
        width:2em;
        margin:0 0 0 -1em;
        z-index: @2;
        border:1px solid #000;
        border-radius:0 0 3px 3px;
        background-color: black;
    }

    .re,.mi,.sol,.la,.si {
        margin:0 0 0 @3
    }

    ul li:first-child {
        border-radius:5px 0 5px 5px
    }

    ul li:last-child {
        border-radius:0 5px 5px 5px
    }

  El código anterior muestra en la ventana del navegador el siguiente piano:

  .. figure:: _static/img/problema-pianoh.png
    :target: _static/img/problema-pianoh.png
    :alt: piano horizontal
    :figwidth: 40 %

  La propiedad ``float:left`` de CSS que se usa en el ejemplo anterior hace que la caja de cada elemento ``li`` no se posicione debajo de la anterior (como correspondería por defecto), sino que se desplace a la izquierda hasta tocar el borde de la caja contenedora o el borde de otro elemento flotante. Esto es lo que permite que cada tecla aparezca a la derecha de la anterior y no debajo, aunque, como puedes ver en el código, hace falta un pequeño reajuste para colocarlas correctamente, ya que las teclas negras de los semitonos se sitúan a medio camino entre las blancas. Aunque no es muy relevante para este problema, la propiedad ``border-radius`` define la curvatura de las esquinas comenzando por la superior izquierda. Finalmente, puedes ignorar el uso del posicionamiento relativo en este código.

  Indica con qué sustituir ``@1``, ``@2`` y ``@3`` en el código en CSS anterior para que el piano se muestre como en la imagen.

  .. solución: @1=4em, @2=2, @3=-1em, https://jsfiddle.net/nx9yoLdp/1/  original: https://codepen.io/zastrow/pen/oDBki 
  .. examen enero 2022

.. --------

.. admonition:: :problema-contador-cliente:`Problema`
  :class: problema

  Indica qué nueva regla añadir a la hoja de estilo del problema anterior para que la tecla del re se muestre en color rojo como en la siguiente imagen.

  .. figure:: _static/img/problema-pianoh-rojo.png
    :target: _static/img/problema-pianoh-rojo.png
    :alt: piano horizontal con tecla roja
    :figwidth: 40 %

  .. solución: li.re {background-color:red;} /* ojo con la especificidad */
  .. examen enero 2022

.. --------

.. admonition:: :problema-contador-cliente:`Problema`
  :class: problema

  Indica cuál es la salida por consola tras ejecutar el siguiente programa en JavaScript:

  .. code-block:: javascript
    :linenos:
    :force:

    function A (x) {
        this.x= x;
    }
    let c= console.log;
    let a1= new A(9);
    A.prototype.f= function () {
        c(this.x);
    };
    a1.f();
    a1.f= () => c(0);
    let a2= new A(8);
    a1.f();
    a2.f();
    Object.getPrototypeOf(a1).f= () => c(1);
    a1.f();
    a2.f();

  .. solución: 9, 0, 8, 0, 1, https://jsfiddle.net/yx5n3r0b/2/
  .. examen enero 2022

.. -------

.. admonition:: :problema-contador-cliente:`Problema`
  :class: problema

  El método ``Array.prototype.reduce()`` ejecuta una función reductora sobre cada elemento del array y devuelve finalmente un único valor. La función ``reduce`` tiene el siguiente prototipo:

  .. code-block:: javascript
    :linenos:
    :force:

    arr.reduce(callback(acumulador, valorActual), valorInicial)

  La función ``callback(acumulador,valorActual)`` tiene dos parámetros cuyo papel es el siguiente:

  - ``acumulador``: es el valor acumulado devuelto en la anterior invocación de ``callback``; en la primera llamada se inicializa al valor del parámetro ``valorInicial``.
  - ``valorActual``: el elemento del array que está siendo procesado actualmente.

  Así, el siguiente código imprime por consola el valor ``6``:

  .. code-block:: javascript
    :linenos:
    :force:

    console.log([0, 1, 2, 3].reduce(function(a, b) {return a + b;}));

  Por otra parte, el método ``Array.prototype.concat()`` devuelve un nuevo array que es el resultado de concatenar los elementos de dos arrays: el array del objeto receptor del mensaje y el recibido como parámetro.

  Considera ahora el siguiente código en JavaScript que permite integrar un array de arrays:

  .. code-block:: javascript
    :linenos:
    :force:

    var arr = [[0,1], [2,3], [4,5]]; 
    var integrado = arr.@1( (a,b) => @2.@3(@4), [] ); 
    console.log(integrado);

  Indica con qué sustituir ``@1``, ``@2``, ``@3`` y ``@4`` en el código anterior para que la salida por consola sea:

  .. code-block:: console
    :linenos:
    :force:

    [4, 5, 2, 3, 0, 1]

  .. solución: @1=reduce, @2=b, @3=concat, @4=a 
  .. examen julio 2022

.. --------

.. admonition:: :problema-contador-cliente:`Problema`
  :class: problema

  Considera el siguiente código en HTML:

  .. code-block:: html
    :linenos:
    :force:

    <ul class="set">
        <li class="white do"></li> <li class="black dos"></li>
        <li class="white re"></li> <li class="black res"></li>
        <li class="white mi"></li>
        <li class="white fa"></li> <li class="black fas"></li>
        <li class="white sol"></li> <li class="black sols"></li>
        <li class="white la"></li> <li class="black las"></li>
        <li class="white si"></li>
    </ul>

  Y el siguiente código en CSS al que le faltan algunos fragmentos:

  .. code-block:: css
    :linenos:
    :force:

    * {
        box-sizing: border-box;
    }

    body {
        margin: 0;
        background: #222;
    }

    ul {
        height: 34em;
        width: 22em;
        margin: 5em auto;
        padding: 3em 0 0 3em;
        background-color: gray;
    }

    li {
        margin: 0;
        padding: 0;
        list-style: none;
        position: relative;
    }

    ul .white {
        height: 4em;
        width: 16em;
        z-index: 1;
        border-left: 1px solid #bbb;
        border-bottom: 1px solid #bbb;
        background-color: white;
    }

    .black {
        height: 2em;
        width: @1;
        margin: -1em 0 0 @2;
        z-index: 2;
        border: 1px solid #000;
        background-color: black;
    }

    .re,.mi,.sol,.la,.si {
        margin: @3 0 0 0;
    }

  El código anterior muestra en la ventana del navegador el siguiente piano donde la tecla del do es la de más arriba:

  .. figure:: _static/img/problema-pianov.png
    :target: _static/img/problema-pianov.png
    :alt: piano vertical
    :figwidth: 20 %

  Como puedes ver en el código, hace falta un pequeño reajuste jugando con los márgenes para colocar correctamente las teclas; por ejemplo, en el caso de las teclas negras de los semitonos, estas se sitúan a medio camino entre las blancas. Por otro lado, puedes ignorar el uso del posicionamiento relativo en este código.

  Indica con qué sustituir ``@1``, ``@2`` y ``@3`` en el código en CSS anterior para que el piano se muestre como en la imagen.

  .. solución: @1=8em, @2=8em, @3=-1em, https://jsfiddle.net/nx9yoLdp/1/  original: https://codepen.io/zastrow/pen/oDBki
  .. examen julio 2022

.. --------

.. admonition:: :problema-contador-cliente:`Problema`
  :class: problema

  Dado el mismo código HTML del problema anterior, las siguientes reglas de estilo permiten obtener la misma imagen, pero en esta ocasión usando las propiedades de posicionamiento de CSS:

  .. code-block:: css
    :linenos:
    :force:

    * {
        box-sizing:border-box;
    }

    body {
        margin: 0;
        background: #222;
    }

    ul {
        height: 34em;
        width: 22em;
        margin: 5em auto;
        padding: 3em 0 0 3em;
        position: relative;
        background-color: gray;
    }

    li {
        margin: 0;
        padding :0;
        list-style: none;
    }

    ul .white {
        height: 4em;
        width: 16em;
        z-index: 1;
        border: 1px solid #bbb;
        background-color: white;
    }

    .black {
        height: 2em;
        width: 8em;
        margin-left: @1;
        z-index: 2;
        border: 1px solid #000;
        background-color: black;
    }

    .do {
        position: absolute;
        top: 3em;
    }

    .re {
        position: absolute;
        top: 7em;
    }
    
    .mi {
        position: absolute;
        top: 11em;
    }
    
    .fa {
        position: absolute;
        top: 15em;
    }
    
    .sol {
        position: absolute;
        top: 19em;
    }

    .la {
        position: absolute;
        top: 23em;
    }
    
    .si {
        position: absolute;
        top: 27em;
    }
    
    .dos {
        position: absolute;
        top: 6em;
    }

    .res {
        position: absolute;
        top: @2;
    }
    
    .fas {
        position: absolute;
        top: @3;
    }
    
    .sols {
        position: absolute;
        top: @4;
    }
    
    .las {
        position: absolute;
        top: 26em;
    }

  Indica con qué sustituir ``@1``, ``@2``, ``@3`` y ``@4`` en el código anterior para obtener la misma imagen que en el problema anterior.

  .. solución: @1=8em, @2=10em, @3=18em, @4=22em
  .. examen julio 2022
  
.. --------

.. admonition:: :problema-contador-cliente:`Problema`
  :class: problema

  Dibuja aproximadamente cómo se mostraría en un navegador el siguiente fragmento HTML si se usaran (una vez completas) las reglas de estilo del problema anterior:

  .. code-block:: html
    :linenos:
    :force:

    <ul class="set">
        <li class="white do"></li> 
        <li class="white re"></li> 
        <li class="white mi"></li> 
        <li class="white fa"></li> 
        <li class="white sol"></li> 
        <li class="white la"></li> 
        <li class="white si"></li>
        <li class="black res"></li> 
        <li class="black dos"></li>
        <li class="black fas"></li>
        <li class="black sols"></li>
        <li class="black las"></li>
    </ul>

  .. solución: igual
  .. examen julio 2022

.. -------

.. admonition:: :problema-contador-cliente:`Problema`
  :class: problema

  En CSS, las propiedades personalizadas (también conocidas como variables) son propiedades especiales que contienen valores específicos que se pueden volver a utilizar en un documento por medio de la función ``var()`` e incluso operar mediante la función ``calc()``. Uno de sus usos más habituales es el de evitar tener que indicar el mismo valor literal en múltiples partes de un documento CSS. Como muchas otras propiedades de CSS, las variables en un nodo heredan el valor del nodo padre. Como ejemplo de todo esto, el siguiente bloque de HTML muestra una serie de botones de colores diferentes similares a los que se pueden obtener con Bootstrap:

  .. code-block:: html
    :linenos:
    :force:

    <section>
        <button class="btn primary">Primary</button>
        <button class="btn secondary">Secondary</button>
        <button class="btn error">Error</button>
    </section>

  Para ello, usa los siguientes estilos, donde puedes ver cómo se definen diferentes variables:

  .. code-block:: css
    :linenos:
    :force:

    * {
        border: 0;
    }
    html {
        --primary: #0076c6;
        --secondary: #333333;
        --white: #ffffff;
        --error: #ee0000
    }
    .btn {
        padding: 1rem 1.5rem;
        background: transparent;
        font-weight: 700;
        border-radius: 0.5rem;
        cursor: pointer;
        outline: none;
    }
    .primary {
        background: var(--primary);
        color: var(--white);
    }
    .secondary {
        background: var(--secondary);
        color: var(--white);
    }
    .error {
        background: var(--error);
        color: var(--white);
    }

  Ahora considera un documento HTML con el siguiente contenido:

  .. code-block:: html
    :linenos:
    :force:

    <div class="mover"></div>

  Considera también el siguiente código de CSS aplicado al documento anterior:

  .. code-block:: css
    :linenos:
    :force:

    .mover {
        width: 50px;
        height: 50px;
        background: red;
        position: absolute;
        left: calc( var(--mouse-x) + 10px );
        top: var(--mouse-y);
    }

  Finalmente, asume que se ha definido el siguiente manejador de evento que se invoca por el navegador cada vez que la persona usuaria mueve el ratón (las coordenadas actuales del ratón se asignan a los atributos ``clientX`` y ``clientY`` del argumento):

  .. code-block:: javascript
    :linenos:
    :force:

    let root = document.querySelector("html");

    root.addEventListener("mousemove", e => {
        root.style.setProperty('--mouse-x', e.clientX + "px");
        root.style.setProperty('--mouse-y', e.clientY + "px");
    });

  Indica en qué coordenadas *(x,y)* se encuentra el píxel de la esquina inferior derecha del cuadrado rojo cuando el puntero del ratón está en las coordenadas *(40,50)*.

  .. solución: (100,100)
  .. examen julio 2022

.. --------



Acceso a servicios web de terceros
----------------------------------

.. admonition:: :problema-contador-servicios:`Problema`
  :class: problema

  Sabiendo que no hay ningún error en el siguiente código, indica la salida que emite por consola el siguiente bloque de JavaScript:

  .. code-block:: javascript
    :linenos:
    :force:

    p1()
    .then( (x) => { console.log(x*x); return p2(x+1,x+2,x+3); } )
    .then( (x) => { console.log(x.a+x.b); x.a++; return true; } )
    .catch( (x) => console.log(x.a*x.b) );

    function p1() {
      return new Promise( (resolve,reject) => resolve(2) );
    }
    
    function p2(a,b) {
      return new Promise( (resolve,reject) => reject( {a:a,b:a*b} ) );
    }

  .. solución: 4,36, https://jsfiddle.net/tb5vya3r/

.. ------

.. admonition:: :problema-contador-servicios:`Problema`
  :class: problema

  Sabiendo que no hay ningún error en el siguiente código, indica con qué valor hay que sustituir las expresiones ``@1`` y ``@2`` en el siguiente código para que la salida emitida por consola sea 5:

  .. code-block:: javascript
    :linenos:
    :force:

    new Promise( (resolve,reject) => resolve( {a:0,b:2} ) )
    .then( (x) => { 
      return new Promise (
        function (resolve,reject) {
          if (x.a+5===@1 && x.b*x.b*x.b===@2) {
            resolve(x.a+5);
          }
          else {
            reject(x.b+2);
          }
        }
      )
    })
    .then( (x) => console.log(x) )
    .catch( (x) => console.log(x) );

  .. solución: @1=5,@2=8, https://jsfiddle.net/dLxq5n0k/

.. ------

.. admonition:: :problema-contador-servicios:`Problema`
  :class: problema
  
  Indica cuál es la salida del siguiente programa en JavaScript.

  .. code-block:: javascript
    :linenos:
    :force:

    new Promise(function(resolve, reject) {
      setTimeout(() => resolve(1), 1000);
    }).then(function(result) {
      console.log(result);
      return new Promise((resolve, reject) => { // (*)
        setTimeout(() => resolve(result * 2), 1000);
      });
    }).then(function(result) { // (**)
      console.log(result);
      return new Promise((resolve, reject) => {
        setTimeout(() => resolve(result * 2), 1000);
      });
    }).then(function(result) {
      console.log(result);
    });

  .. solución: 1,2,4


.. ------

.. admonition:: :problema-contador-servicios:`Problema`
  :class: problema

  Teníamos un fragmento correcto de código en JavaScript que realizaba una petición asíncrona a ``http://example.com/movies.json/birdbox`` y mostraba por consola el valor del atributo ``title`` de los datos en JSON devueltos por el servidor. Lamentablemente, las líneas de nuestro programa se han desordenado y, además, mezclado con líneas de otros programas. Indica la secuencia de líneas, de entre las siguientes, que permiten reconstruir el programa original. Una posible respuesta (incorrecta) sería ``03,09,04``.

  .. code-block::
  
    01    .then(function(r) {
    02    .then(
    03    })
    04    console.log(title);
    05    .then(title)
    06    console.log(movie.title);
    07    .then(function(movie) {
    08    console.log(r.json().title);
    09    });
    10    fetch('http://example.com/movies.json/birdbox')
    11    return r.json();
    12    fetch(function('http://example.com/movies.json/birdbox'))

  .. solución: 10,01,11,03,07,06,09


.. ------

.. admonition:: :problema-contador-servicios:`Problema`
  :class: problema

  Sabiendo que no hay ningún error en el siguiente código y que la llamada al URL indicado en ``fetch`` devuelve en el cuerpo de la respuesta el dato válido en JSON ``{"title":"天気の子","director":"新海誠","year":2019}``, indica el código con el que hay que sustituir ``@1`` y ``@2`` en el siguiente bloque de JavaScript para que se imprima por consola el valor ``2021``:

  .. code-block:: javascript
    :linenos:
    :force:

    async function movie() {
      var g= 1;
      g+= @1;
      try {
        let r= await fetch('http://example.com/movies.json/3400231');
        let x= @2 r.json();
        console.log(x.year + g);
      } catch(e) {
        console.log(e)
      };
    }

    movie();

  .. solución: @1=1,@2=await, https://codesandbox.io/s/objective-leaf-9wx6z


.. ------

.. admonition:: :problema-contador-servicios:`Problema`
  :class: problema

  Indica los tres errores de formato que hay en la representación en JSON del siguiente dato y cómo los solucionarías con la menor cantidad de modificaciones.

  .. code-block::
    :linenos:

    {
      "name": "Duke",
      age: 18,
      "streetAddress": "100 Internet Dr",
      "city":"New York",
      "married": true
      "sex": male,
      "companies": [],
      "universities": [{}  ],
      "phoneNumbers": [
        { "Mobile": "1111111111" },
        { "Mobile": 2222222222 },
        33333
      ]
    }

  .. solución: "age", coma detrás de true, "male"

.. ------

.. admonition:: :problema-contador-servicios:`Problema`
  :class: problema

  Indica con qué sustituir ``@1`` y ``@2`` en el siguiente código para que ``delay`` defina una alternativa a ``setTimeout`` basada en promesas.

  .. code-block:: javascript
    :linenos:
    :force:

    function delay(ms) {
      return new Promise(resolve => setTimeout(@1,@2));
    }

    // ejemplo de uso:
    delay(3000).then(() => console.log('esto se imprime tras 3 segundos'));

  .. solución: @1=resolve, @2=ms

.. ------

.. admonition:: :problema-contador-servicios:`Problema`
  :class: problema

  Sabiendo que no hay ningún error en el siguiente código y que la llamada al URL indicado en ``fetch`` devuelve en el cuerpo de la respuesta el dato válido en JSON ``{"title":"天気の子","director":"新海誠","year":2019}``, indica la salida que emite por consola el siguiente bloque de JavaScript:

  .. code-block:: javascript

    function movie() {
      var g= 1;  
      fetch('http://example.com/movies.json/3400231')
      .then( r => {
        g++;
        return r.json();
      })
      .then( x => {
        g++;
        console.log(x.year+g);
      })
      .catch( e => console.log(e) );
      g++;
      console.log(g);
    }

    movie();

  .. solución: 2,2023, https://codesandbox.io/s/dazzling-paper-kpkyq

.. -------

.. admonition:: :problema-contador-servicios:`Problema`
  :class: problema

  Una petición GET al URL ``https://api.coindesk.com/v1/bpi/currentprice.json`` devuelve *siempre* la siguiente información en formato JSON:

  .. code-block:: javascript
    :linenos:
    :force:

    {
        "time":{
          "updated":"Jul 1, 2021 15:11:00 UTC",
          "updatedISO":"2021-07-01T15:11:00+00:00",
          "updateduk":"Jul 1, 2021 at 16:11 BST"
        },
        "disclaimer":"This data was produced from the CoinDesk Bitcoin Price Index (USD).",
        "chartName":"Bitcoin",
        "bpi":{
          "USD":{
              "code":"USD",
              "symbol":"&#36;",
              "rate":"33,472.6400",
              "description":"United States Dollar",
              "rate_float":33472.64
          },
          "GBP":{
              "code":"GBP",
              "symbol":"&pound;",
              "rate":"24,289.1200",
              "description":"British Pound Sterling",
              "rate_float":24289.12
          },
          "EUR":{
              "code":"EUR",
              "symbol":"&euro;",
              "rate":"28,203.4774",
              "description":"Euro",
              "rate_float":28203.47
          }
        }
    }

  Considera el siguiente código en JavaScript:

  .. code-block:: javascript
    :linenos:
    :force:

    async function euro() {
        fetch("https://api.coindesk.com/v1/bpi/currentprice.json")
        .then(response => response.json())
        .then(data => console.log(data.bpi.EUR.rate_float));
    }

    function libra() {
        fetch("https://api.coindesk.com/v1/bpi/currentprice.json")
        .then(response => response.json())
        .then(data => console.log(data.bpi.GBP.rate_float));
    }

    function dollar() {
        fetch("https://api.coindesk.com/v1/bpi/currentprice.json")
        .then(response => response.json())
        .then(data => console.log(data.bpi.USD.rate_float));
    }

    async function main() {
        dollar();
        await euro();
        libra();
    }

    main();

  Indica cuál o cuáles de las salidas siguientes es imposible que se produzca por consola (independientemente del estado de la conexión a internet) al ejecutar el programa anterior:

  1. 33472.64 28203.47 24289.12
  2. 33472.64 24289.12
  3. 28203.47 33472.64 24289.12
  4. 24289.12 28203.47 33472.64
  5. 28203.47 24289.12 33472.64   

  Indica el número o números de línea que corresponden con la respuesta. Si ninguna de las salidas es viables, indica *ninguna*.

  .. solución: 4 (la libra no puede ir antes del euro por el await)  https://jsfiddle.net/t0fvn9x6/1/ 
  .. examen julio 2021

.. -------

.. admonition:: :problema-contador-servicios:`Problema`
  :class: problema

  Indica qué poner en ``@1``, ``@2`` y ``@3`` para que el siguiente comic sobre CORS de la web ``wizardzines.com`` de Julia Evans esté completo y la información sea correcta:

  .. figure:: _static/img/problema-cors.png
    :target: _static/img/problema-cors.png
    :alt: CORS
    :figwidth: 60 %

  .. solución: @1=OPTIONS, @2=clothes.com / *, @3=POST
  .. examen julio 2022

.. --------

.. admonition:: :problema-contador-servicios:`Problema`
  :class: problema

  Indica qué poner en ``@1``, ``@2`` y ``@3`` para que el siguiente comic sobre peticiones HTTP de la web ``wizardzines.com`` de Julia Evans esté completo y la información sea correcta:

  .. figure:: _static/img/problema-anatomy-http-request.png
    :target: _static/img/problema-anatomy-http-request.png
    :alt: peticiones HTTP
    :figwidth: 60 %

  .. solución: @1=headers, @2=20, @3=body
  .. examen julio 2022

.. --------


Componentes web
---------------

.. admonition:: :problema-contador-componentes:`Problema`
  :class: problema

  Considera el siguiente fichero ``index.html``:

  .. code-block:: html
    :linenos:

    <!DOCTYPE html>
    <html>
    <head>
      <meta charset="utf-8">
      <title>Mi componente</title>
      <script src="micomp.js" defer></script>
      <style>
        :host {
          color: mintcream;
        }
        p.m {
          color: papayawhip;
        }
      </style>
    </head>
    <body>
      <h1>Mi componente</h1>

      <template id="mi-componente">
        <style>
          p {
            color: navajowhite;
          }
        </style>
        <p class="m"><slot name="mi-texto">Texto por defecto</slot></p>
      </template>

      <mi-componente>
        <span slot="mi-texto">En un agujero en el suelo, vivía un hobbit.</span>
      </mi-componente>

      <mi-componente>
        No un agujero   
          <ul slot="mi-texto">
            <li>húmedo, sucio, repugnante, con restos de gusanos 
                y olor a fango,</li>
            <li>ni tampoco un agujero seco, desnudo y arenoso, 
                sin nada en que sentarse o que comer:</li>
          </ul>
        era un agujero-hobbit, y eso significa comodidad.  
      </mi-componente>

    </body>
    </html>

  Considera también el contenido del fichero ``micomp.js``:

  .. code-block:: javascript
    :linenos:

    customElements.define('mi-componente',
      class extends HTMLElement {
        constructor() {
          super();

          const template = document.getElementById('mi-componente');
          const templateContent = template.content;

          this.attachShadow({mode: 'open'}).appendChild(
            templateContent.cloneNode(true)
          );
        }
      }
    );

  Enumera en qué colores se muestran las palabras *suelo*, *fango* y *comodidad*. Si la palabra no se muestra en el documento web, o no puedes saber su color, indica *ninguno*. Una posible respuesta (incorrecta) sería: ``red, ninguno, blue``.

  .. solución: navajowhite, navajowhite, ninguno; https://jsfiddle.net/jncq9ra8/

.. ------

.. admonition:: :problema-contador-componentes:`Problema`
  :class: problema

  Considera el contenido del fichero ``invierte-cadena.js`` que define un componente web que muestra invertida y en color azul la cadena recibida como parámetro:

  .. code-block:: javascript
    :linenos:
    :force:

    (function() {
      const template = document.createElement('template');

      template.innerHTML = `
        <style>
          p {
            color: steelblue;
          }
        </style>
        <p @1></p>`;

      function reverse(s) {
        return s.split("").reverse().join("");
      }

      class ReverseString extends HTMLElement {
        constructor() {
          super();
          let clone = template.content.cloneNode(true);
          let shadowRoot = this.attachShadow({mode: 'open'});
          shadowRoot.appendChild(clone);
        }

        connectedCallback() {
          this.s= !this.hasAttribute('s')?"":this.getAttribute(@2);
          this.shadowRoot.querySelector('#cadena').textContent= reverse(@3);
        }
      }

      customElements.define("invierte-cadena", ReverseString);

    })();

  Un posible uso del componente web en un documento HTML sería:

  .. code-block:: html
    :linenos:

    <invierte-cadena s="hola"></invierte-cadena>

  Indica con qué sustituir las marcas ``@1``, ``@2`` y ``@3`` del código anterior para que el componente web funcione correctamente.

  .. solución: @1=id="#cadena",@2="s",@3=this.s,  https://jsfiddle.net/rqgwb5vd/ 
  .. examen enero 2020


.. ------

.. admonition:: :problema-contador-componentes:`Problema`
  :class: problema

  Dibuja cómo se muestra en el navegador el siguiente bloque de un documento HTML cuando el cursor del ratón no está situado en ninguno de los elementos con *id* ``w1`` o ``w2``, y cuando se sitúa sobre el elemento con *id* ``w2``. La imagen ``rain.png`` contiene el icono |rain| y ``sun.png`` contiene |sun|.

  .. |rain| image:: https://image.flaticon.com/icons/png/128/3572/3572873.png
    :height: 14
    :width: 14

  .. |sun| image:: https://image.flaticon.com/icons/png/128/3522/3522281.png
    :height: 14
    :width: 14

  .. code-block:: html
    :linenos:
    :force:

    <h1>El tiempo</h1>
    <ul>
      <li>Lunes <mysterious-element data-img="rain.jpg" 
                  data-text="Chubascos a primera hora de la mañana que desaparecerán
                  por la tarde." id="w1"></mysterious-element></li>
      <li>Martes <mysterious-element data-img="sun.png" data-text="Soleado todo el día." 
                  id="w2"></-info></li>
    </ul>
    <script defer src="mysterious-element.js">

  El fichero ``mysterious-element.js`` define el componente web y su contenido es el siguiente:

  .. code-block:: javascript
    :linenos:
    :force:

    class PopUpInfo extends HTMLElement {
      constructor() {
        super();
      
        const shadow = this.attachShadow({mode: 'open'});
        const wrapper = document.createElement('span');
        wrapper.setAttribute('class', 'wrapper');

        const icon = document.createElement('span');
        icon.setAttribute('class', 'icon');
        this.info = document.createElement('span');
        this.info.setAttribute('class', 'info');

        this.img = document.createElement('img');
        icon.appendChild(this.img);

        const style = document.createElement('style');

        style.textContent = `
          .wrapper {
            position: relative;
            margin: 4px;
          }

          .info {
            font-size: 0.8rem;
            width: 200px;
            display: inline-block;
            border: 1px solid black;
            padding: 10px;
            background: white;
            border-radius: 10px;
            opacity: 0;
            position: absolute;
            bottom: 20px;
            left: 10px;
            z-index: 3;
          }

          img {
            width: 1.1em;
          }

          .icon:hover + .info, .icon:focus + .info {
            opacity: 1;
          }
        `;

        shadow.appendChild(style);
        shadow.appendChild(wrapper);
        wrapper.appendChild(icon);
        wrapper.appendChild(this.info);
      }
      connectedCallback() {
        let text = this.getAttribute('data-text');
        this.info.textContent = text;
        let imgUrl = this.getAttribute('data-img');
        this.img.src = imgUrl;
      }
    }

    customElements.define('popup-info', PopUpInfo);


  La propiedad de CSS ``opacity`` permite definir el grado de transparencia del contenido en una escala de 0 a 1. Un valor de 0 produce un efecto similar a ``visibility:hidden``, excepto porque esto último no consume eventos de ratón (como el clic, por ejemplo).

  .. solución: https://codepen.io/jaspock/pen/VwjQqbJ

.. ----------

.. admonition:: :problema-contador-componentes:`Problema`
  :class: problema

  Indica cuál o cuáles de las siguientes afirmaciones son ciertas. Si ninguna lo es, pon *ninguna* como respuesta. Justifica muy esquematicamente en el espacio correspondiente los motivos por los que has considerado cada afirmación como verdadera o falsa.

  1. Para usar la técnica CORS, es necesario que desde nuestro código en JavaScript (por ejemplo, al llamar a la función ``fetch``) se le dé un valor adecuado a la cabecera ``Origins``.
  2. La *política del mismo origen* (*same-origin policy*) es una restricción implementada hoy en día por todos los servidores web, aunque el servidor web de Apache fue el primero en hacerlo.
  3. La tecnología del DOM ensombrecido (*shadow DOM*) permite crear un subárbol DOM relativamente aislado del árbol DOM global; decimos *relativamente* porque, por ejemplo, algunas propiedades de CSS provenientes de fuera del *shadow DOM* se pueden heredar dentro de este.
  4. Aunque el estándar HTML indica que desde el constructor de un componente web no se debería poder acceder a los atributos del elemento, algunos navegadores permiten hacerlo.
  5. La versión 3 de HTTP se apoya en un protocolo de transporte llamado QUIC.

  .. solución: 3,4,5
  .. examen julio 2021

.. --------


Implementación de servicios web
-------------------------------

.. admonition:: :problema-contador-rest:`Problema`
  :class: problema

  El siguiente código define una función de *middleware* de Express que añade la cabecera ``Content-type`` con valor ``text/html`` a la respuesta del servidor. Indica con qué hay que sustituir ``@1`` y ``@2`` para que el código sea correcto.

  .. code-block:: javascript
    :linenos:
    :force:

    app.use( (request,response,foo) => {
      res.set('Content-Type', '@1')
      @2;
    });

  .. solución: @1=text/html,@2=foo()

.. ------

.. admonition:: :problema-contador-rest:`Problema`
  :class: problema

  Indica qué cadena ha de devolver en el bloque de datos la llamada al servicio web para que la salida emitida por consola sea ``zz80``. Como siempre indica la respuesta más corta posible si hay más de una alternativa; si tu respuesta estuviera escrita en un formato (como HTML, CSS o JSON) que puede ser validado, asegúrate de que es válida.

  .. code-block:: javascript
    :linenos:

    function catalog() {
      fetch('http://example.com/service.json/discover/azz3').
      .then( r => {
        return r.json();
      })
      .then( x => {
        if (x.bool) {
          console.log(x.i+x.i-x.j);
        } else {
          console.log(x.i+x.i+x.j);
        }
      })
      .catch( e => console.log(e) );
    }

    catalog();

  .. solución: {"bool":false,"i":"z","j":80}
  .. solución más corta: {"i":"z","j":80}
  .. examen enero 2020

.. ------

.. admonition:: :problema-contador-rest:`Problema`
  :class: problema

  Indica con qué sustituir las marcas ``@1``, ``@2`` y ``@3`` en el siguiente texto para que sea correcto: "El framework @1 de Node.js nos permite definir lo que en inglés se conoce como *middleware*. El *middleware* está formado por @2 encadenadas que se ejecutan durante el ciclo de vida de una petición al servidor. Cada una de ellas puede acceder a sendos objetos que representan la petición y la @3."

  .. solución: @1=Express,@2=funciones,@3=respuesta


.. admonition:: :problema-contador-rest:`Problema`
  :class: problema

  Tenemos una aplicación web desplegada en ``example.com``. El código que se ejecuta en el servidor está en el fichero ``index.js`` y es el siguiente: 

  .. code-block:: javascript
    :linenos:
    :force:

    const express = require('express');
    const bodyParser = require('body-parser');
    var path = require('path');

    const app = express();

    app.use(bodyParser.json());

    app.get('/index', (req, res) => {
      res.sendFile(path.join(__dirname,'index.html'));
    });

    app.get('/@1', (req, res) => {
      res.send({"key":@2*2});
    });

    app.listen(3000, () => console.log('server started'));

  El documento ``index.html`` que se sirve al cliente desde el código anterior es:

  .. code-block:: html
    :linenos:
    :force:

    <!DOCTYPE html>
    <html>
      <head>
        <meta charset="utf-8">
        <title>Key</title>
      </head>
      <body>
        <script>
          fetch('/@3')
          .then(r => r.json())
          .then(x => console.log(@4))
          .catch(e => console.log(e));
        </script>
      </body>
    </html>

  Indica con qué hay que sustituir las marcas ``@1``, ``@2``, ``@3`` y ``@4`` en los dos bloques anteriores para que si se intenta abrir en un navegador el URL ``example.com/index``, en la consola del navegador se muestre el valor *42*. Como restricción adicional, los valores de ``@2`` y ``@4`` no pueden ser constantes numéricas.

  .. solución: @1=:id (u otra cadena), @2=req.params.id (el mismo nombre que en @1), @3=21, @4=x.key 
  .. solución: https://repl.it/@jaspock/Node-Express#index.js
  .. examen julio 2020

.. -------

.. admonition:: :problema-contador-rest:`Problema`
  :class: problema

  Considera el siguiente fragmento de un documento HTML y asume que la petición al *endpoint* indicado devuelve la cadena en JSON ``[1,2,3,4,5]``:

  .. code-block:: html
    :linenos:
    :force:

    <script>
      async function load(url) {
        let response = @1 fetch(url); 
        if (response.status == 200) {
          return response.json();
        }
        throw new Error(response.status);
      }

      (@2 function(){
        let x= @3 load('https://array.org/5/');
        console.log(JSON.stringify(x[@4]));
      })();
    </script>

  Indica con qué sustituir ``@1``, ``@2``, ``@3`` y ``@4`` para que el código anterior muestra un ``1`` por consola.

  .. solución: @1=await @2=async @3=await, @4=0

.. --------

.. admonition:: :problema-contador-rest:`Problema`
  :class: problema

  Dado el siguiente código de JavaScript, indica con qué sustituir la marca ``@1`` para que se muestre un 10 por consola:

  .. code-block:: javascript
    :linenos:
    :force:

    async function w() {
      return 10;
    }

    function f() {
      w() @1 console.log);
    }

    f();
  
  .. solución: @1=.then(

.. ---------

.. admonition:: :problema-contador-rest:`Problema`
  :class: problema

  Indica con qué sustituir ``@1``, ``@2`` y ``@3`` en el siguiente código para que el servidor solo atienda peticiones de tipo POST que indiquen en sus cabeceras que los datos del *payload* están en formato JSON. En caso contrario, ha de devolver el código de estado 400 y un mensaje de error. La respuesta para ``@4`` ha de usar la variable ``f`` de algún modo.

  .. code-block:: javascript
    :linenos:
    :force:

    const express = require('express');
    const app = express();

    var f = () => {
        return (rq, rs, nx) => {
        if (@1.headers['content-type'] !== 'application/json') {
            @2.send('Este servidor solo procesa datos en JSON');
        } else {
            @3
        }
        }
    }

    app.use(@4)

    app.post('/', (rq, rs) => {
        rs.send('JSON recibido');
    })

    app.post('/message', (rq, rs, nx) => {
        rs.send('JSON recibido');
    })

    app.listen(3000);

  .. solución: @1=rq,@2=rs.status(400),@3=nx();@4=f()  https://repl.it/@jaspock/IncompleteAnxiousTrace#index.js
  .. examen enero 2021

.. --------

.. admonition:: :problema-contador-rest:`Problema`
  :class: problema

  Express define un *middleware* por defecto que se encarga de la gestión de errores que se producen en otros middleware. Este tipo de *middlewares* tiene un prototipo diferente al de los otros *middlewares* al tener un primer parámetro adicional que representa el error:

  .. code-block:: javascript
    :linenos:
    :force:

    app.use((err, req, res, next) => {
        // middleware de gestión del error 
    })


  El programador puede obviamente definir sus propios *middlewares* de gestión de errores. Para llamar a este tipo especial de *middleware* basta pasar un argumento a la llamada a la función ``next``. Por ejemplo, el siguiente código pasa el testigo a un *middleware* de gestión de error definido por el programador cuando llega una petición GET al URL ``/open``.

  .. code-block:: javascript
    :linenos:
    :force:

    app.get('/open', (req, res, next) => {
        next(new Error('I am passing you an error!'));
    });

    app.use((err, req, res, next) => {
        console.log(err);    
        if(!res.headersSent){
        res.status(500).send(err.message);
        }
    });

  Un *middleware* de gestión de error puede (de forma similar a los *middlewares* *normales*) llamar al siguiente *middleware* de gestión de error, generando así una cadena (*pipeline*) de llamadas. En última instancia, si el último *middleware* de la cadena definida por el programador llamará a la siguiente función con un argumento de error, se invocaría el *middleware* de gestión de error por defecto definido por Express.

  El siguiente código para Express define tres funciones de *middleware* de gestión de errores. Si llega una petición a ``/nonexistant`` se devuelve al cliente el mensaje ``NotFound``. Si llega una petición a ``/problematic`` se devuelve al cliente el mensaje ``Unauthorized``. Cualquier otra situación de error detectada en otros *middleware* hace que se devuelva al cliente el mensaje ``UnknownError``.

  .. code-block:: javascript
    :linenos:
    :force:

    app.get('/nonexistant', (req, res, next) => {
        let err = new Error('I couldn\'t find it.');
        err.httpStatusCode = 404;
        next(@1);
    });

    app.get('/problematic', (req, res, next) => {
        let err = new Error('I\'m sorry, you can\'t do that.');
        err.httpStatusCode = @2;
        next(@1);
    });

    app.get(...);

    app.get(...);

    app.use((err, req, res, next) => {
        if (err.httpStatusCode === 404) {
        res.status(400).render('NotFound');
        }
        next(@3);
    });

    app.use((err, req, res, next) => {
        if(err.httpStatusCode === 304){
        res.status(304).render(@4);
        }
        next(@3);
    })

    app.@5((err, req, res, next) => {
        console.log(err);
        if (!res.headersSent) {
        res.status(err.httpStatusCode || 500).render('UnknownError');
        }
    });

  Indica con qué sustituir ``@1``, ``@2``, ``@3``, ``@4`` y ``@5`` en el código anterior para obtener la funcionalidad indicada. 

  .. solución: @1=err, @2= 304, @3=err, @4='Unauthorized', @5=use
  .. examen julio 2021

.. -------

.. admonition:: :problema-contador-rest:`Problema`
  :class: problema

  El siguiente es el código de un servidor con Express con un único punto de acceso que devuelve un fragmento de HTML:

  .. code-block:: javascript
    :linenos:
    :force:

    const express = require('express');
    const cors = require('cors');
    const app = express();
    const port = 8080;

    app.use(cors());

    app.get('/', (req, res) => {
        res.send('a<strong>b</strong>c')
    });

    app.listen(port, () => {
        console.log(`Listening at ${port}`);
    });

  El paquete ``cors`` de Node.js permite en su forma más fácil (como la usada en el código anterior) tener un *middleware* que acepta todas las peticiones CORS independientemente de su origen. 

  Tras lanzar en nuestro ordenador el servicio anterior, creamos la página siguiente con la idea de probarlo:

  .. code-block:: javascript
    :linenos:
    :force:

    <!DOCTYPE html>
    <html lang="es">
    <head><title>T</title></head>
    <body>
        <div id="x"></div>
        <script>
        fetch('@1')
        .then(response => response.text())
        .then(@2 => {let x= document.querySelector("#x"); x.@3= response;})
        </script>
    </body>
    </html>

  Indica con qué sustituir ``@1``, ``@2`` y ``@3`` en el código HTML anterior para que el navegador muestre la cadena ``abc`` con la letra *b* en negrita. Recuerda que la función ``text`` devuelve una promesa que se cumple si el cuerpo de la respuesta representada por el objeto receptor puede convertirse en una cadena de texto. 

  .. solución: @1=http://localhost:8080, @2=response, @3=innerHTML
  .. examen enero 2022

.. --------


Computación en la nube
----------------------

.. admonition:: :problema-contador-nube:`Problema`
  :class: problema

  Indica con qué sustituir ``@1`` en la siguiente frase para que sea correcta: "Los servicios de computación en la nube se pueden dividir en tres categorías en base al nivel de abstracción que ofrecen sobre los recursos utilizados: software como servicio, @1, e infraestructura como servicio"

  .. solución: @1=plataforma como servicio

.. ------

.. admonition:: :problema-contador-nube:`Problema`
  :class: problema

  Indica con qué sustituir las marcas ``@1`` y ``@2`` en el siguiente texto para que sea correcto: "Google Cloud Functions es un servicio de computación en la nube que permite ejecutar código de forma remota sin necesidad de lanzar una @1 explícita para ello, como sí ocurre con Google App Engine; ambos servicios son ejemplos de lo que se conoce en inglés como *@2 as a service*."

  .. solución: @1=instancia de máquina virtual,@2=platform
  .. examen enero 2020

.. ------

.. admonition:: :problema-contador-nube:`Problema`
  :class: problema

  Indica cuál o cuáles de las siguientes afirmaciones son ciertas. Si ninguna lo es, pon *ninguna* como respuesta.
  
  1. Google App Engine no es adecuado para aplicaciones cuya carga en cada momento es difícil de predecir.
  2. Cuando usamos Google App Engine no nos tenemos que preocupar de gestionar los servidores que ejecutan nuestro código, pero es posible que tengamos que configurar los servidores de las bases de datos.
  3. Las aplicaciones alojadas en Google App Engine escalan sus recursos automáticamente en base a la demanda.
  4. La plataforma Google App Engine es gratuita siempre que la aplicación no use ninguna base de datos.
  
  .. solución: 2,3

.. ------

.. admonition:: :problema-contador-nube:`Problema`
  :class: problema

  Indica cuál o cuáles de las siguientes afirmaciones son ciertas. Si ninguna lo es, pon *ninguna* como respuesta.

  1. Las aplicaciones de Google App Engine pueden hacer llamadas a servicios externos usando sus APIs.
  2. Google App Engine realiza automáticamente el balanceo de carga de la aplicación.
  3. Una aplicación de Google App Engine puede usar Google Cloud Storage para almacenar archivos en línea.
  4. Las aplicaciones de Google App Engine pueden ser escritas en diferentes lenguajes de programación.

  .. solución: 1,2,3,4

.. ------

.. admonition:: :problema-contador-nube:`Problema`
  :class: problema

  Indica cuál o cuáles de las siguientes afirmaciones son ciertas. Si ninguna lo es, pon *ninguna* como respuesta.

  1. Las instancias interrumpibles (*preemptible* en inglés) de Google Compute Engine pueden ser interrumpidas en cualquier momento sin nuestra autorización.
  2. Las instancias interrumpibles de Google Compute Engine no son adecuadas para tareas computacionalmente intensas cuya ejecución puede detenerse y reanudarse posteriormente.
  3. A la hora de decidir en qué región lanzamos una instancia de Google Compute Engine solo tenemos que fijarnos en el coste, ya que la latencia será la misma para los usuarios independientemente de la región.
  4. Dada una instancia detenida de Google Compute Engine, podemos cambiar la cantidad de memoria RAM de la que dispondrá cuando vuelva a lanzarse.

  .. solución: 1,4

.. ------

.. admonition:: :problema-contador-nube:`Problema`
  :class: problema

  Indica con qué sustituir las marcas ``@1`` y ``@2`` en el siguiente texto para que sea correcto: "Las funciones de Google Cloud Functions pueden ser escritas en al menos estos dos lenguajes de programación: ``@1`` y ``@2``".

  .. solución: JavaScript, Java

.. ------

.. admonition:: :problema-contador-nube:`Problema`
  :class: problema

  Indica cuál o cuáles de las siguientes afirmaciones son ciertas. Si ninguna lo es, pon *ninguna* como respuesta. Justifica muy esquemáticamente en el espacio correspondiente los motivos por los que has considerado cada afirmación como verdadera o falsa.

  1. Se denominan nubes públicas aquellos entornos de computación en la nube operados y controlados por un organismo público.
  2. Google Cloud Platform ofrece servicios para nubes públicas, privadas y mixtas.
  3. Se denominan nubes privadas aquellos entornos de computación en la nube que cualquiera puede utilizar, quizás previo pago, por internet.
  4. Una nube privada nunca ofrece servicios del tipo *infrastructure as a service*.
  5. Las arquitecturas *serverless* son más propias del modelo de computación en la nube conocido como *platform as a service* que del *infrastructure as a service*.
  6. Google App Engine integra un motor de base de datos, por lo que nunca es necesario para que nuestra aplicación de Google App Engine funcione lanzar instancias adicionales de máquinas virtuales en Google Cloud Platform.

  .. solución: 5

.. -------

.. admonition:: :problema-contador-nube:`Problema`
  :class: problema

  Indica cuál o cuáles de las siguientes afirmaciones son ciertas. Si ninguna lo es, pon *ninguna* como respuesta. Justifica muy esquemáticamente en el espacio correspondiente los motivos por los que has considerado cada afirmación como verdadera o falsa.

  1. Es posible ejecutar múltiples imágenes al mismo tiempo basadas en un único contenedor de Docker.
  2. Por seguridad, un contenedor no puede acceder a archivos alojados en directorios del sistema anfitrión (*host*).
  3. Cada vez que ejecutamos *docker build*, la imagen se construye desde cero.
  4. La instrucción *RUN* de un *Dockerfile* sirve para ejecutar código dentro del sistema operativo de la imagen mientras esta se construye.
  5. Cuando usamos el servicio *Google Cloud Build*, la imagen resultante se almacena en una base de datos relacional dentro de *Google Cloud SQL*.

  .. solución: 4
  .. examen enero 2022

.. -------


.. PENDIENTE: añadir problemas más elaborados del tipo cada oveja con su pareja, por ejemplo.
