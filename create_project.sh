#!/bin/bash 

verificar_parametros(){
    if -d "$f" ; then
        echo "A pasta especificada ('${f}') não existe."
        return 1
    fi
    if -z "$e" ; then
        echo "Extensão do arquivo principal não especificada."
        return 1
    fi
    if -z "$n" ; then
        echo "Nome do projeto não especificado."
        return 1
    fi
    return 0
}

# this script will create an initial folder and some files for projects
f="./"
while getopts "f:n:" flag; do 
    case "${flag}" in
        f) f="${OPTARG}" ;; # especifica a pasta em que será criado o repositório
        n) n="${OPTARG}" ;; # nome do projeto
        e) e="${OPTARG}" ;; # extensao do arquivo principal
    esac
done

if ! verificar_parametros ; then
    exit 1
fi

f="${f}/${n}"
echo "Criando pasta do projeto..."
mkdir "${f}" && echo "Criada pasta do projeto: '${f}/${n}'"

echo "Change directory to '${f}'"
cd "${f}"

echo "Searching files to create"
dependencias -t 'c' -f "/data/initial_files"

echo "Criando arquivos..."
touch "${n}.${e}" && echo "Criado arquivo: '${n}.${e}'"
while IFS= read -r file ; do
    touch "${file}" && echo "Criado arquivo: '${file}'" 
done < "./data/initial_files"
dependencias -t 'c' -f LICENCE

echo "Iniciando repositório GIT..."
git init