CASK = cask

SRCS = $(shell find .  -maxdepth 1 -name '*.el')
OBJECTS = $(SRCS:.el=.elc)

.PHONY: test compile clean install

.cask:
	cask install

$(OBJECTS): .cask
	$(CASK) install
	$(CASK) build

compile: $(OBJECTS)

clean-elc:
	rm -f $(OBJECTS)

clean: clean-elc
	rm -rf .cask/

test: $(OBJECTS)
	cask exec ert-runner -L $(PWD)
