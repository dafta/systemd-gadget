#!/usr/bin/bash

service_files=(
	gadget-init.service
	gadget-start.service
	umtprd.service
	usbgadget-func-acm.service
	usbgadget-func-adb-post.service
	usbgadget-func-adb-pre.service
	usbgadget-func-ecm.service
	usbgadget-func-eem.service
	usbgadget-func-geth.service
	usbgadget-func-gser.service
	usbgadget-func-hid.service
	usbgadget-func-mass@.service
	usbgadget-func-midi.service
	usbgadget-func-mtp.service
	usbgadget-func-ncm.service
	usbgadget-func-obex.service
	usbgadget-func-phonet.service
	usbgadget-func-printer.service
	usbgadget-func-rndis.service
	usbgadget-func-tcm.service
	usbgadget-func-uac1.service
	usbgadget-func-uac2.service
	usbgadget-func-uvc.service
)

scripts=(
	gadget-init.sh
	gadget-start.sh
)

config=gadget

case "${1}" in
	install)
		# Copy service files
		for file in "${service_files[@]}"; do
			cp -v "${file}" /etc/systemd/system/
		done

		# Copy scripts
		mkdir -p -v /etc/systemd/scripts/
		for file in "${scripts[@]}"; do
			cp -v "${file}" /etc/systemd/scripts/
		done

		# Copy config
		cp -v "${config}" /etc/default/
	;;
	uninstall)
		# Delete services
		for file in "${service_files[@]}"; do
			rm -v "/etc/systemd/system/${file}"
		done

		# Delete scripts
		for file in "${scripts[@]}"; do
			rm -v "/etc/systemd/scripts/${file}"
		done
		rmdir -v --ignore-fail-on-non-empty /etc/systemd/scripts/

		# Delete config
		rm -v "/etc/default/${config}"
	;;
	*)
		echo "Usage: $0 install|uninstall"
	;;
esac
