#!/usr/bin/bash
set -e
cd "${GADGET}"
case "${1}" in
	start)
		if [ "${UDC}" == "auto" ]
		then	if _UDC="$(dmidecode -s system-serial-number)"
			then	echo "set udc to ${_UDC}"
				echo "${_UDC}" > UDC
			else	for i in /sys/class/udc/*
				do	[ -h "${i}" ]||continue
					_UDC="$(basename "$i")"||continue
					echo "set udc to ${_UDC}"
					echo "${_UDC}" > UDC
					exit
				done
			fi
		fi
	;;
	stop)
		echo "disable gadget"
		echo > UDC
	;;
esac
