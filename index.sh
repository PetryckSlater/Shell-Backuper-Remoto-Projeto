#!/bin/bash

function config {
	echo "digite a pasta que deseja fazer backup: "
	read pasta_backup
	
	echo "A pasta criada foi [ $pasta_backup ]"
	

	echo "Digite seu ip: "
	read ipp
	ping -c 1 $ipp
	echo "O ip selecionado foi: $ipp"
	

	echo "Digite tua senha vacilão: "
	read -s pass
	echo " se a senha não pegar vai ter que colocar novamente em!: "
	

	echo "digite seu usuario: "
	read user
	echo "usuario $user aceito"

	touch configs.txt
	mkdir config
	mv configs.txt config
	echo "Arquivo Configs criadas"
	echo "$user $pass $ipp $pasta_backup" >> config/configs.txt


}

function sair { 
	return 0 
}
echo "digite o quê você deseja configurar: \n 1)configurar 2)sair  "
read inf
case $inf in
	"1")
		config
	;;
	"2")
		sair
	;;
esac

