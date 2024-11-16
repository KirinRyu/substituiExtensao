#!/bin/bash
Principal() {
  if [ $# != 3 ]; then
    echo "Esse método deve ter três parâmetros, o primeiro é o diretório alvo, cujo os arquivos que deseja estão presentes;"
    echo "O segundo, deve ser a extensão (sem ponto) que deseja remover"
    echo "O terceiro, deve ser a extensão (sem ponto) da qual deseja que o seu arquivo receba"
    sleep 3; exit
  fi

  if [ -z "$1" ]; then
    echo "Você não informou o nome!"; sleep 2
    Principal "$1" "$2" "$3"
  else
    if [ -d "$1" ]; then
      cd "$1" || { echo "Falha ao mudar para o diretório"; exit 1; }
      arquivos=0
        for arq in *."$2"; do
          mv "$arq" "${arq%.$2}.$3" && ((arquivos++)) 
        done

        if [[ $arquivos -gt 0 ]]; then
          echo "$arquivos arquivos renomeados com sucesso!"
        else
          echo "Nenhum arquivo encontrado com a extensão $2."
        fi
    else
      echo "Não é um diretório!"; sleep 2
      Principal "$1" "$2" "$3"
    fi
  fi
}
Principal "$@"
