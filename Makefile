PREFIX=$(shell echo $$HOME)
BIN_DIR=$(PREFIX)/bin

INSTALL_TARGETS=$(shell ls ./bin/ | while read -r f ; do printf "$(BIN_DIR)/$$f " ; done)

info:
	@echo "PREFIX: $(PREFIX)"
	@echo "BIN_DIR; $(BIN_DIR)"
	@echo "INSTALL_TARGETS: $(INSTALL_TARGETS)"
	@echo "To install, run 'make install'"
	@echo "To install with a specific prefix: try make PREFIX=/some/prefix install"
	@echo "To uninstall, run 'make uninstall', setting prefix similarly to install"

install: $(INSTALL_TARGETS)
	@echo "Installation done."

$(BIN_DIR)/%: ./bin/%
	cp "$<" "$@"
	chmod +x "$@"

uninstall:
	for f in $(INSTALL_TARGETS) ; do rm -f "$$f" ; done
	@echo "Uninstallation done."
