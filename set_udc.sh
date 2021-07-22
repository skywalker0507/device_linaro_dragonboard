#! /vendor/bin/sh

# This is the address of the udc device we're looking for
GADGET_ADDR=a600000

#Find the UDC node
UDC=`ls /sys/class/udc/ | grep GADGET_ADDR`

# Set the property
setprop sys.usb.controller "$UDC"
