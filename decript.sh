#!/bin/bash
echo "";

read -p "Pasta dos Arquivos: " arquivo; 
read -p "Password: " password;
sleep 2
 
echo "Descriptografando...";
sleep 0.5


password="$(echo ${password} | md5sum)";
for arquivo in $(ls -1 ${arquivo}"/"*.*); do
 
	source $arquivo;
	cripConteudo="$(echo -n ${conteudo} | base64 -d)";

	pass2="$(echo ${pass})";
 
	if [ "$(echo $pass2)" == "$(echo $password)" ];

	then 
		echo "${cripConteudo}" > "$arquivo";
		
		echo $cripConteudo > $arquivo;
		echo $arquivo "=> $( echo $arquivo | sed "s/.encrypted//")";
		mv $arquivo "$(echo $arquivo | sed "s/.encrypted//")";

		sleep 0.1
	else 
		echo "[+] Failed!";
	fi

done
 
 