#!/bin/bash

function ler_config {
	./index.sh
}

function backups_quant {
	a=$(pwd ./save_backup)
	b=$(ls -a ./save_backup)
	echo "Os backups estão localizados em $a, e são $b. "
}

function sair {
	return 0
}
echo " Digite: 1)executar 2)Listar_backups 3)sair"
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
		
  	
