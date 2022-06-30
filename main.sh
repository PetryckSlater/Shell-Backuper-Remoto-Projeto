#!/bin/bash

function ler_config {
	./index.sh
}

function backups_quant {
	a=$(pwd ./save_backup)
	b=$(ls -lh ./save_backup)
	echo -e "Os backups estão localizados em $a, e são \n$b. "
}

function sair {
	return 0
}
echo -e " Digite: 1)executar \n2)Listar backups 3)sair"
echo "-------------------------------------------------"
read r
case $r in
	"1")
		ler_config
	;;
	"2")
		backups_quant
	;;
	"3")
		sair
	;;
esac
		
  	
