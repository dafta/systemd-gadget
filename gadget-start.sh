#!/usr/bin/bash
set -e
cd "${GADGET}"
case "${1}" in
	start)
		echo "${UDC}" > UDC
	;;
	stop)
		echo "disable gadget"
		echo > UDC
	;;
esac
