% Hypertext Transfer Protocol (HTTP)
% Desarrollo de Aplicaciones en Internet
%

## Hypertext Transfer Protocol (HTTP)

Desarrollo de Aplicaciones en Internet

Fuente: [HTTP: The Protocol Every Web Developer Must Know](http://code.tutsplus.com/tutorials/http-the-protocol-every-web-developer-must-know-part-1--net-31177)

Fuente: [HTTP/2 Frequently Asked Questions](https://http2.github.io/faq/)


## HTTP

- Internet y la web no son lo mismo.
- Hypertext Transfer Protocol (HTTP) es un protocolo de comunicación para la capa de aplicación.
- La comunicación se produce habitualmente sobre TCP/IP, pero podría utilizarse cualquier otro transporte. De hecho, HTTP/3 usa QUIC en lugar de TCP.
- El puerto por defecto es el 80, pero pueden usarse otros.
- Es un protocolo sin estado (*stateless*).

## HTTP

- La comunicación se produce mediante un mecanismo de petición/respuesta entre un cliente y un servidor.
- La última versión es HTTP/3 de 2019, pero muchos clientes o servidores aún usan los estándares HTTP/2 de 2015 o HTTP/1.1 de 1997.

## URLs

-  Uniform Resource Locators (URLs).
![URL de ejemplo](https://cdn.tutsplus.com/net/authors/jeremymcpeak/http1-url-structure.png)

## Verbos

- Indican la acción a realizar por el servidor.
- Intentan ser lo suficientemente generales para dar cabida a cualquier tipo de solicitud.

## Verbos

- Los verbos más usuales (existen otros como HEAD, TRACE, OPTIONS, etc.) son:
    - GET: obtener un determinado recurso; el URL contiene toda la información necesaria para identificarlo.
    - POST: crear un nuevo recurso; estas peticiones usualmente llevan datos adicionales (*payload* o *body*) que definen el recurso a crear.
    - PUT: actualizar un recurso ya existente; la petición puede llevar datos adicionales si es necesario.
    - DELETE: borrar un recurso determinado.

## Arquitecturas REST

- Las arquitecturas (por ejemplo, de compartición de datos) que siguen un esquema como el de HTTP, esto es, peticiones sin estado basada en los verbos anteriores, se denominan REST.

## Códigos de estado

- Son devueltos por el servidor junto con la información demandada.
- Se definen ciertos rangos según el tipo de respuesta:
    - 1xx: mensajes informativos; por ejemplo, informar al cliente de que puede seguir enviando los datos de una petición.
    - 2xx: la solicitud fue procesada correctamente (200 OK, 206 Partial Content).

## Códigos de estado

- Más rangos según el tipo de respuesta:

    - 3xx: el cliente ha de hacer alguna tarea adicional; por ejemplo, buscar el recurso en un URL diferente (301 Move Permanently, 303 See Other) o en su propia caché (304 Not Modified).

## Códigos de estado

- Más rangos según el tipo de respuesta:

    - 4xx: la petición es incorrecta o el recurso no existe (400 Bad Request, 401 Unauthorized, 404 Not Found).
    - 5xx: indican fallos del servidor durante el procesamiento (501 Not Implemented, 503 Service Unavailable).

## Ejemplo de petición/respuesta

~~~
GET /index.html HTTP/1.1
Host: www.example.com

~~~

~~~
HTTP/1.1 200 OK
Date: Mon, 23 May 2005 22:38:34 GMT
Content-Type: text/html; charset=UTF-8
Content-Encoding: UTF-8
Content-Length: 138
Last-Modified: Wed, 08 Jan 2003 23:11:55 GMT
Server: Apache/1.3.3.7 (Unix) (Red-Hat/Linux)
ETag: "3f80f-1b6-3e1cb03b"
Accept-Ranges: bytes
Connection: close

<html><head><title>An Example Page</title></head>
<body>Hello World, this is a very simple HTML document.</body></html>
~~~


## Ejemplo de petición/respuesta

- Una línea en blanco separa las cabeceras del cuerpo del mensaje.
- El cuerpo del mensaje puede contener datos incompletos enviados en varias tandas si se usa la cabecera `Transfer-Encoding: chunked`.
- Las cabeceras contienen metadatos. El estándar define las cabeceras posibles como, por ejemplo, `Content-Type: application/json; charset=utf-8`.

## Identificación

- URLs recargadas con información de estado.
- Cookies: el servidor añade a su respuesta una cabecera como la siguiente y restringe la cookie a ciertos dominios:

~~~
Set-Cookie: session-id=12345ABC; username=juan
~~~

- El navegador añade al mensaje de la petición cuando se accede a dichos dominios una cabecera como

~~~
Cookie: session-id=12345ABC; username=juan
~~~

## Más características de HTTP

- Conexiones persistentes. En HTTP/1.0 era necesario crear una nueva conexión para cada petición, lo que introduce un retardo inicial elevado (debido al *handshaking*).
- En HTTP/1.1 aunque la conexión se mantiene viva y la latencia inicial se reduce, cada petición tiene que empezar cuando acabe la anterior. 
- En HTTP/1.1 la conexión se seguía produciendo mediante el patrón petición/respuesta, es decir, el servidor no puede enviar datos al cliente sin una petición explícita.

## Más características

- HTTP/2 y HTTP/3 sí permiten que el servidor envíe datos sin peticiones explícitas (*server push*), lo que acelera la descarga de los elementos de una página web, que empieza a producirse antes de que el navegador sepa que los necesita.
- HTTP/1 y HTTP/1.1 usan un formato de texto; desde HTTP/2 es binario.

## Más características de HTTP 

- Conexiones paralelas. HTTP/2 introduce *streams*, un mecanismo de multiplexación que permite varias peticiones y respuestas simultáneas (y mezcladas) sobre una misma conexión, lo que evita la necesidad de conexiones paralelas y la sobrecarga del sistema TCP, pero si hay error en un paquete correspondiente a una petición, los paquetes posteriores de otras peticiones quedan temporalmente bloqueados porque TCP no sabe que son de peticiones diferentes.

## Más características de HTTP

- HTTP/3 usa QUIC, un nuevo protocolo de transporte, que evita los problemas anteriores e introduce los *streams* como ciudadanos de primera clase.

## Más características de HTTP

- Autenticación. El cliente ha de enviar una contraseña. Normalmente se utiliza en conjunción con SSL.

## Más características de HTTP

- HTTPS (puerto 443). Comunicaciones seguras mediante el protocolo criptográfico Transport Layer Security (TLS) y su predecesor, Secure Sockets Layer (SSL); se usa el término SSL para referirse indistintamente a ambos. Son una capa intermedia entre HTTP y TCP, por lo que el paso de HTTP a HTTPS no supone esfuerzo para el desarrollador web, excepto porque es necesario que el servidor aporte un *certificado* aprobado por una autoridad certificadora.

## Más características de HTTP

- Caché. Puede estar en el navegador o en un proxy intermedio. El servidor puede usar cabeceras para indicar cuándo expira un cierto contenido y debe procederse a una *revalidación* con el servidor.

## Software para clientes

- El cliente puede ser un navegador (incluso un navegador *sin cabeza*) o cualquier otro tipo de programa.

## Software para clientes

- Un navegador está compuesto de:
    - interfaz de usuario
    - motor de *renderizado* (*layout/rendering/web engine*): Webkit para Safari; Blink para Chrome, Chromium, Edge u Opera; Gecko para Firefox
    - motor de JavaScript, habitualmente con compilación al vuelo (*just-in-time*): JavaScriptCore para Safari; V8 para Chrome, Chromium, Edge u Opera; SpiderMonkey para Firefox

## Software para clientes

- Más componentes de un navegador:

    - componentes de red
    - componentes de persistencia de datos
    - etc.

## Software para servidores

- Apache HTTP Server
- Node.js
- Internet Information Services
- Nginx
- Lighttpd
- Apache Tomcat
- Jetty
- WebSphere
- WebLogic
- etc.
