# WebService
> Simples WebService implementado em Shell Bash (CGI)

### Requisitos/Requirements :star:
* **jq**    >=1.5-1  <br/>  
* **Curl**  >=7.64      <br/>
* **MySQL** >=8.02.25 <br/>
* **Bash**  >= 5.0 <br/>
* **Apache**  >=2.4.38 <br/>


## Configurações:computer:
**Permita que o apache interprete o shell**
```bash
Adicione a seguinte linha em /etc/apache2/apache2.conf

<Directory /var/www/cgi-bin>
        Options +ExecCGI
        AddHandler cgi-script .sh
</Directory>

Crie o diretório /cgi-bin em /usr/lib/

mkdir /usr/lib/cgi-bin
