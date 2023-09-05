% El lenguaje JavaScript
% Desarrollo de Aplicaciones en Internet
%

## El lenguaje JavaScript

Desarrollo de Aplicaciones en Internet

Fuente: [A re-introduction to JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript/A_re-introduction_to_JavaScript)

## Historia

- Diseñado en 1995 por Netscape Communications para su navegador (heredero de Mosaic, el primer navegador gráfico).
- Se *inspira* levemente en algunos aspectos de Java, que estaba entonces en auge, pero tiene elementos de lenguajes funcionales como Scheme.

## Historia 

- Bajo el nombre EcmaScript (ES) es un estándar de Ecma International desde pocos meses después de su creación.
- La versión 3 apareció en 1999, la 5 en 2009, la 6 en 2015, la 7 en 2016, la 8 en 2017, etc. (ahora se revisa anualmente).

## Características

- JavaScript no tiene concepto de entrada/salida.
- Es un lenguaje de script pensado para ser ejecutado en un entorno que es el que aporta mecanismos para la comunicación con el exterior: navegador, formularios en PDFs, Node.js, MondoDB, etc.
- En 1995, Netscape Enterprise Server ya permitía programar en JavaScript en el lado del servidor.
- Lenguaje interpretado (no compilado), aunque muchos motores incorporan la compilación *just-in-time*.

## Introducción

- Algunas estructuras son similares a Java o C.
- JavaScript no tiene clases, sino prototipos de objetos. ES6 aporta una especie de clases como *syntactic sugar*.
- Es un lenguaje de tipos *débiles* y *dinámicos*.
- Las funciones son objetos de primera clase.

## Tipos de datos

- Cada expresión o valor tiene un tipo:
    - *Number*
    - *String*
    - *Boolean*
    - *Symbol* (desde ES6)
    - *Object* (*Function*, *Array*, *Date*, *RegExp*...)
    - *null*, *undefined*

## Números

