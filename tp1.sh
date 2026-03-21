#!/bin/bash

export FILENAME="nombre_del_archivo"

# Función para crear el entorno
crear_entorno() {
  mkdir -p "$HOME/EPNro1/entrada"
  mkdir -p "$HOME/EPNro1/salida"
  mkdir -p "$HOME/EPNro1/procesado"
  cp consolidar.sh "$HOME/EPNro1/consolidar.sh"  #Como la consigna pide que consolidar.sh este en la carpeta EPNro1, lo copio alla
  echo "Entorno creado."
}

# Función para correr el proceso
correr_proceso() {
  nohup "$HOME/EPNro1/consolidar.sh" &
  echo "Proceso corriendo en background."
}

# Función para mostrar el listado de alumnos ordenados por número de padrón
mostrar_alumnos_ordenados() {
  if [ -f "$HOME/EPNro1/salida/$FILENAME.txt" ]; then
    sort -k1,1n "$HOME/EPNro1/salida/$FILENAME.txt"
  else
    echo "El archivo $FILENAME.txt no existe."
  fi
}

# Función para mostrar las 10 notas más altas
mostrar_notas_altas() {
  if [ -f "$HOME/EPNro1/salida/$FILENAME.txt" ]; then
    sort -k4,4nr "$HOME/EPNro1/salida/$FILENAME.txt" | head -n 10
  else
    echo "El archivo $FILENAME.txt no existe."
  fi
}

# Función para mostrar los datos de un nro de padrón específico
mostrar_datos_padron() {
  read -p "Ingrese el número de padrón: " padron
  if [ -f "$HOME/EPNro1/salida/$FILENAME.txt" ]; then
    grep "^$padron" "$HOME/EPNro1/salida/$FILENAME.txt"
  else
    echo "El archivo $FILENAME.txt no existe."
  fi
}

# Función para borrar el entorno y matar los procesos
borrar_entorno() {
  rm -rf "$HOME/EPNro1"
  pkill -f consolidar.sh
  echo "Entorno borrado y procesos terminados."
}

# Borrar entorno si se usa el parámetro -d
  if [ "$1" == "-d" ]; then
    borrar_entorno
    exit
  fi


# Menú principal
while true; do
  echo "Seleccione una opción:"
  echo "1) Crear entorno"
  echo "2) Correr proceso"
  echo "3) Mostrar alumnos ordenados por número de padrón"
  echo "4) Mostrar 10 notas más altas"
  echo "5) Mostrar datos por número de padrón"
  echo "6) Salir"
  read -p "Opción: " opcion

  case $opcion in
    1) crear_entorno ;;
    2) correr_proceso ;;
    3) mostrar_alumnos_ordenados ;;
    4) mostrar_notas_altas ;;
    5) mostrar_datos_padron ;;
    6) exit ;;
    *) echo "Opción inválida. Por favor, seleccione una opción válida." ;;
  esac


done
