; EXTRN
extern	$printi
; EXTRN
extern	$println
; BSS
segment	.bss
; ALIGN
align	4
; LABEL
$x:
; BYTE
	resb	4
; TEXT
segment	.text
; TEXT
segment	.text
; ALIGN
align	4
; GLOBL
global	$_entry:function
; LABEL
$_entry:
; ENTER
	push	ebp
	mov	ebp, esp
	sub	esp, 4
; LABEL
$_c1:
; IMM
	push	dword 15
; CALL
	call	$printi
; TRASH
	add	esp, 4
; PUSH
	push	eax
; TRASH
	add	esp, 4
; CALL
	call	$println
; PUSH
	push	eax
; TRASH
	add	esp, 4
; ADDR
	push	dword $x
; LOAD
	pop	eax
	push	dword [eax]
; IMM
	push	dword 1
; ADD
	pop	eax
	add	dword [esp], eax
; COPY
	push	dword [esp]
; ADDR
	push	dword $x
; STORE
	pop	ecx
	pop	eax
	mov	[ecx], eax
; TRASH
	add	esp, 4
; ADDR
	push	dword $x
; LOAD
	pop	eax
	push	dword [eax]
; IMM
	push	dword 30
; JLT
	pop	eax
	pop	ecx
	cmp	ecx, eax
	jl	near $_c1
; LABEL
$_c2:
; IMM
	push	dword 0
; COPY
	push	dword [esp]
; LOCAL
	lea	eax, [ebp+-4]
	push	eax
; STORE
	pop	ecx
	pop	eax
	mov	[ecx], eax
; TRASH
	add	esp, 4
; LOCAL
	lea	eax, [ebp+-4]
	push	eax
; LOAD
	pop	eax
	push	dword [eax]
; POP
	pop	eax
; LEAVE
	leave
; RET
	ret