- Los números son reales de doble precisión. Como en otros lenguajes, la representación en coma flotante de ciertos valores [no es exacta](https://0.30000000000000004.com/).
- Se pueden usar los operadores aritméticos habituales.
- No existen enteros como tales.
- Existe un objeto predefinido *Math*.

~~~
0.1 + 0.2 == 0.30000000000000004;  // true
(0.1+0.2).toFixed(2) == "0.30";    // true
~~~

~~~
Math.sin(3.5);
var circumference = Math.PI * (r + r);
~~~

## Conversiones

~~~
parseInt("123", 10);   // 123 (de cadena a entero en base 10)
parseFloat("3.14");    // 3.14 (de cadena a real)
+ "42";                // 42 (diferente a 0+"42")
parseInt("hello", 10); // NaN (not a number)
NaN + 5;               // NaN
isNaN(NaN);            // true
1 / 0;                 // Infinity
isFinite(-Infinity);   // false
~~~

## Cadenas

- Secuencias de caracteres Unicode en UTF-16: los caracteres se representan con uno o dos bloques de 16 bits.
- Son un tipo de objeto especial.

~~~
"hello".length;    // 5
'hello'.length;    // 5
"hello".charAt(0); // carácter "h" (representado como cadena)
"hello, world".replace("hello", "goodbye"); // "goodbye, world"
~~~

## Otros tipos

- *null* (indica falta deliberada de valor)
- *undefined* (valor de una variable declarada pero sin valor asignado)
- Los posibles valores de un booleano son *true* y *false*.
- Cuando un valor se convierte a *Boolean* (implícita o explícitamente), *false*, 0, la cadena vacía (""), *NaN*, *null* y *undefined* son falsos.

## Variables

- Se declaran con la palabra reservada *var* o *let*.

~~~
var a;    // undefined en este momento
var name = "simon";
nanne = "garfunkel";   // no da error salvo que usemos 'use strict';
~~~


## Variables

- El ámbito de las variables declaradas con *var* es el de la función.
- Declarar una variable con *var* en un bloque equivale a declararla al principio de la función.
- Declarar con *var* en un bloque una variable homónima a la de un bloque exterior no crea una nueva variable.
- Las variables declaradas con *let* pertenecen al ámbito del bloque correspondiente.


## Variables

- Nota: ni *console.log* ni *document.write* son parte del estándar del lenguaje.

~~~
function f() {
  var a = 5;
  if (true) {
    var a = 7;            // a ya no vale 5; ¡es la misma variable!
    console.log(b);       // undefined
    document.writeln(c);  // excepción ReferenceError (c is not defined)
  }
  var b;
}
~~~


## Instrucción *let* 

- Desde EcmaScript 6 (2015)

~~~
function letTest() {
  let x = 1;
  if (true) {
    let x = 2;       // variable diferente
    // otro let x en este ámbito provocaría un error
    console.log(x);  // 2
  }
  console.log(x);    // 1
}
~~~

## Instrucción *var*

~~~
function varTest() {
  var x = 31;
  if (true) {
    var x = 71;      // misma variable!
    console.log(x);  // 71
  }
  console.log(x);  // 71
}
~~~

## Operadores

~~~
x += 5
x = x + 5
"hello" + " world"   // "hello world"
"3" + 4 + 5          // "345" (cadena+entero o entero+cadena -> cadena)
3 + 4 + "5"          // "75" (se operan 3 y 4 primero)
17 + ""              // "17" (conversión; entero+cadena -> cadena)
123 == "123"         // true (conversión implícita)
1 == true            // true (conversión implícita)
123 === "123"        // false (no hay conversión con ===)
1 === true           // false (no hay conversión con ===)
1 != true            // false
1 !== true           // true
~~~

## Operadores

- La evaluación en cortocircuito (presente en otros muchos lenguajes) es útil para comprobar si un objeto es *null* antes de acceder a sus miembros o para dar valores por defecto.

~~~
var name = o && o.getName();
var name = otherName || "default";
~~~

~~~
var allowed = (age > 18) ? "yes" : "no";
~~~


## Estructuras de control

~~~
var name = "kittens";
if (name == "puppies") {
  name += "!";
} else if (name == "kittens") {
  name += "!!";
} else {
  name = "!" + name;
}
name == "kittens!!"  // true
~~~

## Estructuras de control

~~~
while (true) {
  // an infinite loop!
}

var input;
do {
  input = get_input();
} while (inputIsNotValid(input))

for (var i = 0; i < 5; i++) {
  // Will execute 5 times
}
~~~

## Estructuras de control

- En la instrucción *switch* se usa === para la comparación (también con cadenas).

~~~
switch(a + 3) {
  case b + 2:
    yay();
    break;   // sale del switch como en C
  case 7:
    yey();
    break;
  default:
    neverhappens();
}
~~~

## Objetos

- Los objetos de JavaScript son como colecciones de pares nombre-valor (similar a los diccionarios en Python o los HashMap de Java).
- El nombre es una cadena. El valor es cualquier valor de JavaScript (incluyendo otros objetos).
- Dos formas equivalentes de crear objetos. La segunda es la preferida: sintaxis de objetos literales usada en JSON.

~~~
var obj = new Object();
var obj = {};
~~~

## Objetos

- Sintaxis de objetos literales para objetos más complejos.

~~~
var obj = {
  name: "Carrot",
  "for": "Max",
  details: {
    color: "orange",
    size: 12
  }
}

obj.details.color; // orange
var prop= "size"
obj["details"][prop]; // 12
~~~

## Prototipos

~~~
function Person(name, age) {
  this.name = name;
  this.age = age;
}

// Define una instancia del prototipo:
var You = new Person("You", 24);
~~~

~~~
obj.name = "Simon";
var name = obj.name;    // esta forma suele ser más eficiente

prop= "name";  // el valor de prop se puede leer de un fichero o un formulario
obj[prop] = "Simon";
var name = obj[prop]; // esta permite obtener nombres de propiedades durante la ejecución
~~~

## Arrays

- Son un tipo especial de objeto.
- Las propiedades numéricas solo se pueden acceder con la sintaxis [].

~~~
var a = new Array();
a[0] = "dog";
a[1] = "cat";
a[2] = 42;
a.length; // 3
~~~

## Arrays

- Una notación más conveniente es la de literales de arrays:

~~~
var a = ["dog", "cat", "hen"];
a.push("monkey");
a.length; // 4
~~~

~~~
var a = ["dog", "cat", "hen"];
a[100] = "fox";  // a[90] === undefined
a.length;        // 101
~~~

## Arrays

- Podemos iterar con un bucle *for* o usando *forEach*.
- Métodos disponibles para arrays: *toString*, *concat*, *join*, *pop*, *push*, *reverse*, *shift*, *slice*, *sort*, etc.

~~~
["dog", "cat"].forEach(function(currentValue, index, array) {
  // Hacer algo con currentValue o array[index]
});
~~~

## Funciones

- Las funciones son objetos.

~~~
function add(x, y) {
  var total = x + y;
  return total;
}
~~~

## Funciones

- Se puede invocar una función sin pasar todos los parámetros (valdrán *undefined*).
- Se pueden pasar más argumentos que los declarados.

~~~
add(); // NaN
// No se pueden sumar valores undefined
~~~

~~~
add(2, 3, 4); // 5
// se suman los dos primeros; el 4 se ignora
~~~

## Funciones

- Lo anterior tiene su utilidad en el caso de funciones variádicas:

~~~
function avg() {
  var sum = 0;
  for (var i = 0, j = arguments.length; i < j; i++) {
    sum += arguments[i];
  }
  return sum / arguments.length;
}

avg(2, 3, 4, 5); // 3.5
~~~

## Funciones anónimas

~~~
var avg = function() {
  var sum = 0;
  for (var i = 0, j = arguments.length; i < j; i++) {
    sum += arguments[i];
  }
  return sum / arguments.length;
};
var g=avg;

g(2, 3, 4, 5);
~~~

## Immediately-invoked functions

- Un *truco* para esconder variables locales dentro de su bloque antes de que existiera *let*:

~~~
var a = 1;
var b = 2;

(function() {
  var b = 3;
  a += b;
})();

a; // 4
b; // 2
~~~

## Objetos personalizados

~~~
function Person(first, last) {
  this.first = first;
  this.last = last;
  this.fullName = function() {
    return this.first + ' ' + this.last;
  };
  this.fullNameReversed = function() {
    return this.last + ', ' + this.first;
  };
}
var s = new Person("Simon", "Willison");
~~~

## Objetos personalizados

- Una manera mejor que la anterior que no crea una función por cada objeto:

~~~
function personFullName() {
  return this.first + ' ' + this.last;
}
function personFullNameReversed() {
  return this.last + ', ' + this.first;
}
function Person(first, last) {
  this.first = first;
  this.last = last;
  this.fullName = personFullName;
  this.fullNameReversed = personFullNameReversed;
}
~~~

## Objetos personalizados

- Una manera aún mejor es usar los prototipos de JavaScript.
- Cuando se crea una función en JavaScript, el intérprete le añade una propiedad *prototype*.
- Esta propiedad apunta a un *objeto prototipo* que será luego también compartido por todos los objetos creados usando la función constructora.
- A este objeto prototipo se puede acceder también desde tales objetos con la propiedad *\_\_proto\_\_*.

## Objetos personalizados

- *Person.prototype* es un objeto compartido por todas las instancias de *Person*.

~~~
function Person(first, last) {
  this.first = first;
  this.last = last;
}
Person.prototype.fullName = function() {
  return this.first + ' ' + this.last;
};
Person.prototype.fullNameReversed = function() {
  return this.last + ', ' + this.first;
};
~~~

## Objetos personalizados

- Al intentar acceder a una propiedad de un objeto *Person* sin asignación explícita, el intérprete la busca en *Person.prototype*.

~~~
function Person(first, last) {
  this.first = first;
  this.last = last;
}
Person.prototype.fullName = function() {
  return this.first + ' ' + this.last;
};
var s= new Person("Simon","Willison");
s.__proto__ === Person.prototype;  // true
s.age= 32;  // propiedad explícita que no usa el prototipo
var t= s.fullName() + ", " + s.age;  // "Simon Willison, 32"
~~~

## Objetos personalizados

- Los prototipos se pueden modificar en tiempo de ejecución lo que significa que pueden añadirse métodos a un objeto en cualquier momento.

~~~
s = new Person("Simon", "Willison");
s.firstNameCaps(); // TypeError on line 1: s.firstNameCaps is not a function

Person.prototype.firstNameCaps = function firstNameCaps() {
  return this.first.toUpperCase()
}; // cualquier Person existente responde ahora a esta función
s.firstNameCaps(); // "SIMON"
~~~

## Objetos personalizados

- Se pueden añadir cosas al prototipo de los objetos predefinidos de JavaScript:

~~~
var s = "Simon";
s.reversed(); // TypeError on line 1: s.reversed is not a function

String.prototype.reversed = function reversed() {
  var r = "";
  for (var i = this.length - 1; i >= 0; i--) {
    r += this[i];
  }
  return r;
};

s.reversed(); // nomiS
~~~

## Clases en ES6

~~~
class SimpleDate {
  constructor(year, month, day) {
    // comprueba que es una fecha correcta
    // ...

    this._year = year;
    this._month = month;
    this._day = day;
  }

  addDays(nDays) {...}

  getDay() {
    return this._day;
  }
}
~~~

## Clases en ES6

- No se puede poner una propiedad como privada (existen formas de conseguir algo equivalente que no veremos).

~~~
let today = new SimpleDate(2017, 1, 14);
today.addDays(1);
today._day += 1
~~~

## Clases en ES6

- Paso implícito o explícito del receptor del mensaje.

~~~
let getDay = SimpleDate.prototype.getDay;

getDay.call(today);
getDay.call(tomorrow);

tomorrow.getDay();
~~~

## Clases en ES6

- Herencia.

~~~
class Employee {
  constructor(firstName, familyName) {...}

  getFullName() {...};
  }
}

