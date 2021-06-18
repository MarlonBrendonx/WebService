#! /bin/env bash

db_list="database_list.json"

# ===================================================================================
#				Operações 
# ===================================================================================



# Configurações sobre o banco de dados
declare -A db_config=(
 
		     [app_name]='Webservice' 
		     [url]='http://localhost/webservice/'
		     [database]='mydb'
		     [dbhost]='localhost' 
		     [dbuser]='userdb'
		     [dbpass]='123'
)



queryDatabase(){
	
	
	 mysql -u "${db_config[dbuser]}" \
	-p"${db_config[dbpass]}"        \
        -h "${db_config[dbhost]}"       \
	-D "${db_config[database]}"     \
        -e  "$1" > "$db_list"

	 

	 return "$?"
		
	

}

output(){


	json="$(printf '{"sucess":"%s","message":"%s","dados":"%s"}' "$1" "$2" "$3")"
	
	echo "$json" > output.json

}
