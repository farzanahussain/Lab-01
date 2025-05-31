all:
	gcc -o div div.c
	gcc -E div.c > div.i 
	gcc -S -masm=intel div.i
	as -o div.o div.s
	objdump -M intel -d div.o > div.dump
	gcc -c -o div.o div.c
	objdump -M intel -d div.o > div2.dump