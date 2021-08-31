MOD = simpledriver
KPATH :=../buildroot-2021.02.2/output/build/linux-custom
PWD :=$(shell pwd)
obj-m = $(MOD).o

all:
	$(MAKE) -C $(KPATH) M=$(PWD) modules

clean:
	$(MAKE) -C $(KPATH) M=$(PWD) clean

install:
	sudo cp $(MOD).ko /srv/nfs/raywat/nfsrootfs/modules/.

insmod: all
	sudo rmmod $(MOD).ko; true
	sudo insmod $(MOD).ko

log:
	tail -f /var/log/messages