class Manager extends Employee {
  constructor(firstName, familyName) {
    super(firstName, familyName);
    this._managedEmployees = [];
  }

  addEmployee(employee) {
    this._managedEmployees.push(employee);
  }
}
~~~

## Funciones anidadas

- Las funciones anidadas pueden acceder a variables del ámbito de su función padre.

~~~
function betterExampleNeeded() {
  var a = 1;
  function oneMoreThanA() {
    return a + 1;
  }
  return oneMoreThanA();
}
~~~

## Clausuras

- Son necesarias cuando una función anidada que accede a algunas variables de la función madre sobrevive a esta.
- Una clausura se implementa como un registro que almacena una función y un entorno de la pila.

~~~
function makeAdder(a) {
  return function(b) {
    return a + b;
  };
}
var x = makeAdder(5);
var y = makeAdder(20);
x(6); // 11
y(7); // 27
~~~

## Clausuras

- Las clausuras llevan fácilmente a confusión si no se entiende bien cómo funcionan.

~~~
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
~~~

## Clausuras

- Una posible alternativa es usar una factoría de funciones:

~~~
  function createfunc(i) {
    return function() { console.log("My value: " + i); };
  }

  function f () {
    var funcs = [];

    for (var i = 0; i < 3; i++) {
      funcs[i] = createfunc(i);
    }
    return funcs;
  }

  var m= f();
  for (var j = 0; j < 3; j++) {
    m[j]();
  }
~~~

## Clausuras

- O bien usar *let* (ES6):

~~~
 function f () {
   var funcs = [];
   for (let i = 0; i < 3; i++) {
     funcs[i] = function() {
       console.log("My value: " + i);
     };
     funcs[i]();  // 0, 1, 2
   }
   return funcs;
 }

 var m= f();
 for (var j = 0; j < 3; j++) {
   m[j]();   // 0, 1, 2
 }
~~~

## Clausuras

- Otro ejemplo (muy habitual) de uso de *let*:

~~~
var list = document.getElementById("list");

for (let i = 1; i <= 5; i++) {
  let item = document.createElement("li");
  item.appendChild(document.createTextNode("Item " + i));

  item.addEventListener("click", function (ev) {
    console.log("Item " + i + " is clicked.");
  }, false);
  list.appendChild(item);
}
~~~
