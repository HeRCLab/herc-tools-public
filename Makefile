PREFIX=$(shell echo $$HOME)
BIN_PATH=$(PREFIX)/bin

install: python_binaries
	mkdir -p "$(BIN_PATH)"
	for f in ./bin/* ; do echo "copying $$f" ; cp "$$f" "$(BIN_PATH)" ; done

python_binaries:
	make -C python/

clean:
	make -C python/ clean
	rm -rf bin/
