#!/bin/bash

function config {

	#definir pasta onde sera feito o backup
	echo "---------------------------------------------------"
	echo "digite a pasta que deseja fazer o backup: "
	read loca
	echo "---------------------------------------------------"
	echo "ele se localiza na pasta [ $loca ] "
	#Ip
	echo "---------------------------------------------------"
	echo "Digite seu ip: "
	read ipp
	ping -c 1 $ipp
	echo "O ip selecionado foi: $ipp"
	echo "---------------------------------------------------"
	
	#senha
	echo "---------------------------------------------------"
	echo "Digite sua senha: "
	read -s pass
	echo " Não vacile! "
	echo "---------------------------------------------------"

	#user
	echo "---------------------------------------------------"
	echo "digite seu usuario: "
	read user
	echo "usuario $user configurado..."
	nome=$user$ipp
	mkdir $user$ipp
	echo "---------------------------------------------------"

	#definidor
	echo "---------------------------------------------------"
	echo "Arquivo Configs criadas"
	echo "$user $pass $ipp save_backup/$loca" >> config/configs.txt
	arb=$(pwd)
	echo "---------------------------------------------------"

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
	echo "-"
	echo "--"
	echo "---"
	echo "----"
	zip -r $arquivo_final.zip $nome
	sleep 4
	mv $arquivo_final.zip save_backup
	echo "---------------------------------------------------"
	echo "arquivo $arquivo_final movido."
	echo "---------------------------------------------------"
	ls -lh save_backup/
	sleep 2
	rm -rf $nome
	
	
	
	
}
function logfix { 
	dat=$(date "+%d-%m-%y")
	lag=$(ls ./save_backup)
	echo "$lag"
	echo "Mod: $lag " >> log.txt
}

function deub.o {
	echo "---------------------------------------------------"
	echo -e "Iae deu b.o em que? Caso deseje instalar as pastas digite 4 caso não escolha entre: \n1)Cria a pasta config \n2)Cria a pasta save_backup \n3)Arquivo log criado "
	echo "---------------------------------------------------"
	read b_o
	#Criar o config
	if [ $b_o -eq 1 ]; then
	echo "Arquivo sendo removido residual..."
	rm -rf config
	sleep 3
	echo "Arquivo config esta sendo criado..."
	mkdir config
	echo "Arquivo restaurado com sucessor"
	sleep 3
	#criar save_backup
	elif [ $b_o -eq 2 ]
	then
	echo "Arquivo sendo removido residual..."
	rm -rf save_backup
	sleep 3
	mkdir save_backup
	echo "Arquivo save_backup esta sendo criado..."
	sleep 3
	echo "Arquivo restaurado com sucessor"
	#criar log
	elif [ $b_o -eq 3 ]
	then
	echo "Arquivo sendo removido residual..."
	rm -f log.txt
	sleep 3
	touch log.txt
	echo "Arquivo log esta sendo criado..."
	sleep 3
	echo "Arquivo Criado com sucessor"
	#Instalador das pastas
	elif [ $b_o -eq 4 ]
	then
	echo "Construindo pastas padrão!"
	mkdir config
	echo "pasta config criada.."
	mkdir save_backup
	echo "pasta save_backup criada.."
	touch config.txt
	echo "arquivo config criado.."
	mv config.txt config
	echo "Arquivo log.txt criado"
	touch log.txt
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
