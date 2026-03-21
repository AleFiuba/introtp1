#!/bin/bash


# Verificar si la carpeta EPNro1 existe
if [ ! -d "$HOME/EPNro1" ]; then
  echo "El directorio EPNro1 no existe."
  exit 1
fi

# Verificar si la carpeta entrada existe
if [ ! -d "$HOME/EPNro1/entrada" ]; then
  echo "La carpeta entrada no existe."
  exit 1
fi

# Verificar si la carpeta salida existe
if [ ! -d "$HOME/EPNro1/salida" ]; then
  echo "La carpeta salida no existe."
  exit 1
fi

# Verificar si la carpeta procesado existe
if [ ! -d "$HOME/EPNro1/procesado" ]; then
  echo "La carpeta procesado no existe."
  exit 1
fi

# Verificar si la variable FILENAME está definida
if [ -z "$FILENAME" ]; then
  echo "La variable FILENAME no está definida."
  exit 1
fi

# Procesar archivos de entrada

for archivo in "$HOME/EPNro1/entrada"/*.txt; do
  if [ -f "$archivo" ]; then
    cat "$archivo" >> "$HOME/EPNro1/salida/$FILENAME.txt"
    mv "$archivo" "$HOME/EPNro1/procesado"
  fi
done
