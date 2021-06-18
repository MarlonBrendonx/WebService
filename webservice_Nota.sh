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

setNota(){


	
	local id_aluno="${POST%%&id_dis*}"
	
	local id_disciplina="${POST#id_aluno*&}"
	local id_disciplina="${id_disciplina%%&ano*}"
	
	local ano="${POST%%&semestre*}"
	local ano="${ano##*&}"		

	local semestre="${POST%%&nota*}"
	local semestre="${semestre##*&}"

	local nota="${POST##*&}"
	
	
	
	query="insert into Cursa(Aluno_id,Disciplina_id,ano,semestre,nota) 
	values('${id_aluno#id_aluno=}','${id_disciplina#id_disciplina=}','${ano#ano=}','${semestre#semestre=}','${nota#nota=}');"

	queryDatabase "$query"

	(( "$?" == 0 )) && output "true" "Nota adicionada!" "null" || \
	output "false" "Houve algum erro ao adicionar a nota" "null" 

}


getNota(){


	query="SELECT JSON_ARRAYAGG(JSON_OBJECT('nome_aluno', a.nome, 'id_aluno', w.Aluno_id, 'nome_disciplina', d.nome,	\
	'id_disciplina', d.id, 'matricula', a.matricula, 'ano', w.ano, 'semestre',w.semestre,'nota',w.nota ))FROM Cursa w 	\
	JOIN Aluno a ON w.Aluno_id=a.id JOIN Disciplina d ON w.Disciplina_id=d.id; "


	queryDatabase "$query"

	
}

delNota(){


	local id_aluno="${POST%%&id_materia=*}"
	local id_materia="${POST%%&ano*}"
	local id_materia="${id_materia#id*&}"
	local ano="${POST%%&semestre*}"
	local ano="${ano##id_aluno*&}"
	local semestre="${POST##id_aluno*&}" 
	
	
	query="DELETE FROM Cursa where Aluno_id='${id_aluno#id_aluno=}' AND Disciplina_id='${id_materia#id_materia=}'
	AND ano='${ano#ano=}' AND semestre='${semestre#semestre=}' "


	queryDatabase "$query"

	(( "$?" == 0 )) && output "true" "Nota removida!" "null" || \
	output "false" "Houve algum erro ao remover a nota" "null" 

}











