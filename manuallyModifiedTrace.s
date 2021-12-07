	.file	"traced_ifthenelse.cpp"
	.text
	.globl	var2
	.bss
	.align 32
	.type	var2, @object
	.size	var2, 16000000
var2:
	.zero	16000000
	.globl	var3
	.align 32
	.type	var3, @object
	.size	var3, 16000000
var3:
	.zero	16000000
	.globl	var10
	.align 32
	.type	var10, @object
	.size	var10, 16000000
var10:
	.zero	16000000
	.globl	var11
	.align 32
	.type	var11, @object
	.size	var11, 16000000
var11:
	.zero	16000000
	.globl	key
	.align 2
	.type	key, @object
	.size	key, 2
key:
	.zero	2
	.globl	HR
	.align 4
	.type	HR, @object
	.size	HR, 4
HR:
	.zero	4
	.globl	mask_HR
	.data
	.align 4
	.type	mask_HR, @object
	.size	mask_HR, 4
mask_HR:
	.long	15
	.globl	PHT
	.bss
	.align 32
	.type	PHT, @object
	.size	PHT, 32
PHT:
	.zero	32
	.globl	coeff
	.type	coeff, @object
	.size	coeff, 2
coeff:
	.zero	2
	.text
	.globl	_Z9predictorPv
	.type	_Z9predictorPv, @function
_Z9predictorPv:
.LFB4221:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L2
.L3:
	movl	-8(%rbp), %eax
	cltq
	leaq	(%rax,%rax), %rdx
	leaq	PHT(%rip), %rax
	movw	$0, (%rdx,%rax)
	addl	$1, -8(%rbp)
.L2:
	cmpl	$15, -8(%rbp)
	jle	.L3
	movl	$0, -4(%rbp)
	jmp	.L4
.L5:
	movl	-4(%rbp), %eax
	cltq
	leaq	coeff(%rip), %rdx
	movb	$1, (%rax,%rdx)
	addl	$1, -4(%rbp)
.L4:
	cmpl	$1, -4(%rbp)
	jle	.L5
.L7:
	movl	HR(%rip), %edx
	movl	mask_HR(%rip), %eax
	andl	%edx, %eax
	movl	%eax, %eax
	leaq	(%rax,%rax), %rdx
	leaq	PHT(%rip), %rax
	movzwl	(%rdx,%rax), %eax
	movw	%ax, key(%rip)
	movl	HR(%rip), %eax
	sall	$2, %eax
	movl	%eax, HR(%rip)
	movzwl	key(%rip), %eax
	movswl	%ax, %edx
	movl	HR(%rip), %eax
	addl	%edx, %eax
	movl	%eax, HR(%rip)
	nop
.L6:
	movzwl	key(%rip), %eax
	notl	%eax
	shrw	$15, %ax
	testb	%al, %al
	jne	.L6
	jmp	.L7
	.cfi_endproc
.LFE4221:
	.size	_Z9predictorPv, .-_Z9predictorPv
	.section	.rodata
.LC1:
	.string	"EXEC time: %.8f \n"
	.align 8
