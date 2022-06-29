#!/bin/bash

function config {
	#echo "digite o nome do arquivo que deseja fazer backup: "
	#read arq_backup
	
	echo "o arquivo usada sera [ $arq_backup ]"
	
	echo "digite a a pasta onde ele se localiza: "
	read loca
	echo "ele se localiza na pasta [ $loca ] "

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
	echo "$user $pass $ipp save_backup"/"$arq_backup" >> config/configs.txt
	
	echo " Digite a pasta onde o backup do arquivo ficara: "
	echo "A pasta remota sera: $maquina_remotapast "
	mkdir $user$ipp
	nome=$user$ipp
	scp -r $user@$ipp:$loca /home/waffle/Documents/shelltrabalho-main/$nome
	date_format=$(date "+%d-%m-%Y")
	arquivo_final=$user-$date_format
	echo "comprimindo..." 
	zip -r $arquivo_final.zip $nome
	tt1=$(ls ./save_backup)
	echo "arquviso gerados:$tt1 "
	
	
	
	
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

echo "digite o quê você deseja fazer:  1)executar 2)sair 3)log  "
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
