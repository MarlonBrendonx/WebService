#! /bin/env bash

#-------------------------HEADER----------------------------------------------------|

# AUTOR             : Marlon Brendo <marlonbrendo2013@gmail.com>
# DATA-DE-CRIAÇÃO   : 2021-1-12
# PROGRAMA          : Webservice
# LICENÇA           : MIT
# DESCRIÇÃO 	    : Um simples webservice em Shell Bash
# GITHUB	    : https://github.com/MarlonBrendonx
#
#-----------------------------------------------------------------------------------|

# ===================================================================================
#				Variáveis
# ===================================================================================


# ===================================================================================
#				Bibliotecas
# ===================================================================================

source db_webservice.sh || { echo "Erro ao carregar o arquivo db_webservice"; exit 1;}




# ===================================================================================
#				Funções
# ===================================================================================

setAluno(){


	local nome="${POST%%&*}"
	local cpf="${POST%%&type*}"
	local cpf="${cpf##nome*&}"	
	local matricula="${POST%%&cpf=*}"
  	local matricula="${matricula##*&}"
	

	query="select *from Aluno where matricula='${matricula#matricula=}'"

	queryDatabase "$query"


	if [[ $(cat database_list.json | wc -l) > 0 ]]
	then

	
		output "false" "Aluno já está cadastrado" "null" 
		
	else
	 
		
		query="insert into Aluno(nome,matricula,cpf) values('${nome#nome=}','${matricula#matricula=}','${cpf#cpf=}')"
		queryDatabase "$query"
	
		(( "$?" == 0 )) && output "true" "Aluno cadastrado" "null" || \
		output "false" "Aluno não cadastrado" "null" 

		
	fi



}

getAluno(){

	
	query="SELECT JSON_ARRAYAGG(JSON_OBJECT('nome', w.nome, 'matricula', w.matricula, 'cpf',
	w.cpf)) FROM Aluno AS w;"
	
	queryDatabase "$query"
	
	

}

delAluno(){

	
	local matricula="${POST#matricula=}"
	
	query="delete from Aluno where matricula='$matricula'";
	queryDatabase "$query"

	(( "$?" == 0 )) &&  output "true" "Aluno removido!" "null" || \
	output "false" "Aluno não removido" "null"

}

getAlunoPorNome(){


	local aluno="${POST#aluno=}"
	
	
	query="SELECT JSON_ARRAYAGG(JSON_OBJECT('nome', w.nome, 'id', w.id , 'cpf',
	w.cpf)) FROM Aluno AS w WHERE w.nome LIKE '%$aluno%';"
	
	queryDatabase "$query"
	
	
}