.LC2:
	.string	"\n\n\n****\nCurrent state: %lld %lld %lld %lld\n****\ntr1: %d; tr2: %d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB4222:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	addq	$-128, %rsp
	movl	%edi, -116(%rbp)
	movq	%rsi, -128(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -64(%rbp)
	movq	$0, -56(%rbp)
	movq	$0, -48(%rbp)
	movq	$0, -40(%rbp)
	cmpl	$5, -116(%rbp)
	jne	.L9
	movq	-128(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	cltq
	movq	%rax, -64(%rbp)
	movq	-128(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	cltq
	movq	%rax, -56(%rbp)
	movq	-128(%rbp), %rax
	addq	$24, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	cltq
	movq	%rax, -48(%rbp)
	movq	-128(%rbp), %rax
	addq	$32, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	cltq
	movq	%rax, -40(%rbp)
.L9:
	movl	$0, %edi
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
	movl	$0, -100(%rbp)
	jmp	.L10
.L11:
	call	rand@PLT
	movslq	%eax, %rdx
	imulq	$274877907, %rdx, %rdx
	shrq	$32, %rdx
	sarl	$5, %edx
	movl	%eax, %ecx
	sarl	$31, %ecx
	subl	%ecx, %edx
	imull	$500, %edx, %ecx
	subl	%ecx, %eax
	movl	%eax, %edx
	movslq	%edx, %rax
	movl	-100(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rcx
	leaq	var2(%rip), %rdx
	movq	%rax, (%rcx,%rdx)
	call	rand@PLT
	movslq	%eax, %rdx
	imulq	$274877907, %rdx, %rdx
	shrq	$32, %rdx
	sarl	$5, %edx
	movl	%eax, %ecx
	sarl	$31, %ecx
	subl	%ecx, %edx
	imull	$500, %edx, %ecx
	subl	%ecx, %eax
	movl	%eax, %edx
	movslq	%edx, %rax
	movl	-100(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rcx
	leaq	var3(%rip), %rdx
	movq	%rax, (%rcx,%rdx)
	call	rand@PLT
	movslq	%eax, %rdx
	imulq	$274877907, %rdx, %rdx
	shrq	$32, %rdx
	sarl	$5, %edx
	movl	%eax, %ecx
	sarl	$31, %ecx
	subl	%ecx, %edx
	imull	$500, %edx, %ecx
	subl	%ecx, %eax
	movl	%eax, %edx
	movslq	%edx, %rax
	movl	-100(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rcx
	leaq	var10(%rip), %rdx
	movq	%rax, (%rcx,%rdx)
	call	rand@PLT
	movslq	%eax, %rdx
	imulq	$274877907, %rdx, %rdx
	shrq	$32, %rdx
	sarl	$5, %edx
	movl	%eax, %ecx
	sarl	$31, %ecx
	subl	%ecx, %edx
	imull	$500, %edx, %ecx
	subl	%ecx, %eax
	movl	%eax, %edx
	movslq	%edx, %rax
	movl	-100(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rcx
	leaq	var11(%rip), %rdx
	movq	%rax, (%rcx,%rdx)
	addl	$1, -100(%rbp)
.L10:
	cmpl	$1999999, -100(%rbp)
	jle	.L11
	movl	$0, -96(%rbp)
	movl	$0, -92(%rbp)
	movl	$0, -88(%rbp)
	leaq	-72(%rbp), %rax
	movl	$0, %ecx
	leaq	_Z9predictorPv(%rip), %rdx
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_create@PLT
	movl	$0, -76(%rbp)
	call	clock@PLT
	movq	%rax, -32(%rbp)
	movl	$0, -84(%rbp)
	jmp	.L12
.L37:
	movl	$0, -80(%rbp)
	jmp	.L13
.L36:
	nop
.L14:
	movzwl	key(%rip), %eax
	shrw	$15, %ax
	testb	%al, %al
	jne	.L14
	movzwq	key(%rip), %rax
	jmp 	*trace_tbl(,%rax,8)
        .section        .rodata
trace_tbl:
        .quad           .TRACE1
        .quad           .TRACE2
        .section        .text

.TRACE1:
.L15:
	movl	$-1, %eax
	xbegin	.L16
.L16:
	nop
	movl	%eax, -76(%rbp)
	cmpl	$-1, -76(%rbp)
	jne	.L18
	movl	-80(%rbp), %edx
	movslq	%edx, %rax
	imulq	$-1840700269, %rax, %rax
	shrq	$32, %rax
	addl	%edx, %eax
	sarl	$2, %eax
	movl	%edx, %ecx
	sarl	$31, %ecx
	subl	%ecx, %eax
	movl	%eax, %ecx
	sall	$3, %ecx
	subl	%eax, %ecx
	movl	%edx, %eax
	subl	%ecx, %eax
	testl	%eax, %eax
	jne	.L19
	xabort	$1
.L19:
	movl	-80(%rbp), %edx
	movl	-84(%rbp), %eax
	leal	(%rdx,%rax), %esi
	movl	-80(%rbp), %eax
	movslq	%eax, %rdx
	imulq	$-1840700269, %rdx, %rdx
	shrq	$32, %rdx
	addl	%eax, %edx
	sarl	$2, %edx
	movl	%eax, %ecx
	sarl	$31, %ecx
	subl	%ecx, %edx
	movl	%edx, %ecx
	sall	$3, %ecx
	subl	%edx, %ecx
	subl	%ecx, %eax
	movl	%eax, %edx
	movslq	%esi, %rax
	leaq	0(,%rax,8), %rcx
	leaq	var3(%rip), %rax
	movq	(%rcx,%rax), %rax
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rcx
	leaq	var2(%rip), %rdx
	movq	%rax, (%rcx,%rdx)
	movl	-80(%rbp), %eax
	movslq	%eax, %rdx
	imulq	$-1840700269, %rdx, %rdx
	shrq	$32, %rdx
	addl	%eax, %edx
	sarl	$2, %edx
	sarl	$31, %eax
	movl	%eax, %ecx
	movl	%edx, %eax
	subl	%ecx, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	var3(%rip), %rax
	movq	$2, (%rdx,%rax)
	movl	-80(%rbp), %eax
	movslq	%eax, %rdx
	imulq	$-1840700269, %rdx, %rdx
	shrq	$32, %rdx
	addl	%eax, %edx
	sarl	$2, %edx
	sarl	$31, %eax
	movl	%edx, %esi
	subl	%eax, %esi
	movslq	%esi, %rax
	leaq	0(,%rax,8), %rdx
	leaq	var10(%rip), %rax
	movq	(%rdx,%rax), %rdi
	movl	-80(%rbp), %eax
	movslq	%eax, %rdx
	imulq	$-1840700269, %rdx, %rdx
	shrq	$32, %rdx
	addl	%eax, %edx
	sarl	$2, %edx
	movl	%eax, %ecx
	sarl	$31, %ecx
	subl	%ecx, %edx
	movl	%edx, %ecx
	sall	$3, %ecx
	subl	%edx, %ecx
	subl	%ecx, %eax
	movl	%eax, %edx
	movslq	%edx, %rax
	leaq	0(,%rax,8), %rdx
	leaq	var3(%rip), %rax
	movq	(%rdx,%rax), %rax
	leaq	(%rdi,%rax), %rcx
	movslq	%esi, %rax
	leaq	0(,%rax,8), %rdx
	leaq	var10(%rip), %rax
	movq	%rcx, (%rdx,%rax)
	movl	-80(%rbp), %edx
	movl	-84(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	leaq	0(,%rdx,8), %rcx
	leaq	var11(%rip), %rdx
	movq	(%rcx,%rdx), %rdx
	leaq	1(%rdx), %rcx
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	var11(%rip), %rax
	movq	%rcx, (%rdx,%rax)
	xend
	jmp	.L20
.L18:
	movw	$0, -104(%rbp)
	movl	-80(%rbp), %edx
	movslq	%edx, %rax
	imulq	$-1840700269, %rax, %rax
	shrq	$32, %rax
	addl	%edx, %eax
	sarl	$2, %eax
	movl	%edx, %ecx
	sarl	$31, %ecx
	subl	%ecx, %eax
	movl	%eax, %ecx
	sall	$3, %ecx
	subl	%eax, %ecx
	movl	%edx, %eax
	subl	%ecx, %eax
	testl	%eax, %eax
	jne	.L21
	movw	$1, -104(%rbp)
	movl	-80(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	var3(%rip), %rax
	movq	(%rdx,%rax), %rcx
	movl	-80(%rbp), %edx
	movl	-84(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	var2(%rip), %rax
	movq	(%rdx,%rax), %rax
	addq	%rax, %rcx
	movl	-80(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	var3(%rip), %rax
	movq	%rcx, (%rdx,%rax)
	movl	-80(%rbp), %eax
	movslq	%eax, %rdx
	imulq	$-1840700269, %rdx, %rdx
	shrq	$32, %rdx
	addl	%eax, %edx
	sarl	$2, %edx
	sarl	$31, %eax
	movl	%eax, %ecx
	movl	%edx, %eax
	subl	%ecx, %eax
	movslq	%eax, %rdx
	leaq	0(,%rdx,8), %rcx
	leaq	var2(%rip), %rdx
	movq	(%rcx,%rdx), %rdx
	movl	-80(%rbp), %esi
	movl	-84(%rbp), %ecx
	addl	%esi, %ecx
	movslq	%ecx, %rcx
	leaq	0(,%rcx,8), %rsi
	leaq	var11(%rip), %rcx
	movq	(%rsi,%rcx), %rsi
	movq	%rdx, %rcx
	subq	%rsi, %rcx
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	var2(%rip), %rax
	movq	%rcx, (%rdx,%rax)
	jmp	.L22
.L21:
	movw	$0, -104(%rbp)
	movl	-80(%rbp), %edx
	movl	-84(%rbp), %eax
	leal	(%rdx,%rax), %esi
	movl	-80(%rbp), %eax
	movslq	%eax, %rdx
	imulq	$-1840700269, %rdx, %rdx
	shrq	$32, %rdx
	addl	%eax, %edx
	sarl	$2, %edx
	movl	%eax, %ecx
	sarl	$31, %ecx
	subl	%ecx, %edx
	movl	%edx, %ecx
	sall	$3, %ecx
	subl	%edx, %ecx
	subl	%ecx, %eax
	movl	%eax, %edx
	movslq	%esi, %rax
	leaq	0(,%rax,8), %rcx
	leaq	var3(%rip), %rax
	movq	(%rcx,%rax), %rax
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rcx
	leaq	var2(%rip), %rdx
	movq	%rax, (%rcx,%rdx)
	movl	-80(%rbp), %eax
	movslq	%eax, %rdx
	imulq	$-1840700269, %rdx, %rdx
	shrq	$32, %rdx
	addl	%eax, %edx
	sarl	$2, %edx
	sarl	$31, %eax
	movl	%eax, %ecx
	movl	%edx, %eax
	subl	%ecx, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	var3(%rip), %rax
	movq	$2, (%rdx,%rax)
.L22:
	movl	-80(%rbp), %eax
	movslq	%eax, %rdx
	imulq	$-1840700269, %rdx, %rdx
	shrq	$32, %rdx
	addl	%eax, %edx
	sarl	$2, %edx
	sarl	$31, %eax
	movl	%edx, %esi
	subl	%eax, %esi
	movslq	%esi, %rax
	leaq	0(,%rax,8), %rdx
	leaq	var10(%rip), %rax
	movq	(%rdx,%rax), %rdi
	movl	-80(%rbp), %eax
	movslq	%eax, %rdx
	imulq	$-1840700269, %rdx, %rdx
	shrq	$32, %rdx
	addl	%eax, %edx
	sarl	$2, %edx
	movl	%eax, %ecx
	sarl	$31, %ecx
	subl	%ecx, %edx
	movl	%edx, %ecx
	sall	$3, %ecx
	subl	%edx, %ecx
	subl	%ecx, %eax
	movl	%eax, %edx
	movslq	%edx, %rax
	leaq	0(,%rax,8), %rdx
	leaq	var3(%rip), %rax
	movq	(%rdx,%rax), %rax
	leaq	(%rdi,%rax), %rcx
	movslq	%esi, %rax
	leaq	0(,%rax,8), %rdx
	leaq	var10(%rip), %rax
	movq	%rcx, (%rdx,%rax)
	movl	-80(%rbp), %edx
	movl	-84(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	leaq	0(,%rdx,8), %rcx
	leaq	var11(%rip), %rdx
	movq	(%rcx,%rdx), %rdx
	leaq	1(%rdx), %rcx
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	var11(%rip), %rax
	movq	%rcx, (%rdx,%rax)
	movl	HR(%rip), %eax
	shrl	$2, %eax
	movl	%eax, HR(%rip)
	movzwl	key(%rip), %eax
	cwtl
	cltq
	leaq	coeff(%rip), %rdx
	movzbl	(%rax,%rdx), %eax
	xorl	$1, %eax
	testb	%al, %al
	je	.L23
	movl	HR(%rip), %edx
	movl	mask_HR(%rip), %eax
	andl	%edx, %eax
	movl	%eax, %eax
	leaq	(%rax,%rax), %rcx
	leaq	PHT(%rip), %rdx
	movzwl	-104(%rbp), %eax
	movw	%ax, (%rcx,%rdx)
	jmp	.L24
.L23:
	movzwl	key(%rip), %eax
	cwtl
	cltq
	leaq	coeff(%rip), %rdx
	movb	$0, (%rax,%rdx)
.L24:
	movl	HR(%rip), %eax
	sall	$2, %eax
	movl	%eax, HR(%rip)
	movswl	-104(%rbp), %edx
	movl	HR(%rip), %eax
	addl	%edx, %eax
	movl	%eax, HR(%rip)
	movzwl	-104(%rbp), %eax
	movw	%ax, key(%rip)
.L20:
	addl	$1, -96(%rbp)
	jmp 	.FINISH_LABEL
.TRACE2:
.L25:
	movl	$-1, %eax
	xbegin	.L26
.L26:
	nop
	movl	%eax, -76(%rbp)
	cmpl	$-1, -76(%rbp)
	jne	.L28
	movl	-80(%rbp), %edx
	movslq	%edx, %rax
	imulq	$-1840700269, %rax, %rax
	shrq	$32, %rax
	addl	%edx, %eax
	sarl	$2, %eax
	movl	%edx, %ecx
	sarl	$31, %ecx
	subl	%ecx, %eax
	movl	%eax, %ecx
	sall	$3, %ecx
	subl	%eax, %ecx
	movl	%edx, %eax
	subl	%ecx, %eax
	testl	%eax, %eax
	je	.L29
	xabort	$2
.L29:
	movl	-80(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	var3(%rip), %rax
	movq	(%rdx,%rax), %rcx
	movl	-80(%rbp), %edx
	movl	-84(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	var2(%rip), %rax
	movq	(%rdx,%rax), %rax
	addq	%rax, %rcx
	movl	-80(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	var3(%rip), %rax
	movq	%rcx, (%rdx,%rax)
	movl	-80(%rbp), %eax
	movslq	%eax, %rdx
	imulq	$-1840700269, %rdx, %rdx
	shrq	$32, %rdx
	addl	%eax, %edx
	sarl	$2, %edx
	sarl	$31, %eax
	movl	%eax, %ecx
	movl	%edx, %eax
	subl	%ecx, %eax
	movslq	%eax, %rdx
	leaq	0(,%rdx,8), %rcx
	leaq	var2(%rip), %rdx
	movq	(%rcx,%rdx), %rdx
	movl	-80(%rbp), %esi
	movl	-84(%rbp), %ecx
	addl	%esi, %ecx
	movslq	%ecx, %rcx
	leaq	0(,%rcx,8), %rsi
	leaq	var11(%rip), %rcx
	movq	(%rsi,%rcx), %rsi
	movq	%rdx, %rcx
	subq	%rsi, %rcx
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	var2(%rip), %rax
	movq	%rcx, (%rdx,%rax)
	movl	-80(%rbp), %eax
	movslq	%eax, %rdx
	imulq	$-1840700269, %rdx, %rdx
	shrq	$32, %rdx
	addl	%eax, %edx
	sarl	$2, %edx
	sarl	$31, %eax
	movl	%edx, %esi
	subl	%eax, %esi
	movslq	%esi, %rax
	leaq	0(,%rax,8), %rdx
	leaq	var10(%rip), %rax
	movq	(%rdx,%rax), %rdi
	movl	-80(%rbp), %eax
	movslq	%eax, %rdx
	imulq	$-1840700269, %rdx, %rdx
	shrq	$32, %rdx
	addl	%eax, %edx
	sarl	$2, %edx
	movl	%eax, %ecx
	sarl	$31, %ecx
	subl	%ecx, %edx
	movl	%edx, %ecx
	sall	$3, %ecx
	subl	%edx, %ecx
	subl	%ecx, %eax
	movl	%eax, %edx
	movslq	%edx, %rax
	leaq	0(,%rax,8), %rdx
	leaq	var3(%rip), %rax
	movq	(%rdx,%rax), %rax
	leaq	(%rdi,%rax), %rcx
	movslq	%esi, %rax
	leaq	0(,%rax,8), %rdx
	leaq	var10(%rip), %rax
	movq	%rcx, (%rdx,%rax)
	movl	-80(%rbp), %edx
	movl	-84(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	leaq	0(,%rdx,8), %rcx
	leaq	var11(%rip), %rdx
	movq	(%rcx,%rdx), %rdx
	leaq	1(%rdx), %rcx
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	var11(%rip), %rax
	movq	%rcx, (%rdx,%rax)
	xend
	jmp	.L30
.L28:
	movw	$0, -102(%rbp)
	movl	-80(%rbp), %edx
	movslq	%edx, %rax
	imulq	$-1840700269, %rax, %rax
	shrq	$32, %rax
	addl	%edx, %eax
	sarl	$2, %eax
	movl	%edx, %ecx
	sarl	$31, %ecx
	subl	%ecx, %eax
	movl	%eax, %ecx
	sall	$3, %ecx
	subl	%eax, %ecx
	movl	%edx, %eax
	subl	%ecx, %eax
	testl	%eax, %eax
	jne	.L31
	movw	$1, -102(%rbp)
	movl	-80(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	var3(%rip), %rax
	movq	(%rdx,%rax), %rcx
	movl	-80(%rbp), %edx
	movl	-84(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	var2(%rip), %rax
	movq	(%rdx,%rax), %rax
	addq	%rax, %rcx
	movl	-80(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	var3(%rip), %rax
	movq	%rcx, (%rdx,%rax)
	movl	-80(%rbp), %eax
	movslq	%eax, %rdx
	imulq	$-1840700269, %rdx, %rdx
	shrq	$32, %rdx
	addl	%eax, %edx
	sarl	$2, %edx
	sarl	$31, %eax
	movl	%eax, %ecx
	movl	%edx, %eax
	subl	%ecx, %eax
	movslq	%eax, %rdx
	leaq	0(,%rdx,8), %rcx
	leaq	var2(%rip), %rdx
	movq	(%rcx,%rdx), %rdx
	movl	-80(%rbp), %esi
	movl	-84(%rbp), %ecx
	addl	%esi, %ecx
	movslq	%ecx, %rcx
	leaq	0(,%rcx,8), %rsi
	leaq	var11(%rip), %rcx
	movq	(%rsi,%rcx), %rsi
	movq	%rdx, %rcx
	subq	%rsi, %rcx
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	var2(%rip), %rax
	movq	%rcx, (%rdx,%rax)
	jmp	.L32
.L31:
	movw	$0, -102(%rbp)
	movl	-80(%rbp), %edx
	movl	-84(%rbp), %eax
	leal	(%rdx,%rax), %esi
	movl	-80(%rbp), %eax
	movslq	%eax, %rdx
	imulq	$-1840700269, %rdx, %rdx
	shrq	$32, %rdx
	addl	%eax, %edx
	sarl	$2, %edx
	movl	%eax, %ecx
	sarl	$31, %ecx
	subl	%ecx, %edx
	movl	%edx, %ecx
	sall	$3, %ecx
	subl	%edx, %ecx
	subl	%ecx, %eax
	movl	%eax, %edx
	movslq	%esi, %rax
	leaq	0(,%rax,8), %rcx
	leaq	var3(%rip), %rax
	movq	(%rcx,%rax), %rax
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rcx
	leaq	var2(%rip), %rdx
	movq	%rax, (%rcx,%rdx)
	movl	-80(%rbp), %eax
	movslq	%eax, %rdx
	imulq	$-1840700269, %rdx, %rdx
	shrq	$32, %rdx
	addl	%eax, %edx
	sarl	$2, %edx
	sarl	$31, %eax
	movl	%eax, %ecx
	movl	%edx, %eax
	subl	%ecx, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	var3(%rip), %rax
	movq	$2, (%rdx,%rax)
.L32:
	movl	-80(%rbp), %eax
	movslq	%eax, %rdx
	imulq	$-1840700269, %rdx, %rdx
	shrq	$32, %rdx
	addl	%eax, %edx
	sarl	$2, %edx
	sarl	$31, %eax
	movl	%edx, %esi
	subl	%eax, %esi
	movslq	%esi, %rax
	leaq	0(,%rax,8), %rdx
	leaq	var10(%rip), %rax
	movq	(%rdx,%rax), %rdi
	movl	-80(%rbp), %eax
	movslq	%eax, %rdx
	imulq	$-1840700269, %rdx, %rdx
	shrq	$32, %rdx
	addl	%eax, %edx
	sarl	$2, %edx
	movl	%eax, %ecx
	sarl	$31, %ecx
	subl	%ecx, %edx
	movl	%edx, %ecx
	sall	$3, %ecx
	subl	%edx, %ecx
	subl	%ecx, %eax
	movl	%eax, %edx
	movslq	%edx, %rax
	leaq	0(,%rax,8), %rdx
	leaq	var3(%rip), %rax
	movq	(%rdx,%rax), %rax
	leaq	(%rdi,%rax), %rcx
	movslq	%esi, %rax
	leaq	0(,%rax,8), %rdx
	leaq	var10(%rip), %rax
	movq	%rcx, (%rdx,%rax)
	movl	-80(%rbp), %edx
	movl	-84(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	leaq	0(,%rdx,8), %rcx
	leaq	var11(%rip), %rdx
	movq	(%rcx,%rdx), %rdx
	leaq	1(%rdx), %rcx
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	var11(%rip), %rax
	movq	%rcx, (%rdx,%rax)
	movl	HR(%rip), %eax
	shrl	$2, %eax
	movl	%eax, HR(%rip)
	movzwl	key(%rip), %eax
	cwtl
	cltq
	leaq	coeff(%rip), %rdx
	movzbl	(%rax,%rdx), %eax
	xorl	$1, %eax
	testb	%al, %al
	je	.L33
	movl	HR(%rip), %edx
	movl	mask_HR(%rip), %eax
	andl	%edx, %eax
	movl	%eax, %eax
	leaq	(%rax,%rax), %rcx
	leaq	PHT(%rip), %rdx
	movzwl	-102(%rbp), %eax
	movw	%ax, (%rcx,%rdx)
	jmp	.L34
.L33:
	movzwl	key(%rip), %eax
	cwtl
	cltq
	leaq	coeff(%rip), %rdx
	movb	$0, (%rax,%rdx)
.L34:
	movl	HR(%rip), %eax
	sall	$2, %eax
	movl	%eax, HR(%rip)
	movswl	-102(%rbp), %edx
	movl	HR(%rip), %eax
	addl	%edx, %eax
	movl	%eax, HR(%rip)
	movzwl	-102(%rbp), %eax
	movw	%ax, key(%rip)
.L30:
	addl	$1, -92(%rbp)
.FINISH_LABEL:
.L35:
	addl	$1, -88(%rbp)
	movzwl	key(%rip), %eax
	cwtl
	cltq
	leaq	coeff(%rip), %rdx
	movb	$1, (%rax,%rdx)
	movw	$-1, key(%rip)
	addl	$1, -80(%rbp)
.L13:
	cmpl	$700013, -80(%rbp)
	jle	.L36
	addl	$1, -84(%rbp)
.L12:
	cmpl	$499, -84(%rbp)
	jle	.L37
	call	clock@PLT
	movq	%rax, -24(%rbp)
	movq	-72(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_join@PLT
	movq	-24(%rbp), %rax
	subq	-32(%rbp), %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC0(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %xmm0
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	movq	-40(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	leaq	var11(%rip), %rax
	movq	(%rdx,%rax), %rdi
	movq	-48(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	leaq	var10(%rip), %rax
	movq	(%rdx,%rax), %rcx
	movq	-56(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	leaq	var3(%rip), %rax
	movq	(%rdx,%rax), %rdx
	movq	-64(%rbp), %rax
	leaq	0(,%rax,8), %rsi
	leaq	var2(%rip), %rax
	movq	(%rsi,%rax), %rax
	movl	-96(%rbp), %r8d
	subq	$8, %rsp
	movl	-92(%rbp), %esi
	pushq	%rsi
	movl	%r8d, %r9d
	movq	%rdi, %r8
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addq	$16, %rsp
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L39
	call	__stack_chk_fail@PLT
.L39:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4222:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1093567616
	.ident	"GCC: (Ubuntu 11.2.0-7ubuntu2) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
