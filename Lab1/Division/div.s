	.file	"div.c"
	.intel_syntax noprefix
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC0:
	.ascii "Enter two numbers: \0"
LC1:
	.ascii "%f %f\0"
LC3:
	.ascii "Quotient = %.2f\12\0"
	.align 4
LC4:
	.ascii "Error: Division by zero is not allowed.\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB10:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	and	esp, -16
	sub	esp, 32
	call	___main
	mov	DWORD PTR [esp], OFFSET FLAT:LC0
	call	_printf
	lea	eax, [esp+20]
	mov	DWORD PTR [esp+8], eax
	lea	eax, [esp+24]
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:LC1
	call	_scanf
	fld	DWORD PTR [esp+20]
	fldz
	fucomp	st(1)
	fnstsw	ax
	sahf
	jp	L8
	fldz
	fucompp
	fnstsw	ax
	sahf
	je	L7
	jmp	L6
L8:
	fstp	st(0)
L6:
	fld	DWORD PTR [esp+24]
	fld	DWORD PTR [esp+20]
	fdivp	st(1), st
	fstp	DWORD PTR [esp+28]
	fld	DWORD PTR [esp+28]
	fstp	QWORD PTR [esp+4]
	mov	DWORD PTR [esp], OFFSET FLAT:LC3
	call	_printf
	jmp	L4
L7:
	mov	DWORD PTR [esp], OFFSET FLAT:LC4
	call	_puts
L4:
	mov	eax, 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE10:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
