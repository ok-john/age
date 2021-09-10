SHELL := /bin/bash
NAME := "age"
VERSION := "v1.0+snap"
DESTDIR := ./

default:: build

build :: 
		$(MAKE) -C cmd/age

install :: build
		$(shell cp cmd/age/age $(DESTDIR) && chmod 755 age)
		
send ::
		cd .. && tar cf $(NAME).$(VERSION).tar.xz $(NAME)/ && wormhole send $(NAME).$(VERSION).tar.xz   

