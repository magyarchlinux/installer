#
# Makefile for the PO files (translation) catalog
#
# $Id$

TOP	 = ..

# What is this package?
AYIPACKAGE	= ayi
POTFILE		= $(AYIPACKAGE).pot
INSTALL		= /usr/bin/install -c
INSTALL_DATA	= $(INSTALL) -m 644
INSTALL_DIR	= /usr/bin/install -d

INSTALL_AYI_DIR = ../lang


# PO catalog handling
MSGMERGE	= msgmerge -v
XGETTEXT	= /usr/bin/xgettext  -L Shell --keyword=EGETTEXT --keyword=GETTEXT --from-code=UTF-8 -o 
MSGFMT		= msgfmt --statistics --verbose

# What do we need to do
POFILES		= $(wildcard *.po)
MOFILES		= $(patsubst %.po,%.mo,$(POFILES))
SHELLSRC	= $(TOP)/ayi

all::update-po $(MOFILES)
	@rm -rf tmp


potfile: $(SHELLSRC) 
	$(XGETTEXT) $(AYIPACKAGE).po $(SHELLSRC) 
	@if cmp -s $(AYIPACKAGE).po $(POTFILE); then \
	    rm -f $(AYIPACKAGE).po; \
	else \
	    mv -f $(AYIPACKAGE).po $(POTFILE); \
	fi; \

update-po: Makefile potfile refresh-po

refresh-po: Makefile
	for cat in $(POFILES); do \
		lang=`basename $$cat .po`; \
		if $(MSGMERGE) $$lang.po $(POTFILE) > $$lang.pot ; then \
			mv -f $$lang.pot $$lang.po ; \
			echo "$(MSGMERGE) of $$lang succeeded" ; \
		else \
			echo "$(MSGMERGE) of $$lang failed" ; \
			rm -f $$lang.pot ; \
		fi \
	done


clean:
	@rm -fv *mo *~ .depend
	@rm -rf tmp

install: $(MOFILES)
	@for n in $(MOFILES); do \
	    l=`basename $$n .mo`; \
	    $(INSTALL_DIR) $(INSTALL_AYI_DIR)/$$l/LC_MESSAGES; \
	    $(INSTALL_DATA) --verbose $$n $(INSTALL_AYI_DIR)/$$l/LC_MESSAGES/$(AYIPACKAGE).mo; \
	done

%.mo: %.po
	$(MSGFMT) -o $@ $<

.PHONY: missing depend





