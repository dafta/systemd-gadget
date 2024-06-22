#!/usr/bin/bash
set -e
case "${1}" in
	bind)
		echo -n "0000:04:00.3" > /sys/bus/pci/drivers/xhci_hcd/unbind
		echo -n "0000:04:00.3" > /sys/bus/pci/drivers/dwc3-pci/bind
	;;
	unbind)
		echo -n "0000:04:00.3" > /sys/bus/pci/drivers/dwc3-pci/unbind
		echo -n "0000:04:00.3" > /sys/bus/pci/drivers/xhci_hcd/bind
	;;
esac
