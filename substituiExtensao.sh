#!/bin/bash

Principal() {
  clear
  read -p "Digite o diretório (desde a raiz) que tem os arquivos que deseja: " dirAlvo

  if [ -z "$dirAlvo" ]; then
    echo "Você não informou o nome!"; sleep 2
    Principal
  else
    if [ -d "$dirAlvo" ]; then
      cd "$dirAlvo" || { echo "Falha ao mudar para o diretório"; exit 1; }
      substituir
    else
      echo "Não é um diretório!"; sleep 2
      Principal
    fi
  fi
}

substituir() {
  read -p "Digite a extensão que deseja tirar e também a extensão que deseja colocar no lugar, respectivamente e sem ponto: " tirar colocar

  arquivos=0
  for arq in *."$tirar"; do
    mv "$arq" "${arq%.$tirar}.$colocar" && ((arquivos++))
  done

  if [[ $arquivos -gt 0 ]]; then
    echo "$arquivos arquivos renomeados com sucesso!"
  else
    echo "Nenhum arquivo encontrado com a extensão '$tirar'."
  fi
}

Principal
