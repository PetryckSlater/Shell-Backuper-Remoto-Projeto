#!/bin/bash

function config {
	#definir pasta onde sera feito o backup
	echo "digite a pasta que ele deseja fazer o backup: "
	read loca
	echo "ele se localiza na pasta [ $loca ] "
	#Ip
	echo "Digite seu ip: "
	read ipp
	ping -c 1 $ipp
	echo "O ip selecionado foi: $ipp"
	
	#senha
	echo "Digite sua senha: "
	read -s pass
	echo " Não vacile! "
	
	#user
	echo "digite seu usuario: "
	read user
	echo "usuario $user configurado..."
	nome=$user$ipp
	mkdir $user$ipp

	#definidor
	touch configs.txt
	mv configs.txt config
	echo "Arquivo Configs criadas"
	echo "$user $pass $ipp save_backup/$loca" >> config/configs.txt
	arb=$(pwd)
	#Enviar as paginas
	echo " Digite a pasta onde o backup do arquivo ficara: "
	echo "A pasta remota sera: $arb "
	scp -r $user@$ipp:$loca $arb/$nome
	echo "$arb/$nome"
	date_format=$(date "+%d-%m-%Y")
	arquivo_final=$user-$date_format
	#comprimidor
	sleep 5
	echo "comprimindo..." 
	zip -r $arquivo_final.zip $nome
	sleep 4
	mv $arquivo_final.zip save_backup
	
	
	
	
	
}
function logfix { 
	dat=$(date "+%d-%m-%y")
	lag=$(ls ./save_backup)
	echo "$lag"
	echo "Mod: $lag " >> log.txt
}

function deub.o {
	echo -e "Iae deu b.o em que? \n1)Cria a pasta config \n2)Cria a pasta save_backup \n3)Arquivo log criado "
	read b_o
	#Criar o config
	if [ $b_o -eq 1 ]; then
	echo "Arquivo config criado..."
	mkdir config
	echo "Arquivo Criado com sucessor"
	#criar save_backup
	elif [ $b_o -eq 2 ]
	then
	mkdir save_backup
	echo "Arquivo save_backup criado..."
	sleep 3
	echo "Arquivo Criado com sucessor"
	#criar log
	elif [ $b_o -eq 3 ]
	then
	touch log.txt
	echo "Arquivo log criado..."
	sleep 3
	echo "Arquivo Criado com sucessor"
	#sair
	else 
	return 0
	fi
}
function sair { 
	return 0 
}

echo -e "digite o quê você deseja fazer:  \n1)executar \n2)sair \n3)log \n4)fix das pastas  "
read inf
case $inf in
	"1")
		config
	;;
	"2")
		sair
	;;
	"3")
		logfix
	;;
	"4")
		deub.o
	;;
esac
