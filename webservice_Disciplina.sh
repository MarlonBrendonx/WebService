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
#				Bibliotecas
# ===================================================================================

source db_webservice.sh || { echo "Erro ao carregar o arquivo db_webservice"; exit 1;}




# ===================================================================================
#				Funções
# ===================================================================================

setDisciplina(){


	local nome="${POST%%&*}"
	local descricao="${POST##nome*&}"

		
	query="select *from Disciplina where nome='${nome#nome=}'"
	queryDatabase "$query"
	

	if [[ $( cat database_list.json | wc -l ) > 0 ]]
	then

	
		output "false" "A disciplina já está cadastrada" "null" 
		
	else
	 
		
		query="insert into Disciplina(nome,descricao) values('${nome#nome=}','${descricao#descricao=}')"
		queryDatabase "$query"
	
		(( "$?" == 0 )) && output "true" "Disciplina cadastrada!" "null" || \
		output "false" "Houve algum erro ao cadastrar a disciplina!" "null" 

		
	fi


}

getDisciplina(){

	
	query="SELECT JSON_ARRAYAGG(JSON_OBJECT('nome', w.nome, 'descricao', w.descricao))FROM Disciplina AS w;"	
	queryDatabase "$query"
	

}

delDisciplina(){

	local nome="${POST#nome=}"

	query="DELETE FROM Disciplina where nome='$nome';"

	queryDatabase "$query"

}

getDisciplinaPorNome(){


	local disciplina="${POST#disciplina=}"
	
	query="SELECT JSON_ARRAYAGG(JSON_OBJECT('nome', w.nome, 'id', w.id))FROM Disciplina AS w WHERE w.nome LIKE '%$disciplina%'"
	
	queryDatabase "$query"
	
	


}





