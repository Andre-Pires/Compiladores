; EXTRN
extern	$printi
; EXTRN
extern	$println
; EXTRN
extern	$readi
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
; CALL
	call	$readi
; PUSH
	push	eax
; IMM
	push	dword 12
; ADD
	pop	eax
	add	dword [esp], eax
; CALL
	call	$printi
; TRASH
	add	esp, 8
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
; LOCAL
	lea	eax, [ebp+-4]
	push	eax
; COPY
	push	dword [esp]
; IMM
	push	dword 0
; SWAP
	pop	eax
	pop	ecx
	push	eax
	mov	eax, ecx
	push	eax
; STORE
	pop	ecx
	pop	eax
	mov	[ecx], eax
; TRASH
	add	esp, 4
; LEAVE
	leave
; RET
	ret
