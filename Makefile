NEWS     = pkg/NEWS
PKGNAME := $(shell sed -n "s/Package: *\([^ ]*\)/\1/p" pkg/DESCRIPTION)
PKGVERS := $(shell sed -n "s/Version: *\([^ ]*\)/\1/p" pkg/DESCRIPTION)
PKGSRC  := $(shell basename `pwd`)

build:
	cd ..;\
	R CMD build $(PKGSRC)/pkg

install: build
	cd ..;\
	R CMD INSTALL $(PKGNAME)_$(PKGVERS).tar.gz

check: build
	cd ..;\
	R CMD check $(PKGNAME)_$(PKGVERS).tar.gz --as-cran
