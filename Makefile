compiler: src/parser.c
    gcc -g src/parser.c -o compiler

clean: 
	rm -rf *.o
