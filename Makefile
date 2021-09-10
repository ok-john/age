SHELL := /bin/bash
TARGETDIR := cmd/age
NAME := age-cli
VERSION := v1.0+snap
DESTDIR := ./

default :: install

build ::
	$(MAKE) -C $(TARGETDIR)

install :: build
    $(shell cp $(TARGETDIR)/$(NAME) $(DESTDIR))

clean ::
	$(RM) $(NAME)