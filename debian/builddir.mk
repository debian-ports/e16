ifneq (build,$(notdir $(CURDIR)))

BDIR = $(CURDIR)/debian/build
DDIR = $(CURDIR)/debian/tmp
export CFGOPTS = $(CURDIR)/debian/config.mk

build: build-stamp
build-stamp: tarcopy
	$(MAKE) -f $(CURDIR)/Makefile -C $(BDIR) build
	touch $@

tarcopy: tarcopy-stamp
tarcopy-stamp:
	mkdir $(BDIR)
	tar cfX - debian/tar.exclude . | tar xvf - -C $(BDIR)
	touch $@

install:
	$(MAKE) -f $(CURDIR)/Makefile -C $(BDIR) install DESTDIR=$(DDIR)

clean:
	rm -rf Makefile $(BDIR)

%:
	echo "noop: $@"
	
else

include $(CFGOPTS)

build:
	autoreconf -fi
	./configure $(config_opts)
	$(MAKE)

install:
	$(MAKE) install

endif

.PHONY: tarcopy build install clean
