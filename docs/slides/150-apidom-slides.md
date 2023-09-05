% La API para JavaScript del navegador
% Desarrollo de Aplicaciones en Internet
%

## La API para JavaScript del navegador (Web API)

Desarrollo de Aplicaciones en Internet

Fuente: [JavaScript](https://www.kirupa.com/html5/learn_javascript.htm)

Fuente: [Web API reference](https://developer.mozilla.org/es/docs/Web/API)

## Qué hacer con las *APIs web*

- *Escuchar* eventos (por ejemplo, un clic del ratón o el borrado de un elemento del DOM) y ejecutar código en respuesta a ellos.
- Modificar *en vivo* el HTML y el CSS de un documento.
- Intercambiar datos con un servidor (lo veremos en otro tema).
- Retardar la ejecución de un código hasta dentro de un tiempo (*setTimeout*).
- Almacenar información en una base de datos del navegador.

## Qué hacer con las *APIs web*

- Interactuar con webcams, geolocalización, micrófono, etc.
- Realizar animaciones (por ejemplo, mediante *canvas* o *SVG*).
- Ejecutar algoritmos.
- ...

## El árbol DOM

- Como ya vimos, los nodos representan elementos, contenido textual, comentarios, etc.
- Jerarquía de tipos para los elementos: *Node* <- *Element* <- {*HTMLElement*, *SVGElement*}

## Objetos window y document

- El objeto global *window* (tipo *Window*) representa la ventana que contiene un documento DOM; podemos acceder a numerosas propiedades como *window.innerWidth*.
- El objeto global *document* (tipo *Document*) es la puerta de entrada al árbol DOM; es el objeto que vamos a usar más a menudo, por ejemplo, a través de funciones como *querySelector*.
- El objeto *document.body* permite acceder al cuerpo del documento.

## Acceso con selectores CSS

- *querySelector* devuelve un elemento (tipo *Element*); se devuelve el primero si más de uno satisface el criterio del selector
- *querySelectorAll* devuelve una lista *no viva* (es decir, la lista no se actualiza dinámicamente) de elementos

~~~
var el = document.querySelector(".miClase");
~~~

~~~
var images = document.querySelectorAll("img.pictures, img.charts");

for (var i = 0; i < images.length; i++) {
    console.log(images[i].getAttribute("src"));
}
~~~

## Antes de *querySelector*

- Estos dos fragmentos de código son equivalentes, pero la primera forma (estandarizada más recientemente) es mucho más compacta:

~~~
document.querySelector("#settingsForm > table > tbody > tr:nth-child(2) > td:first-child")
        .innerHTML+= "<p>Tim Berners-Lee</p>";
~~~

~~~
document.getElementById("settingsForm").getElementsByTagName("table")[0]
        .getElementsByTagName("tbody")[0].getElementsByTagName("tr")[1]
        .getElementsByTagName("td")[0].innerHTML+= "<p>Tim Berners-Lee</p>";
~~~

## Consulta y modificación del DOM

- Modificación del contenido textual de un elemento:

~~~
var title = document.querySelector("#intro");
title.textContent = "Ulises";
~~~

## Consulta y modificación de atributos

~~~
var title = document.querySelector("#picture");
title.setAttribute("src", "http://www.example.com");
var t = title.getAttribute("alt");
var i = title.id;             // para id y class no es necesario usar los métodos anteriores
title.className = "bar foo";  // el id y la clase se exponen como atributos de un elemento
~~~

## Consulta y modificación de clases

- Una manera mejor que *className* de gestionar las clases de un elemento.

~~~
var divElement = document.querySelector("#myDiv");
divElement.classList.add("bar");
divElement.classList.remove("foo");
divElement.classList.toggle("foo");

if (divElement.classList.contains("bar")) {
    ....
}

divElement.className = "";  // borra todas las clases
~~~

## Atributo *style* de un elemento

~~~
<!doctype html>
<html><head><title>simple style example</title>
<script type="text/javascript">
  function alterStyle(elem) {
    elem.style.backgroundColor = "green";   // los guiones se eliminan en el nombre del atributo
  }
  function resetStyle(elemId) {
    elem = document.getElementById(elemId);
    elem.style.backgroundColor = 'white';
  }
</script>
</head>
<body>
<p id="p1" onclick="alterStyle(this);">Click here to change background color.</p>
<button onclick="resetStyle('p1');">Reset background color</button>
<!-- Es muy recomendable añadir los eventos con addEventListener y no con onclick -->
</body>
</html>
~~~

## Consulta y modificación de estilos

- *style* solo devuelve propiedades asignadas en línea al elemento (con el atributo *style*) o mediante *element.style.propiedad*.
- Para modificar los estilos de múltiples elementos, se puede inyectar desde JavaScript elementos de tipo *style* o añadir reglas a una hoja existente.

~~~
var e = document.createElement("style");
e.innerHTML= "p {color: red;}"
document.head.appendChild(e);
~~~

~~~
var e= document.querySelector('link[href="normal.css"]')
e.sheet.insertRule("p { background-color: blue}");  // otra manera
~~~

## Forma recomendada de cambiar estilos

- Salvo causa muy justificada, usar siempre que sea posible el atributo *class* para afectar a los estilos de un elemento.

## Recorrer el DOM

~~~
var bodyElement = document.body;

if (bodyElement.firstChild) {
    ...
}
~~~

~~~
var bodyElement = document.body;

for (var i = 0; i < bodyElement.children.length; i++) {
    var childElement = bodyElement.children[i];
    console.log(childElement.tagName);
}
~~~

~~~
function theDOMElementWalker(node) {
  if (node.nodeType == Node.ELEMENT_NODE) {
    // console.log(node.tagName);
    node = node.firstChild;
    while (node) {
      theDOMElementWalker(node);
      node = node.nextSibling;
    }
  }
}
~~~


## Mejor que usar innerHTML

1. Crear el elemento con *document.createElement*; esta función solo está definida para *document*.
2. Obtener una referencia al nodo que hará de padre.
3. Insertar el nuevo nodo con *appendChild*.

~~~
<body>
  <h1 id="theTitle" class="highlight summer">What's happening?</h1>

  <script>
    var newElement = document.createElement("p");
    newElement.textContent = "I exist entirely in your imagination.";
    document.body.appendChild(newElement);
  </script>
</body>
~~~

## innerHTML y textContent

- *innerHTML* analiza (*parsing*) el contenido como HTML y tarda más.
- *textContent* interpreta el contenido como texto plano, es más rápido y previene ataques XSS (*cross-site scripting*)

## Inserción en el DOM

- *appendChild* siempre añade el nuevo elemento como último hijo del padre.
- Para insertarlo en otra posición hay que usar *insertBefore*.

~~~
<body>
  <h1 id="theTitle" class="highlight summer">What's happening?</h1>
  <script>
    var newElement = document.createElement("p");
    newElement.textContent = "I exist entirely in your imagination.";
    var scriptElement = document.querySelector("script");
    document.body.insertBefore(newElement, scriptElement);

    document.body.removeChild(newElement);  // borrado del elemento
    // newElement.parentNode.removeChild(newElement);  
    // equivalente para cuando no tenemos un objeto apuntando al padre
  </script>
</body>
~~~

## Gestión de eventos

- Eventos típicos son *click*, *mouseover*, *DOMContentLoaded* (cuando el DOM se ha cargado), *load* (cuando todo el documento se ha cargado), *keydown*, *keyup*...

~~~
<!doctype html>
<html>
<head>
  <title>Click Anywhere!</title>
</head>
<body>
  <script>
    document.addEventListener("click", changeColor, false);

    function changeColor() {
      document.body.style.backgroundColor = "#FFC926";
    }
  </script>
</body>
</html>
~~~

## Gestión de eventos

- El manejador de eventos es invocado por el navegador con un parámetro de tipo evento.
- *e.currentTarget* es el elemento al que se asoció el manejador, mientras que *e.target* es el elemento sobre el que ha ocurrido el evento.

~~~
function hide(e){
  e.currentTarget.style.visibility = "hidden";
}

var ps = document.getElementsByTagName('p');

for(var i = 0; i < ps.length; i++){
  ps[i].addEventListener('click', hide, false);
}

// click around and make paragraphs disappear
~~~

## Captura y burbujeo de eventos

![](https://javascript.info/article/bubbling-and-capturing/eventflow.svg)

[Fuente](https://javascript.info/)


## Captura y burbujeo de eventos

- Los eventos comienzan por la raíz del árbol y se van propagando hacia abajo hasta llegar al elemento en que se produjo.
- En una segunda fase *burbujean* (*to bubble*) hacia arriba.
- En cada paso, se invoca a los manejadores de eventos que hayan sido definidos.
- El tercer parámetro de *addEventListener* es un booleano que define si el manejador de evento es para la fase de captura (o la de *bubbling* si es *false*).
- *e.stopPropagation()* detiene el proceso en el manejador actual.

## Captura y burbujeo de eventos

- Comprueba la salida de la siguiente [aplicación web](https://jsfiddle.net/qo2xzf9a/).

~~~
<!doctype html>
<html>
<head>
<title>Eventos</title>
<style>
div {border: 1px solid black; padding: 20px; margin: 10px;}
</style>
</head>
<body id="theBody" class="item">
    <div id="one_a" class="item">
        <div id="two" class="item">
            <div id="three_a" class="item">
                <button id="buttonOne" class="item">one</button>
            </div>
            <div id="three_b" class="item">
                <button id="buttonTwo" class="item">two</button>
                <button id="buttonThree" class="item">three</button>
            </div>
        </div>
    </div>
    <div id="one_b" class="item">

    </div>

    <script>
        var items = document.querySelectorAll(".item");

        for (var i = 0; i < items.length; i++) {
            var el = items[i];

            //capturing phase
            el.addEventListener("click", doSomething, true);

            //bubbling phase
            el.addEventListener("click", doSomething, false);
        }

        function doSomething(e) {
            console.log(e.currentTarget.id + " (target:"+e.target.id+")");
        }
    </script>
</body>
</html>
~~~

## El bucle de eventos

- La ejecución del código de un programa en JavaScript se produce en un único hilo (normalmente, uno por cada pestaña del navegador).
- Este hilo se puede bloquear (de manera que la aplicación del navegador deja de responder) si se ejecuta código muy largo o un bucle infinito.
- Muchas funciones de la *API web* que tienen que ver con entrada/salida son *no bloqueantes* / *asíncronas* y se ejecutan en otro hilo.

~~~
function timeout() {
  timeoutID = setTimeout(f, 2000);
}

// función de callback
function f() {...}
~~~

## El bucle de eventos

- Pese a ejecutarse el código en un único hilo, el hilo principal de ejecución no se bloquea mientras las funciones de la API que hemos estudiado (por ejemplo, *setTimeout* o *addEventListener*) están esperando al evento correspondiente que disparará la ejecución de la función de *callback*.
- Cuando una función asíncrona de *callback* de la *API web* se tiene que ejecutar (por ejemplo, porque termina la cuenta atrás o porque se hace clic en un botón), la llamada correspondiente no se ejecuta inmediatamente, sino que se encola.

## El bucle de eventos

- El bucle de eventos atiende y ejecuta las funciones almacenadas en la cola de funciones *callback*.
- El motor de JavaScript no procesa el bucle de eventos hasta que el código del *callback* actual termina.
- En general, el bucle de eventos no saca ninguna función de *callback* de la cola hasta que la pila esté vacía.
- Herramienta para visualizar todo lo anterior ([un ejemplo](http://latentflip.com/loupe/?code=ZnVuY3Rpb24gcHJpbnRIZWxsbygpIHsNCiAgICBjb25zb2xlLmxvZygnSGVsbG8gZnJvbSBiYXonKTsNCn0NCg0KZnVuY3Rpb24gYmF6KCkgew0KICAgIHNldFRpbWVvdXQocHJpbnRIZWxsbywgMzAwMCk7DQp9DQoNCmZ1bmN0aW9uIGJhcigpIHsNCiAgICBiYXooKTsNCn0NCg0KZnVuY3Rpb24gZm9vKCkgew0KICAgIGJhcigpOw0KfQ0KDQpmb28oKTs%3D!!!PGJ1dHRvbj5DbGljayBtZSE8L2J1dHRvbj4%3D),
[otro](http://latentflip.com/loupe/)).

## Gestión de memoria

- Cada hilo de JavaScript utiliza una pila y un *heap* de forma similar a otros lenguajes de programación.
- Existe también un espacio de memoria para las variables globales.
- El recolector de basura funciona de forma similar a otros lenguajes como Java, eliminando objetos de memoria cuando no son alcanzables.
- La tecnología de *web workers* permite definir código que se ejecuta en su propio hilo.

## Cuando se carga una página

- El navegador va construyendo el DOM conforme va analizando el documento HTML.
- Cuando encuentra un elemento *script* el analizador se detiene y se procesa el código en JavaScript; si este código contiene instrucciones *fuera de funciones* se ejecutan.
- Tras procesar un bloque *script* el navegador continúa analizando el HTML subsiguiente.
- Este bloqueo por defecto del analizador de HTML puede resultar en una mala experiencia de usuario (demasiado tiempo esperando la carga de la página); por ello, se puede sobrescribir con los atributos *async* y *defer*.

## Los atributos async y defer

- Los scripts marcados con uno de los atributos *async* o *defer* no detienen el análisis y visualización del documento; los scripts se descargan en segundo plano.
- Un script marcado con *async* se puede comenzar a descargar en cualquier momento y cuando se ha descargado se ejecuta; el evento *DOMContentLoaded* puede producirse antes o después de dicha ejecución; otros script marcados con *async* podrían ejecutarse antes de otro script marcado con *async* que aparece antes en el código.

## Los atributos async y defer

- Un script marcado con *defer* se ejecuta cuando el árbol está listo, pero antes de disparar el evento *DOMContentLoaded*; los scripts marcados con *defer* se ejecutan en el orden en el que aparecen en el documento.

## Dónde poner el JavaScript

- Antiguamente se recomendaba colocar los scripts al final del *body* (o, en otras partes del documento, pero esperando al evento *DOMContentLoaded* para usar funciones como *querySelector*), pero esto introduce una secuenciación que puede resultar en una mala experiencia de usuario (la página se visualiza, pero no se puede interactuar sobre ella porque el código se está descargando todavía).

## Dónde poner el JavaScript

- La práctica moderna es colocar los scripts en la cabecera (*head*) y usar *async* o *defer* según corresponda; así, los scripts se descargan asíncronamente sin bloquear el navegador.
- Para los scripts *async* es necesario seguir esperando al evento *DOMContentLoaded* antes de intentar recorrer el árbol DOM.

```
<script defer src="j1.js"></script>  // En HTML5 no es necesario usar type="text/javascript"
<script async src="j2.js"></script>
<script src="j3.js"></script>
```

