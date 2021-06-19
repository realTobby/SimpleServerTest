

CXX := g++

all: simpleservertest

%.o: src/%.cpp
	$(CXX) -c $< -o $@

%.o: src/%.hpp
	$(CXX) -c $< -o $@

simpleservertest: Server/main.o Client/main.o
	echo "** Building App..."
	$(CXX) -o Server/simpleservertest Server/main.o
	$(CXX) -o Client/simpleclienttest Client/main.o



clean:
	@echo "** Removing object files and executable..."
	rm -f Server/simpleservertest
	rm -f Server/simpleservertest.exe
	rm -f Server/*.o

	rm -f Client/simpleclienttest
	rm -f Client/simpleclienttest.exe
	rm -f Client/*.o



install:
	@echo '** Installing...'
	cp Server/simpleservertest /usr/bin/
	cp Client/simpleclienttest /usr/bin/

uninstall:
	@echo '** Uninstalling...'
	$(RM) /usr/bin/simpleservertest
	$(RM) /usr/bin/simpleclienttest
