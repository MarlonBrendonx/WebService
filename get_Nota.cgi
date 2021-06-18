#! /bin/env bash

#-------------------------HEADER----------------------------------------------------|
# AUTOR             : Marlon Brendo <marlonbrendo2013@gmail.com>
# DATA-DE-CRIAÇÃO   : 2021-1-12
# PROGRAMA          : Webservice 
# LICENÇA           : MIT
# DESCRIÇÃO 	    : Um simples webservice em Shell Bash
#
#-----------------------------------------------------------------------------------|

# ===================================================================================
#				Variáveis
# ===================================================================================

POST=$(sed -n '1p')

# ===================================================================================
#				Bibliotecas
# ===================================================================================


source webservice_Nota.sh || { echo "Erro ao carregar o arquivo webservice_Nota.sh"; exit 1;}

echo "Content-type: text/plain"
echo
echo

  	getNota
	tail -n +2 "$db_list" | jq "."


