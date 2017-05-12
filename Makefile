obj-$(CONFIG_ALX) += alx.o
alx-objs := main.o ethtool.o hw.o

ifneq ($(KERNELRELEASE),)
KVER = $(KERNELRELEASE)
else
KVER = $(shell uname -r)
endif

PWD := $(shell pwd)
KDIR := /lib/modules/$(KVER)/build

all:
	$(MAKE) -C $(KDIR) M=$(PWD) modules

install:
	$(MAKE) -C $(KDIR) M=$(PWD) modules_install

clean:
	$(MAKE) -C $(KDIR) M=$(PWD) clean
