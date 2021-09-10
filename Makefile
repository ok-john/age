SHELL := /bin/bash
OUT := bin
VERSION := v1.0.0+git
DESTDIR := ./
ARTIFACTS := age age-keygen
SUFFIX := cli
NAME := age-$(SUFFIX)

default :: build

setup ::
		$(shell mkdir -p $(OUT))

build :: setup
		go build -o "$(OUT)" -ldflags "-X main.Version=$(VERSION)" -trimpath ./cmd/...

rename :: build
		for n in $(ARTIFACTS); do mv $(OUT)/$$n $(OUT)/$$n-$(SUFFIX); done

install :: rename
		$(shell mv $(OUT)/* $(DESTDIR))

clean ::
		$(RM) $(NAME) $(OUT)
