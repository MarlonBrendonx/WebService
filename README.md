# WebService
> Simples WebService implementado em Shell Bash (CGI)

### Requisitos/Requirements :star:
* **jq**    >=1.5-1  <br/>  
* **Curl**  >=7.64      <br/>
* **MySQL** >=8.02.25 <br/>
* **Bash**  >= 5.0 <br/>
* **Apache**  >=2.4.38 <br/>


## Configurações:computer:
**\*Permita que o apache interprete o shell*** <br/>
**Adicione a seguinte linha em /etc/apache2/apache2.conf**
```bash
<Directory /var/www/cgi-bin>
        Options +ExecCGI
        AddHandler cgi-script .sh
</Directory>

ScriptAlias /cgi-bin/ /usr/lib/cgi-bin/

```
**Crie o diretório /cgi-bin em /usr/lib/ e clone os arquivos para dentro do diretório**

```bash
mkdir /usr/lib/cgi-bin
