'use strict';

const express = require('express');
const app = express();

const CLIENT_ID= 'SUSTITUIR POR El CLIENT_ID OBTENIDO EN GOOGLE CLOUD!!!!!!';

const {OAuth2Client} = require('google-auth-library');
const oauth2Client = new OAuth2Client(CLIENT_ID);

var user= null;
var base= '/mensajes';

app.use(express.json());

async function verify(token) {
  const ticket = await oauth2Client.verifyIdToken({
      idToken: token,
      audience: CLIENT_ID, 
  });
  console.log("Ticket: "+JSON.stringify(ticket));
  const payload = ticket.getPayload();
  return payload;
}

// middleware que comprueba que el usuario está autenticado, antes de pasar el contro a la siguiente función:
app.use(base+'/*', async (req, res, next) => {
  let token = req.headers['authorization']; // 'authorization' porque Express convierte las cabeceras a minúsculas
  console.log(`Cabecera Authorization: ${req.headers.authorization.substr(0,40)}`);
  if (!token) {
    res.status(404).send({ result:null,error:'falta la cabecera authorization' });
    return;
  }
  if (token.startsWith('Bearer ')) {
    token = token.slice(7,token.length);
  }
  else {
    res.status(404).send({ result:null,error:'cabecera authorization mal formada' });
    return;
  }
  try {
    // valida el token enviado por el cliente:
    let payload= await verify(token);
    // extrae del token el id del usuario:
    user= payload['sub'];
    console.log(`Id asignado al usuario ${payload.email} por el middleware: ${payload['sub']}`);
    next();
  } catch (error) {
    res.status(404).send({ result:null,error:`error en la cabecera authorization: ${error}` });
    return;
  }
});

app.post(base+'/nuevomensaje', (req,res) => {
  if (!user) {
    res.status(404).send({ result:null,error:'usuario no autenticado' });
    return;
  }
  // se omite, pero aquí se realizaría cualquier procesamiento del texto del mensaje ligado al usuario
  // identificado (como, por ejemplo, insertarlo en una base de datos vinculada al usuario):
  // ...
  console.log(`Procesando mensaje '${req.body.texto}' para el usuario ${user}...`)
  res.status(200).send({ result:`procesando mensaje '${req.body.texto}' para el usuario ${user}`,error:null });
});

const path = require('path');
const publico = path.join(__dirname, 'public');
// __dirname: carpeta del proyecto

app.use('/', express.static(publico));

const PORT = process.env.PORT || 5000;
app.listen(PORT, function () {
  console.log(`Aplicación lanzada en el puerto ${ PORT }!`);
});
