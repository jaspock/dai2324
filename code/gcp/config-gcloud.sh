#!/bin/bash

# Pon en la variable ESTUDIANTE tu cuenta de gcloud.
# No pongas espacios en blanco innecesarios.
ESTUDIANTE=abc999@gcloud.ua.es

# Pon en la variable PROFESOR la cuenta gcloud.ua.es del profesor.
PROFESOR=cuenta_del_profesor@gcloud.ua.es

# Pon en la variable USRGCP la cuenta en la que hayas canjeado los créditos educativos.
# Lo habitual es que sea la misma que la de la variable ESTUDIANTE.
USRGCP=abc999@gcloud.ua.es

# - - - - - - - - - - - - - - - - - - - - - - - - - -

ESTUDIANTE_ID=`echo "$ESTUDIANTE" | cut -d@ -f1`

if [ "$ESTUDIANTE_ID" = "abc999" ]; then
    echo "Cambia el valor de la variable ESTUDIANTE del script y vuelve a ejecutarlo."
    exit
fi

if [ "$PROFESOR" = "cuenta_del_profesor@gcloud.ua.es" ]; then
    echo "Cambia el valor de la variable PROFESOR del script y vuelve a ejecutarlo."
    exit
fi

if [ "$USRGCP" = "abc999@gcloud.ua.es" ]; then
    echo "Cambia el valor de la variable USRGCP del script y vuelve a ejecutarlo."
    exit
fi


CHAR6=`echo $RANDOM | md5sum | head -c 8`  # cadena aleatoria de longitud 8
CURSO=dai2223
PROYECTO=$CURSO-$ESTUDIANTE_ID-$CHAR6

echo "Creando el proyecto en GCP..."
gcloud alpha projects create $PROYECTO --name=$PROYECTO -q

echo "Lista de proyectos:"
gcloud alpha projects list|tail -n +2

echo "Incorporando al profesor al proyecto..."
gcloud projects add-iam-policy-binding $PROYECTO --member="user:$PROFESOR" --role="roles/owner"

echo "Dando permisos al estudiante para que pueda permitir a allUsers invocar las funciones de Cloud Functions..."
gcloud projects add-iam-policy-binding $PROYECTO --member="user:$USRGCP" --role="roles/cloudfunctions.admin"

echo "Creando la app de Google App Engine (normalmente puedes ignorar el warning, si lo hay)..."
gcloud app create --region=europe-west3 --project=$PROYECTO

echo "Obteniendo la cuenta educativa..."
CUENTA=`gcloud alpha billing accounts list | sed '2q;d' | head -c 20`

echo "Asociando el proyecto a la cuenta educativa $CUENTA..."
gcloud alpha billing projects link $PROYECTO --billing-account=$CUENTA

# echo "Proyectos ligados a la cuenta $CUENTA:"
# gcloud beta billing projects list --billing-account=$CUENTA

echo "Configurando el proyecto por defecto..."
gcloud config set project $PROYECTO

echo
echo "Si deseas borrar el proyecto, ejecuta: gcloud projects delete $PROYECTO"
echo "Solo tienes que ejecutar este script una vez, salvo que hayas obtenido un error, ya que solo tienes que tener un proyecto en GCP."

echo "El proyecto '$PROYECTO' ha sido creado y vinculado a la cuenta educativa $CUENTA."
