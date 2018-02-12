PY=pyinstaller
PYFLAGS=--specpath . --distpath ./dist --workpath ./build --onefile

../bin/herc-imgtool: herc-imgtool
	mkdir -p ../bin
	$(PY) $(PYFLAGS) ./herc-imgtool
	cp ./dist/herc-imgtool ../bin/

clean:
	rm -rf ./dist
	rm -rf ./build
	rm -f ./*.spec

