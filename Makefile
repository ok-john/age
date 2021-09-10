SHELL := /bin/bash
OUT := bin
VERSION := v1.0.0+git
ARTIFACTS := age age-keygen
SUFFIX := cli
# DESTDIR gets set by the snapcraft build process.
# The value you here will be used for local builds.
DESTDIR := ./

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
		$(RM) $(OUT)
