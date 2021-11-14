BINS = keuze
PREFIX = /usr/local

.PHONY: all install bindir

all: $(addprefix build/Release/,$(BINS))

install: all bindir $(addprefix $(PREFIX)/bin/,$(BINS))

bindir:
	@install -m755 -d $(PREFIX)/bin

$(PREFIX)/bin/%: build/Release/%
	@echo " INSTALL" $@
	@install -m 755 $< $@

build/Release/keuze: .FORCE
	xcodebuild

.PHONY: .FORCE
.FORCE:
