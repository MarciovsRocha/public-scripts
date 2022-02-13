#! /bin/bash

# TODO -c CheckRoot -t ARRUMAR
# função para verificar se o comando está sendo executado por
# usuário root
# check_root(){
#    if [ [ $EUID -ne 0 ] && ROOT ]; then
#        echo "This script must be run as root."
#        exit 1
#    fi
#}

# funcao para verificar se o diretório existe
# retorna 0 caso o diretorio exista
# retorna 1 caso o diretorio não exista
check_dir(){
    [ -d "$1" ] && return 0 || return 1
}

# funcao para verificar se o arquivo em questão existe
# retorna 0 caso o arquivo exista
# retorna 1 caso o arquivo não exista
check_file(){
    [ -f "$1" ] && return 0 || return 1
}

# TODO -c "Extrair dados de objeto JSON" -t TERMINAR
# funcao para extrair as variaveis passadas por parametro 
# do objeto json
extrair_json(){
    tags=()
    for tag in "$@"; do
        tags+=("$tag")
    done
}

# funcao para listar todos os devices aliases disponíveis 
# indicando quais ja estao montados
listar_blockdevices(){
    mapfile blockdevices <<< "$(lsblk -Pno NAME,TYPE | sed -n '/disk/p' | sed 's/NAME="//' | sed 's/" TYPE="disk"//')"
    for e in "${blockdevices[@]}" ; do
        echo "Blocdevice: $e"
    done
}

# funcao para remover todos espacos de uma string passada como parâmetro
# funcao para remover os espaços a direita
# exemplo:
#    trim "...   teste teste teste   ..."
#    retorno "...testetesteteste..."
trim(){
    if [ -n "$1" ] ; then 
        var="$1"
    else 
        echo "Não foram informados parametros suficientes para o procedimento (trim)"
        exit 1
    fi
    echo "$(tr -d '[:space:]' <<< "$var")"
}

# funcao para remover os espaços a direita
# exemplo:
#    rtrim "...   teste teste teste   ..."
#    retorno "...   teste teste teste..."
rtrim(){
    if [ -n "$1" ] ; then 
        var="$1"
    else 
        echo "Não foram informados parametros suficientes para o procedimento (rtrim)"
        exit 1
    fi
    echo "$(echo "$var" | sed -e 's/^[[:space:]]*//')"
}

# funcao para remover os espaços a esquerda
# funcao para remover os espaços a direita
# exemplo:
#    trim "...   teste teste teste   ..."
#    retorno "...teste teste teste  "
ltrim(){
    if [ -n "$1" ] ; then 
        var="$1"
    else 
        echo "Não foram informados parametros suficientes para o procedimento (ltrim)."
        exit 1
    fi
    echo "$(sed -e 's/[[:space:]]*$//' <<< "$var")"
}

# funcao para validar se o parametro passado eh um numero inteiro positivo
isnumber(){
    re='^[0-9]+$'
    if [[ $1 =~ $re ]]; then 
        return 0
    else
        return 1
    fi
}

#teste(){
#    jsonList=$(jq -r '.blockdevices'[] <<< $(lsblk -J))
#    echo $jsonList
#    for data in $jsonList; do
#        echo $data
#    done
#}

teste(){
    echo ""
}

