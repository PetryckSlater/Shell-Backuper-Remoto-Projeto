#!/bin/bash

function config {
	echo "digite a pasta que deseja fazer backup: "
	read pasta_backup
	
	echo "A pasta usada sera [ $pasta_backup ]"
	

	echo "Digite seu ip: "
	read ipp
	ping -c 1 $ipp
	echo "O ip selecionado foi: $ipp"
	

	echo "Digite sua senha: "
	read -s pass
	echo " se a senha não pegar vai ter que colocar novamente em!: "
	

	echo "digite seu usuario: "
	read user
	echo "usuario $user configurado"

	touch configs.txt
	mkdir config
	mv configs.txt config
	echo "Arquivo Configs criadas"
	echo "$user $pass $ipp save_backup$pasta_backup" >> config/configs.txt
	
	echo " Digite o nome da maquina remota: "
	read maquina_remota
	rm -rf save_backup
	mkdir save_backup
	mkdir $maquina_remota
	scp -r $pasta_backup $user"@"$ipp":"$maquina_remota
	date_format=$(date "+%d-%m-%Y")
	arquivo_final="$maquina_remota-$date_format"
	echo "comprimindo..."
	zip -r $arquivo_final.zip $maquina_remota
	mv $arquivo_final.zip save_backup
	
	echo "Você deseja voltar para o main?y/n"
	read respost
	case $repost in
		"y")
			./main.sh
			;;
		"n")
			return 0
		;;
	esac


	
}
function logfix { 
	touch log.txt
	dat=$(date "+%d-%m-%y")
	lag=$(ls ./save_backup)
	echo "$lag"
	echo "Mod: $lag " >> log.txt
}	
function sair { 
	return 0 
}
echo "digite o quê você deseja fazer: '\n' 1)executar 2)sair 3)log  "
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
esac

