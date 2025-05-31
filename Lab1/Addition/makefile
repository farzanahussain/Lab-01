all:
	gcc -o add add.c
	gcc -E add.c > add.i 
	gcc -S -masm=intel add.i
	as -o add.o add.s
	objdump -M intel -d add.o > add.dump
	gcc -c -o add.o add.c
	objdump -M intel -d add.o > add2.dump