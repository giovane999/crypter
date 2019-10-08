#!/bin/bash
 
echo "";
read -p "Pasta dos Arquivos: " arquivo;
read -p "Password: " password;
sleep 0.5

echo "";
echo "Criptografando...";
echo "";
sleep 1

for arquivo in $(ls -1 ${arquivo}"/"*.*); do
	 
	conteudo="$(cat $arquivo)";
	cripConteudo="$(echo ${conteudo} | base64 )";
	pass2="$(echo $password | md5sum)";

	echo $arquivo "=> $( echo $arquivo | awk -F. '{print $arquivo".encrypted"}' )";
	echo "conteudo='${cripConteudo}'; pass='${pass2}';" >> "$arquivo.encrypted";

	rm $arquivo;
	sleep 0.1
done

 