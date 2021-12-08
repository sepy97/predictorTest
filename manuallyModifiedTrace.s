	.file	"traced_ifthenelse.cpp"
	.text
.Ltext0:
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
.LFB3685:
	.file 1 "traced_ifthenelse.cpp"
	.loc 1 27 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
.LBB19:
	.loc 1 29 0
	movl	$0, -8(%rbp)
.L3:
	.loc 1 29 0 is_stmt 0 discriminator 3
	cmpl	$15, -8(%rbp)
	jg	.L2
	.loc 1 31 0 is_stmt 1 discriminator 2
	movl	-8(%rbp), %eax
	cltq
	leaq	(%rax,%rax), %rdx
	leaq	PHT(%rip), %rax
	movw	$0, (%rdx,%rax)
	.loc 1 29 0 discriminator 2
	addl	$1, -8(%rbp)
	jmp	.L3
.L2:
.LBE19:
.LBB20:
	.loc 1 33 0
	movl	$0, -4(%rbp)
.L5:
	.loc 1 33 0 is_stmt 0 discriminator 3
	cmpl	$1, -4(%rbp)
	jg	.L4
	.loc 1 35 0 is_stmt 1 discriminator 2
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	leaq	coeff(%rip), %rax
	movb	$1, (%rdx,%rax)
	.loc 1 33 0 discriminator 2
	addl	$1, -4(%rbp)
	jmp	.L5
.L4:
.LBE20:
	.loc 1 40 0
	movl	HR(%rip), %edx
	movl	mask_HR(%rip), %eax
	andl	%edx, %eax
	movl	%eax, %eax
	leaq	(%rax,%rax), %rdx
	leaq	PHT(%rip), %rax
	movzwl	(%rdx,%rax), %eax
	movw	%ax, key(%rip)
	.loc 1 44 0
	movl	HR(%rip), %eax
	sall	$2, %eax
	movl	%eax, HR(%rip)
	.loc 1 45 0
	movzwl	key(%rip), %eax
	movswl	%ax, %edx
	movl	HR(%rip), %eax
	addl	%edx, %eax
	movl	%eax, HR(%rip)
.L7:
	.loc 1 47 0
	movzwl	key(%rip), %eax
	notl	%eax
	shrw	$15, %ax
	testb	%al, %al
	je	.L4
	jmp	.L7
	.cfi_endproc
.LFE3685:
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
.LFB3686:
	.loc 1 52 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$144, %rsp
	movl	%edi, -116(%rbp)
	movq	%rsi, -128(%rbp)
	.loc 1 52 0
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 53 0
	movq	$0, -64(%rbp)
	movq	$0, -56(%rbp)
	movq	$0, -48(%rbp)
	movq	$0, -40(%rbp)
	.loc 1 56 0
	cmpl	$5, -116(%rbp)
	jne	.L9
	.loc 1 58 0
	movq	-128(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	cltq
	movq	%rax, -64(%rbp)
	.loc 1 59 0
	movq	-128(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	cltq
	movq	%rax, -56(%rbp)
	.loc 1 60 0
	movq	-128(%rbp), %rax
	addq	$24, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	cltq
	movq	%rax, -48(%rbp)
	.loc 1 61 0
	movq	-128(%rbp), %rax
	addq	$32, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	cltq
	movq	%rax, -40(%rbp)
.L9:
.LBB21:
	.loc 1 67 0
	movl	$0, -100(%rbp)
.L11:
	.loc 1 67 0 is_stmt 0 discriminator 3
	cmpl	$1999999, -100(%rbp)
	jg	.L10
	.loc 1 69 0 is_stmt 1 discriminator 2
	call	rand@PLT
	movl	%eax, %ecx
	movl	$274877907, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$5, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	imull	$500, %eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	movslq	%eax, %rdx
	movl	-100(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rcx
	leaq	var2(%rip), %rax
	movq	%rdx, (%rcx,%rax)
	.loc 1 70 0 discriminator 2
	call	rand@PLT
	movl	%eax, %ecx
	movl	$274877907, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$5, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	imull	$500, %eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	movslq	%eax, %rdx
	movl	-100(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rcx
	leaq	var3(%rip), %rax
	movq	%rdx, (%rcx,%rax)
	.loc 1 71 0 discriminator 2
	call	rand@PLT
	movl	%eax, %ecx
	movl	$274877907, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$5, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	imull	$500, %eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	movslq	%eax, %rdx
	movl	-100(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rcx
	leaq	var10(%rip), %rax
	movq	%rdx, (%rcx,%rax)
	.loc 1 72 0 discriminator 2
	call	rand@PLT
	movl	%eax, %ecx
	movl	$274877907, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$5, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	imull	$500, %eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	movslq	%eax, %rdx
	movl	-100(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rcx
	leaq	var11(%rip), %rax
	movq	%rdx, (%rcx,%rax)
	.loc 1 67 0 discriminator 2
	addl	$1, -100(%rbp)
	jmp	.L11
.L10:
.LBE21:
	.loc 1 74 0
	movl	$0, -96(%rbp)
	movl	$0, -92(%rbp)
	movl	$0, -88(%rbp)
	.loc 1 78 0
	leaq	-72(%rbp), %rax
	movl	$0, %ecx
	leaq	_Z9predictorPv(%rip), %rdx
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_create@PLT
	.loc 1 79 0
	movl	$0, -76(%rbp)
	.loc 1 82 0
	call	clock@PLT
	movq	%rax, -32(%rbp)
.LBB22:
	.loc 1 83 0
	movl	$0, -84(%rbp)
.L38:
	.loc 1 83 0 is_stmt 0 discriminator 1
	cmpl	$499, -84(%rbp)
	jg	.L12
.LBB23:
.LBB24:
	.loc 1 85 0 is_stmt 1
	movl	$0, -80(%rbp)
.L37:
	.loc 1 85 0 is_stmt 0 discriminator 1
	cmpl	$700013, -80(%rbp)
	jg	.L13
.L15:
.LBB25:
	.loc 1 88 0 is_stmt 1
	movzwl	key(%rip), %eax
	shrw	$15, %ax
	testb	%al, %al
	je	.L14
	jmp	.L15
.L14:
	.loc 1 96 0
        movzwl  key(%rip), %rax
        jmp     *trace_tbl(,%rax,8)
        .section        .rodata
trace_tbl:
        .quad           .TRACE1
        .quad           .TRACE2
        .section        .text

.TRACE1:
.L16:
.LBB26:
.LBB27:
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/7/include/rtmintrin.h"
	.loc 2 52 0
	movl	$-1, %eax
	xbegin	.L17
.L17:
.LBE27:
.LBE26:
	.loc 1 100 0
	movl	%eax, -76(%rbp)
.LBB28:
	.loc 1 101 0
	cmpl	$-1, -76(%rbp)
	jne	.L19
	.loc 1 103 0
	movl	-80(%rbp), %ecx
	movl	$-1840700269, %edx
	movl	%ecx, %eax
	imull	%edx
	leal	(%rdx,%rcx), %eax
	sarl	$2, %eax
	movl	%eax, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %edx
	sall	$3, %edx
	subl	%eax, %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	testl	%eax, %eax
	jne	.L20
	.loc 1 103 0 is_stmt 0 discriminator 1
	xabort	$1
.L20:
	.loc 1 104 0 is_stmt 1
	movl	-80(%rbp), %edx
	movl	-84(%rbp), %eax
	leal	(%rdx,%rax), %esi
	movl	-80(%rbp), %ecx
	movl	$-1840700269, %edx
	movl	%ecx, %eax
	imull	%edx
	leal	(%rdx,%rcx), %eax
	sarl	$2, %eax
	movl	%eax, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %edx
	sall	$3, %edx
	subl	%eax, %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	movslq	%esi, %rdx
	leaq	0(,%rdx,8), %rcx
	leaq	var3(%rip), %rdx
	movq	(%rcx,%rdx), %rdx
	cltq
	leaq	0(,%rax,8), %rcx
	leaq	var2(%rip), %rax
	movq	%rdx, (%rcx,%rax)
	.loc 1 105 0
	movl	-80(%rbp), %ecx
	movl	$-1840700269, %edx
	movl	%ecx, %eax
	imull	%edx
	leal	(%rdx,%rcx), %eax
	sarl	$2, %eax
	movl	%eax, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	var3(%rip), %rax
	movq	$2, (%rdx,%rax)
	.loc 1 106 0
	movl	-80(%rbp), %ecx
	movl	$-1840700269, %edx
	movl	%ecx, %eax
	imull	%edx
	leal	(%rdx,%rcx), %eax
	sarl	$2, %eax
	movl	%eax, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	movl	%edx, %esi
	subl	%eax, %esi
	movslq	%esi, %rax
	leaq	0(,%rax,8), %rdx
	leaq	var10(%rip), %rax
	movq	(%rdx,%rax), %rdi
	movl	-80(%rbp), %ecx
	movl	$-1840700269, %edx
	movl	%ecx, %eax
	imull	%edx
	leal	(%rdx,%rcx), %eax
	sarl	$2, %eax
	movl	%eax, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %edx
	sall	$3, %edx
	subl	%eax, %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	var3(%rip), %rax
	movq	(%rdx,%rax), %rax
	leaq	(%rdi,%rax), %rcx
	movslq	%esi, %rax
	leaq	0(,%rax,8), %rdx
	leaq	var10(%rip), %rax
	movq	%rcx, (%rdx,%rax)
	.loc 1 107 0
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
.LBB29:
.LBB30:
	.loc 2 63 0
	xend
.LBE30:
.LBE29:
	jmp	.L21
.L19:
.LBB31:
	.loc 1 112 0
	movw	$0, -104(%rbp)
	.loc 1 114 0
	movl	-80(%rbp), %ecx
	movl	$-1840700269, %edx
	movl	%ecx, %eax
	imull	%edx
	leal	(%rdx,%rcx), %eax
	sarl	$2, %eax
	movl	%eax, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %edx
	sall	$3, %edx
	subl	%eax, %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	testl	%eax, %eax
	jne	.L22
	.loc 1 116 0
	movw	$1, -104(%rbp)
	.loc 1 117 0
	movl	-80(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	var3(%rip), %rax
	movq	(%rdx,%rax), %rdx
	movl	-80(%rbp), %ecx
	movl	-84(%rbp), %eax
	addl	%ecx, %eax
	cltq
	leaq	0(,%rax,8), %rcx
	leaq	var2(%rip), %rax
	movq	(%rcx,%rax), %rax
	leaq	(%rdx,%rax), %rcx
	movl	-80(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	var3(%rip), %rax
	movq	%rcx, (%rdx,%rax)
	.loc 1 118 0
	movl	-80(%rbp), %ecx
	movl	$-1840700269, %edx
	movl	%ecx, %eax
	imull	%edx
	leal	(%rdx,%rcx), %eax
	sarl	$2, %eax
	movl	%eax, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movslq	%eax, %rdx
	leaq	0(,%rdx,8), %rcx
	leaq	var2(%rip), %rdx
	movq	(%rcx,%rdx), %rcx
	movl	-80(%rbp), %esi
	movl	-84(%rbp), %edx
	addl	%esi, %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rsi
	leaq	var11(%rip), %rdx
	movq	(%rsi,%rdx), %rdx
	subq	%rdx, %rcx
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	var2(%rip), %rax
	movq	%rcx, (%rdx,%rax)
	jmp	.L23
.L22:
	.loc 1 122 0
	movw	$0, -104(%rbp)
	.loc 1 123 0
	movl	-80(%rbp), %edx
	movl	-84(%rbp), %eax
	leal	(%rdx,%rax), %esi
	movl	-80(%rbp), %ecx
	movl	$-1840700269, %edx
	movl	%ecx, %eax
	imull	%edx
	leal	(%rdx,%rcx), %eax
	sarl	$2, %eax
	movl	%eax, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %edx
	sall	$3, %edx
	subl	%eax, %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	movslq	%esi, %rdx
	leaq	0(,%rdx,8), %rcx
	leaq	var3(%rip), %rdx
	movq	(%rcx,%rdx), %rdx
	cltq
	leaq	0(,%rax,8), %rcx
	leaq	var2(%rip), %rax
	movq	%rdx, (%rcx,%rax)
	.loc 1 124 0
	movl	-80(%rbp), %ecx
	movl	$-1840700269, %edx
	movl	%ecx, %eax
	imull	%edx
	leal	(%rdx,%rcx), %eax
	sarl	$2, %eax
	movl	%eax, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	var3(%rip), %rax
	movq	$2, (%rdx,%rax)
.L23:
	.loc 1 126 0
	movl	-80(%rbp), %ecx
	movl	$-1840700269, %edx
	movl	%ecx, %eax
	imull	%edx
	leal	(%rdx,%rcx), %eax
	sarl	$2, %eax
	movl	%eax, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	movl	%edx, %esi
	subl	%eax, %esi
	movslq	%esi, %rax
	leaq	0(,%rax,8), %rdx
	leaq	var10(%rip), %rax
	movq	(%rdx,%rax), %rdi
	movl	-80(%rbp), %ecx
	movl	$-1840700269, %edx
	movl	%ecx, %eax
	imull	%edx
	leal	(%rdx,%rcx), %eax
	sarl	$2, %eax
	movl	%eax, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %edx
	sall	$3, %edx
	subl	%eax, %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	var3(%rip), %rax
	movq	(%rdx,%rax), %rax
	leaq	(%rdi,%rax), %rcx
	movslq	%esi, %rax
	leaq	0(,%rax,8), %rdx
	leaq	var10(%rip), %rax
	movq	%rcx, (%rdx,%rax)
	.loc 1 127 0
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
	.loc 1 129 0
	movl	HR(%rip), %eax
	shrl	$2, %eax
	movl	%eax, HR(%rip)
	.loc 1 131 0
	movzwl	key(%rip), %eax
	cwtl
	movslq	%eax, %rdx
	leaq	coeff(%rip), %rax
	movzbl	(%rdx,%rax), %eax
	xorl	$1, %eax
	testb	%al, %al
	je	.L24
	.loc 1 131 0 is_stmt 0 discriminator 1
	movl	HR(%rip), %edx
	movl	mask_HR(%rip), %eax
	andl	%edx, %eax
	movl	%eax, %eax
	leaq	(%rax,%rax), %rcx
	leaq	PHT(%rip), %rax
	movzwl	-104(%rbp), %edx
	movw	%dx, (%rcx,%rax)
	jmp	.L25
.L24:
	.loc 1 132 0 is_stmt 1
	movzwl	key(%rip), %eax
	cwtl
	movslq	%eax, %rdx
	leaq	coeff(%rip), %rax
	movb	$0, (%rdx,%rax)
.L25:
	.loc 1 133 0
	movl	HR(%rip), %eax
	sall	$2, %eax
	movl	%eax, HR(%rip)
	.loc 1 134 0
	movswl	-104(%rbp), %edx
	movl	HR(%rip), %eax
	addl	%edx, %eax
	movl	%eax, HR(%rip)
	.loc 1 135 0
	movzwl	-104(%rbp), %eax
	movw	%ax, key(%rip)
.L21:
.LBE31:
.LBE28:
	.loc 1 137 0
	addl	$1, -96(%rbp)

        jmp     .FINISH_LABEL

.TRACE2:
.L26:
.LBB32:
.LBB33:
	.loc 2 52 0
	movl	$-1, %eax
	xbegin	.L27
.L27:
.LBE33:
.LBE32:
	.loc 1 142 0
	movl	%eax, -76(%rbp)
.LBB34:
	.loc 1 143 0
	cmpl	$-1, -76(%rbp)
	jne	.L29
	.loc 1 145 0
	movl	-80(%rbp), %ecx
	movl	$-1840700269, %edx
	movl	%ecx, %eax
	imull	%edx
	leal	(%rdx,%rcx), %eax
	sarl	$2, %eax
	movl	%eax, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %edx
	sall	$3, %edx
	subl	%eax, %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	testl	%eax, %eax
	je	.L30
	.loc 1 145 0 is_stmt 0 discriminator 1
	xabort	$2
.L30:
	.loc 1 146 0 is_stmt 1
	movl	-80(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	var3(%rip), %rax
	movq	(%rdx,%rax), %rdx
	movl	-80(%rbp), %ecx
	movl	-84(%rbp), %eax
	addl	%ecx, %eax
	cltq
	leaq	0(,%rax,8), %rcx
	leaq	var2(%rip), %rax
	movq	(%rcx,%rax), %rax
	leaq	(%rdx,%rax), %rcx
	movl	-80(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	var3(%rip), %rax
	movq	%rcx, (%rdx,%rax)
	.loc 1 147 0
	movl	-80(%rbp), %ecx
	movl	$-1840700269, %edx
	movl	%ecx, %eax
	imull	%edx
	leal	(%rdx,%rcx), %eax
	sarl	$2, %eax
	movl	%eax, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movslq	%eax, %rdx
	leaq	0(,%rdx,8), %rcx
	leaq	var2(%rip), %rdx
	movq	(%rcx,%rdx), %rcx
	movl	-80(%rbp), %esi
	movl	-84(%rbp), %edx
	addl	%esi, %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rsi
	leaq	var11(%rip), %rdx
	movq	(%rsi,%rdx), %rdx
	subq	%rdx, %rcx
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	var2(%rip), %rax
	movq	%rcx, (%rdx,%rax)
	.loc 1 148 0
	movl	-80(%rbp), %ecx
	movl	$-1840700269, %edx
	movl	%ecx, %eax
	imull	%edx
	leal	(%rdx,%rcx), %eax
	sarl	$2, %eax
	movl	%eax, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	movl	%edx, %esi
	subl	%eax, %esi
	movslq	%esi, %rax
	leaq	0(,%rax,8), %rdx
	leaq	var10(%rip), %rax
	movq	(%rdx,%rax), %rdi
	movl	-80(%rbp), %ecx
	movl	$-1840700269, %edx
	movl	%ecx, %eax
	imull	%edx
	leal	(%rdx,%rcx), %eax
	sarl	$2, %eax
	movl	%eax, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %edx
	sall	$3, %edx
	subl	%eax, %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	var3(%rip), %rax
	movq	(%rdx,%rax), %rax
	leaq	(%rdi,%rax), %rcx
	movslq	%esi, %rax
	leaq	0(,%rax,8), %rdx
	leaq	var10(%rip), %rax
	movq	%rcx, (%rdx,%rax)
	.loc 1 149 0
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
.LBB35:
.LBB36:
	.loc 2 63 0
	xend
.LBE36:
.LBE35:
	jmp	.L31
.L29:
.LBB37:
	.loc 1 154 0
	movw	$0, -102(%rbp)
	.loc 1 156 0
	movl	-80(%rbp), %ecx
	movl	$-1840700269, %edx
	movl	%ecx, %eax
	imull	%edx
	leal	(%rdx,%rcx), %eax
	sarl	$2, %eax
	movl	%eax, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %edx
	sall	$3, %edx
	subl	%eax, %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	testl	%eax, %eax
	jne	.L32
	.loc 1 158 0
	movw	$1, -102(%rbp)
	.loc 1 159 0
	movl	-80(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	var3(%rip), %rax
	movq	(%rdx,%rax), %rdx
	movl	-80(%rbp), %ecx
	movl	-84(%rbp), %eax
	addl	%ecx, %eax
	cltq
	leaq	0(,%rax,8), %rcx
	leaq	var2(%rip), %rax
	movq	(%rcx,%rax), %rax
	leaq	(%rdx,%rax), %rcx
	movl	-80(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	var3(%rip), %rax
	movq	%rcx, (%rdx,%rax)
	.loc 1 160 0
	movl	-80(%rbp), %ecx
	movl	$-1840700269, %edx
	movl	%ecx, %eax
	imull	%edx
	leal	(%rdx,%rcx), %eax
	sarl	$2, %eax
	movl	%eax, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movslq	%eax, %rdx
	leaq	0(,%rdx,8), %rcx
	leaq	var2(%rip), %rdx
	movq	(%rcx,%rdx), %rcx
	movl	-80(%rbp), %esi
	movl	-84(%rbp), %edx
	addl	%esi, %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rsi
	leaq	var11(%rip), %rdx
	movq	(%rsi,%rdx), %rdx
	subq	%rdx, %rcx
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	var2(%rip), %rax
	movq	%rcx, (%rdx,%rax)
	jmp	.L33
.L32:
	.loc 1 164 0
	movw	$0, -102(%rbp)
	.loc 1 165 0
	movl	-80(%rbp), %edx
	movl	-84(%rbp), %eax
	leal	(%rdx,%rax), %esi
	movl	-80(%rbp), %ecx
	movl	$-1840700269, %edx
	movl	%ecx, %eax
	imull	%edx
	leal	(%rdx,%rcx), %eax
	sarl	$2, %eax
	movl	%eax, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %edx
	sall	$3, %edx
	subl	%eax, %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	movslq	%esi, %rdx
	leaq	0(,%rdx,8), %rcx
	leaq	var3(%rip), %rdx
	movq	(%rcx,%rdx), %rdx
	cltq
	leaq	0(,%rax,8), %rcx
	leaq	var2(%rip), %rax
	movq	%rdx, (%rcx,%rax)
	.loc 1 166 0
	movl	-80(%rbp), %ecx
	movl	$-1840700269, %edx
	movl	%ecx, %eax
	imull	%edx
	leal	(%rdx,%rcx), %eax
	sarl	$2, %eax
	movl	%eax, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	var3(%rip), %rax
	movq	$2, (%rdx,%rax)
.L33:
	.loc 1 168 0
	movl	-80(%rbp), %ecx
	movl	$-1840700269, %edx
	movl	%ecx, %eax
	imull	%edx
	leal	(%rdx,%rcx), %eax
	sarl	$2, %eax
	movl	%eax, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	movl	%edx, %esi
	subl	%eax, %esi
	movslq	%esi, %rax
	leaq	0(,%rax,8), %rdx
	leaq	var10(%rip), %rax
	movq	(%rdx,%rax), %rdi
	movl	-80(%rbp), %ecx
	movl	$-1840700269, %edx
	movl	%ecx, %eax
	imull	%edx
	leal	(%rdx,%rcx), %eax
	sarl	$2, %eax
	movl	%eax, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %edx
	sall	$3, %edx
	subl	%eax, %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	var3(%rip), %rax
	movq	(%rdx,%rax), %rax
	leaq	(%rdi,%rax), %rcx
	movslq	%esi, %rax
	leaq	0(,%rax,8), %rdx
	leaq	var10(%rip), %rax
	movq	%rcx, (%rdx,%rax)
	.loc 1 169 0
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
	.loc 1 171 0
	movl	HR(%rip), %eax
	shrl	$2, %eax
	movl	%eax, HR(%rip)
	.loc 1 173 0
	movzwl	key(%rip), %eax
	cwtl
	movslq	%eax, %rdx
	leaq	coeff(%rip), %rax
	movzbl	(%rdx,%rax), %eax
	xorl	$1, %eax
	testb	%al, %al
	je	.L34
	.loc 1 173 0 is_stmt 0 discriminator 1
	movl	HR(%rip), %edx
	movl	mask_HR(%rip), %eax
	andl	%edx, %eax
	movl	%eax, %eax
	leaq	(%rax,%rax), %rcx
	leaq	PHT(%rip), %rax
	movzwl	-102(%rbp), %edx
	movw	%dx, (%rcx,%rax)
	jmp	.L35
.L34:
	.loc 1 174 0 is_stmt 1
	movzwl	key(%rip), %eax
	cwtl
	movslq	%eax, %rdx
	leaq	coeff(%rip), %rax
	movb	$0, (%rdx,%rax)
.L35:
	.loc 1 175 0
	movl	HR(%rip), %eax
	sall	$2, %eax
	movl	%eax, HR(%rip)
	.loc 1 176 0
	movswl	-102(%rbp), %edx
	movl	HR(%rip), %eax
	addl	%edx, %eax
	movl	%eax, HR(%rip)
	.loc 1 177 0
	movzwl	-102(%rbp), %eax
	movw	%ax, key(%rip)
.L31:
.LBE37:
.LBE34:
	.loc 1 179 0
	addl	$1, -92(%rbp)

.FINISH_LABEL:
.L36:
	.loc 1 183 0
	addl	$1, -88(%rbp)
	.loc 1 184 0
	movzwl	key(%rip), %eax
	cwtl
	movslq	%eax, %rdx
	leaq	coeff(%rip), %rax
	movb	$1, (%rdx,%rax)
	.loc 1 185 0
	movw	$-1, key(%rip)
.LBE25:
	.loc 1 85 0
	addl	$1, -80(%rbp)
	jmp	.L37
.L13:
.LBE24:
.LBE23:
	.loc 1 83 0 discriminator 2
	addl	$1, -84(%rbp)
	jmp	.L38
.L12:
.LBE22:
	.loc 1 188 0
	call	clock@PLT
	movq	%rax, -24(%rbp)
	.loc 1 191 0
	movq	-72(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_kill@PLT
	.loc 1 194 0
	movq	-24(%rbp), %rax
	subq	-32(%rbp), %rax
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC0(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -16(%rbp)
	.loc 1 195 0
	movq	-16(%rbp), %rax
	movq	%rax, -136(%rbp)
	movsd	-136(%rbp), %xmm0
	leaq	.LC1(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	.loc 1 198 0
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
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addq	$16, %rsp
	.loc 1 199 0
	movl	$0, %eax
	movq	-8(%rbp), %rdi
	xorq	%fs:40, %rdi
	je	.L40
	call	__stack_chk_fail@PLT
.L40:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3686:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1093567616
	.text
.Letext0:
	.file 3 "/usr/include/c++/7/cstdio"
	.file 4 "/usr/include/c++/7/ctime"
	.file 5 "/usr/include/c++/7/cstdlib"
	.file 6 "/usr/include/x86_64-linux-gnu/c++/7/bits/c++config.h"
	.file 7 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"
	.file 8 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 9 "/usr/include/x86_64-linux-gnu/bits/libio.h"
	.file 10 "/usr/include/x86_64-linux-gnu/bits/types/FILE.h"
	.file 11 "/usr/include/x86_64-linux-gnu/bits/types/__mbstate_t.h"
	.file 12 "/usr/include/x86_64-linux-gnu/bits/_G_config.h"
	.file 13 "/usr/include/stdio.h"
	.file 14 "/usr/include/x86_64-linux-gnu/bits/sys_errlist.h"
	.file 15 "/usr/include/x86_64-linux-gnu/bits/types/clock_t.h"
	.file 16 "/usr/include/x86_64-linux-gnu/bits/types/time_t.h"
	.file 17 "/usr/include/x86_64-linux-gnu/bits/types/struct_tm.h"
	.file 18 "/usr/include/time.h"
	.file 19 "/usr/include/stdlib.h"
	.file 20 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h"
	.file 21 "/usr/include/pthread.h"
	.file 22 "/usr/include/signal.h"
	.file 23 "/usr/include/c++/7/stdlib.h"
	.file 24 "<built-in>"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x13a5
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF204
	.byte	0x4
	.long	.LASF205
	.long	.LASF206
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.string	"std"
	.byte	0x18
	.byte	0
	.long	0x231
	.uleb128 0x3
	.long	.LASF1
	.byte	0x6
	.byte	0xfd
	.uleb128 0x4
	.byte	0x6
	.byte	0xfd
	.long	0x38
	.uleb128 0x5
	.byte	0x3
	.byte	0x62
	.long	0x4a0
	.uleb128 0x5
	.byte	0x3
	.byte	0x63
	.long	0x5d8
	.uleb128 0x5
	.byte	0x3
	.byte	0x65
	.long	0x640
	.uleb128 0x5
	.byte	0x3
	.byte	0x66
	.long	0x658
	.uleb128 0x5
	.byte	0x3
	.byte	0x67
	.long	0x66d
	.uleb128 0x5
	.byte	0x3
	.byte	0x68
	.long	0x683
	.uleb128 0x5
	.byte	0x3
	.byte	0x69
	.long	0x699
	.uleb128 0x5
	.byte	0x3
	.byte	0x6a
	.long	0x6ae
	.uleb128 0x5
	.byte	0x3
	.byte	0x6b
	.long	0x6c4
	.uleb128 0x5
	.byte	0x3
	.byte	0x6c
	.long	0x6e5
	.uleb128 0x5
	.byte	0x3
	.byte	0x6d
	.long	0x705
	.uleb128 0x5
	.byte	0x3
	.byte	0x71
	.long	0x71f
	.uleb128 0x5
	.byte	0x3
	.byte	0x72
	.long	0x744
	.uleb128 0x5
	.byte	0x3
	.byte	0x74
	.long	0x763
	.uleb128 0x5
	.byte	0x3
	.byte	0x75
	.long	0x783
	.uleb128 0x5
	.byte	0x3
	.byte	0x76
	.long	0x7a4
	.uleb128 0x5
	.byte	0x3
	.byte	0x78
	.long	0x7ba
	.uleb128 0x5
	.byte	0x3
	.byte	0x79
	.long	0x7d0
	.uleb128 0x5
	.byte	0x3
	.byte	0x7e
	.long	0x7dc
	.uleb128 0x5
	.byte	0x3
	.byte	0x83
	.long	0x7ee
	.uleb128 0x5
	.byte	0x3
	.byte	0x84
	.long	0x803
	.uleb128 0x5
	.byte	0x3
	.byte	0x85
	.long	0x81d
	.uleb128 0x5
	.byte	0x3
	.byte	0x87
	.long	0x82f
	.uleb128 0x5
	.byte	0x3
	.byte	0x88
	.long	0x846
	.uleb128 0x5
	.byte	0x3
	.byte	0x8b
	.long	0x86b
	.uleb128 0x5
	.byte	0x3
	.byte	0x8d
	.long	0x876
	.uleb128 0x5
	.byte	0x3
	.byte	0x8f
	.long	0x88b
	.uleb128 0x5
	.byte	0x4
	.byte	0x3c
	.long	0x8a6
	.uleb128 0x5
	.byte	0x4
	.byte	0x3d
	.long	0x8b1
	.uleb128 0x5
	.byte	0x4
	.byte	0x3e
	.long	0x8c1
	.uleb128 0x5
	.byte	0x4
	.byte	0x40
	.long	0x9b4
	.uleb128 0x5
	.byte	0x4
	.byte	0x41
	.long	0x9bf
	.uleb128 0x5
	.byte	0x4
	.byte	0x42
	.long	0x9e0
	.uleb128 0x5
	.byte	0x4
	.byte	0x43
	.long	0x9fb
	.uleb128 0x5
	.byte	0x4
	.byte	0x44
	.long	0xa16
	.uleb128 0x5
	.byte	0x4
	.byte	0x45
	.long	0xa31
	.uleb128 0x5
	.byte	0x4
	.byte	0x46
	.long	0xa4c
	.uleb128 0x5
	.byte	0x4
	.byte	0x47
	.long	0xa61
	.uleb128 0x5
	.byte	0x5
	.byte	0x7f
	.long	0xab7
	.uleb128 0x5
	.byte	0x5
	.byte	0x80
	.long	0xae7
	.uleb128 0x5
	.byte	0x5
	.byte	0x86
	.long	0xb68
	.uleb128 0x5
	.byte	0x5
	.byte	0x89
	.long	0xb85
	.uleb128 0x5
	.byte	0x5
	.byte	0x8c
	.long	0xb9f
	.uleb128 0x5
	.byte	0x5
	.byte	0x8d
	.long	0xbb4
	.uleb128 0x5
	.byte	0x5
	.byte	0x8e
	.long	0xbc9
	.uleb128 0x5
	.byte	0x5
	.byte	0x8f
	.long	0xbde
	.uleb128 0x5
	.byte	0x5
	.byte	0x91
	.long	0xc08
	.uleb128 0x5
	.byte	0x5
	.byte	0x94
	.long	0xc23
	.uleb128 0x5
	.byte	0x5
	.byte	0x96
	.long	0xc39
	.uleb128 0x5
	.byte	0x5
	.byte	0x99
	.long	0xc54
	.uleb128 0x5
	.byte	0x5
	.byte	0x9a
	.long	0xc6f
	.uleb128 0x5
	.byte	0x5
	.byte	0x9b
	.long	0xca1
	.uleb128 0x5
	.byte	0x5
	.byte	0x9d
	.long	0xcc1
	.uleb128 0x5
	.byte	0x5
	.byte	0xa0
	.long	0xce2
	.uleb128 0x5
	.byte	0x5
	.byte	0xa3
	.long	0xcf4
	.uleb128 0x5
	.byte	0x5
	.byte	0xa5
	.long	0xd00
	.uleb128 0x5
	.byte	0x5
	.byte	0xa6
	.long	0xd12
	.uleb128 0x5
	.byte	0x5
	.byte	0xa7
	.long	0xd32
	.uleb128 0x5
	.byte	0x5
	.byte	0xa8
	.long	0xd51
	.uleb128 0x5
	.byte	0x5
	.byte	0xa9
	.long	0xd70
	.uleb128 0x5
	.byte	0x5
	.byte	0xab
	.long	0xd86
	.uleb128 0x5
	.byte	0x5
	.byte	0xac
	.long	0xdac
	.uleb128 0x5
	.byte	0x5
	.byte	0xf0
	.long	0xb1e
	.uleb128 0x5
	.byte	0x5
	.byte	0xf5
	.long	0x27d
	.uleb128 0x5
	.byte	0x5
	.byte	0xf6
	.long	0xdc7
	.uleb128 0x5
	.byte	0x5
	.byte	0xf8
	.long	0xde2
	.uleb128 0x5
	.byte	0x5
	.byte	0xf9
	.long	0xe35
	.uleb128 0x5
	.byte	0x5
	.byte	0xfa
	.long	0xdf7
	.uleb128 0x5
	.byte	0x5
	.byte	0xfb
	.long	0xe16
	.uleb128 0x5
	.byte	0x5
	.byte	0xfc
	.long	0xe4f
	.byte	0
	.uleb128 0x6
	.long	.LASF0
	.byte	0x6
	.byte	0xff
	.long	0x298
	.uleb128 0x7
	.long	.LASF1
	.byte	0x6
	.value	0x101
	.uleb128 0x8
	.byte	0x6
	.value	0x101
	.long	0x23c
	.uleb128 0x5
	.byte	0x5
	.byte	0xc8
	.long	0xb1e
	.uleb128 0x5
	.byte	0x5
	.byte	0xd8
	.long	0xdc7
	.uleb128 0x5
	.byte	0x5
	.byte	0xe3
	.long	0xde2
	.uleb128 0x5
	.byte	0x5
	.byte	0xe4
	.long	0xdf7
	.uleb128 0x5
	.byte	0x5
	.byte	0xe5
	.long	0xe16
	.uleb128 0x5
	.byte	0x5
	.byte	0xe7
	.long	0xe35
	.uleb128 0x5
	.byte	0x5
	.byte	0xe8
	.long	0xe4f
	.uleb128 0x9
	.string	"div"
	.byte	0x5
	.byte	0xd5
	.long	.LASF207
	.long	0xb1e
	.uleb128 0xa
	.long	0xb17
	.uleb128 0xa
	.long	0xb17
	.byte	0
	.byte	0
	.uleb128 0xb
	.long	.LASF9
	.byte	0x7
	.byte	0xd8
	.long	0x2a3
	.uleb128 0xc
	.byte	0x8
	.byte	0x7
	.long	.LASF2
	.uleb128 0xc
	.byte	0x1
	.byte	0x8
	.long	.LASF3
	.uleb128 0xc
	.byte	0x2
	.byte	0x7
	.long	.LASF4
	.uleb128 0xc
	.byte	0x4
	.byte	0x7
	.long	.LASF5
	.uleb128 0xc
	.byte	0x1
	.byte	0x6
	.long	.LASF6
	.uleb128 0xc
	.byte	0x2
	.byte	0x5
	.long	.LASF7
	.uleb128 0xd
	.long	0x2c6
	.uleb128 0xe
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0xc
	.byte	0x8
	.byte	0x5
	.long	.LASF8
	.uleb128 0xb
	.long	.LASF10
	.byte	0x8
	.byte	0x8c
	.long	0x2d9
	.uleb128 0xb
	.long	.LASF11
	.byte	0x8
	.byte	0x8d
	.long	0x2d9
	.uleb128 0xb
	.long	.LASF12
	.byte	0x8
	.byte	0x90
	.long	0x2d9
	.uleb128 0xb
	.long	.LASF13
	.byte	0x8
	.byte	0x94
	.long	0x2d9
	.uleb128 0xf
	.byte	0x8
	.uleb128 0x10
	.byte	0x8
	.long	0x314
	.uleb128 0xc
	.byte	0x1
	.byte	0x6
	.long	.LASF14
	.uleb128 0x11
	.long	0x314
	.uleb128 0x12
	.long	.LASF55
	.byte	0xd8
	.byte	0x9
	.byte	0xf5
	.long	0x4a0
	.uleb128 0x13
	.long	.LASF15
	.byte	0x9
	.byte	0xf6
	.long	0x2d2
	.byte	0
	.uleb128 0x13
	.long	.LASF16
	.byte	0x9
	.byte	0xfb
	.long	0x30e
	.byte	0x8
	.uleb128 0x13
	.long	.LASF17
	.byte	0x9
	.byte	0xfc
	.long	0x30e
	.byte	0x10
	.uleb128 0x13
	.long	.LASF18
	.byte	0x9
	.byte	0xfd
	.long	0x30e
	.byte	0x18
	.uleb128 0x13
	.long	.LASF19
	.byte	0x9
	.byte	0xfe
	.long	0x30e
	.byte	0x20
	.uleb128 0x13
	.long	.LASF20
	.byte	0x9
	.byte	0xff
	.long	0x30e
	.byte	0x28
	.uleb128 0x14
	.long	.LASF21
	.byte	0x9
	.value	0x100
	.long	0x30e
	.byte	0x30
	.uleb128 0x14
	.long	.LASF22
	.byte	0x9
	.value	0x101
	.long	0x30e
	.byte	0x38
	.uleb128 0x14
	.long	.LASF23
	.byte	0x9
	.value	0x102
	.long	0x30e
	.byte	0x40
	.uleb128 0x14
	.long	.LASF24
	.byte	0x9
	.value	0x104
	.long	0x30e
	.byte	0x48
	.uleb128 0x14
	.long	.LASF25
	.byte	0x9
	.value	0x105
	.long	0x30e
	.byte	0x50
	.uleb128 0x14
	.long	.LASF26
	.byte	0x9
	.value	0x106
	.long	0x30e
	.byte	0x58
	.uleb128 0x14
	.long	.LASF27
	.byte	0x9
	.value	0x108
	.long	0x572
	.byte	0x60
	.uleb128 0x14
	.long	.LASF28
	.byte	0x9
	.value	0x10a
	.long	0x578
	.byte	0x68
	.uleb128 0x14
	.long	.LASF29
	.byte	0x9
	.value	0x10c
	.long	0x2d2
	.byte	0x70
	.uleb128 0x14
	.long	.LASF30
	.byte	0x9
	.value	0x110
	.long	0x2d2
	.byte	0x74
	.uleb128 0x14
	.long	.LASF31
	.byte	0x9
	.value	0x112
	.long	0x2e0
	.byte	0x78
	.uleb128 0x14
	.long	.LASF32
	.byte	0x9
	.value	0x116
	.long	0x2b1
	.byte	0x80
	.uleb128 0x14
	.long	.LASF33
	.byte	0x9
	.value	0x117
	.long	0x2bf
	.byte	0x82
	.uleb128 0x14
	.long	.LASF34
	.byte	0x9
	.value	0x118
	.long	0x57e
	.byte	0x83
	.uleb128 0x14
	.long	.LASF35
	.byte	0x9
	.value	0x11c
	.long	0x58e
	.byte	0x88
	.uleb128 0x14
	.long	.LASF36
	.byte	0x9
	.value	0x125
	.long	0x2eb
	.byte	0x90
	.uleb128 0x14
	.long	.LASF37
	.byte	0x9
	.value	0x12d
	.long	0x30c
	.byte	0x98
	.uleb128 0x14
	.long	.LASF38
	.byte	0x9
	.value	0x12e
	.long	0x30c
	.byte	0xa0
	.uleb128 0x14
	.long	.LASF39
	.byte	0x9
	.value	0x12f
	.long	0x30c
	.byte	0xa8
	.uleb128 0x14
	.long	.LASF40
	.byte	0x9
	.value	0x130
	.long	0x30c
	.byte	0xb0
	.uleb128 0x14
	.long	.LASF41
	.byte	0x9
	.value	0x132
	.long	0x298
	.byte	0xb8
	.uleb128 0x14
	.long	.LASF42
	.byte	0x9
	.value	0x133
	.long	0x2d2
	.byte	0xc0
	.uleb128 0x14
	.long	.LASF43
	.byte	0x9
	.value	0x135
	.long	0x594
	.byte	0xc4
	.byte	0
	.uleb128 0xb
	.long	.LASF44
	.byte	0xa
	.byte	0x7
	.long	0x320
	.uleb128 0x15
	.byte	0x8
	.byte	0xb
	.byte	0xe
	.long	.LASF50
	.long	0x4ef
	.uleb128 0x16
	.byte	0x4
	.byte	0xb
	.byte	0x11
	.long	0x4d6
	.uleb128 0x17
	.long	.LASF45
	.byte	0xb
	.byte	0x12
	.long	0x2b8
	.uleb128 0x17
	.long	.LASF46
	.byte	0xb
	.byte	0x13
	.long	0x4ef
	.byte	0
	.uleb128 0x13
	.long	.LASF47
	.byte	0xb
	.byte	0xf
	.long	0x2d2
	.byte	0
	.uleb128 0x13
	.long	.LASF48
	.byte	0xb
	.byte	0x14
	.long	0x4b7
	.byte	0x4
	.byte	0
	.uleb128 0x18
	.long	0x314
	.long	0x4ff
	.uleb128 0x19
	.long	0x2a3
	.byte	0x3
	.byte	0
	.uleb128 0xb
	.long	.LASF49
	.byte	0xb
	.byte	0x15
	.long	0x4ab
	.uleb128 0x15
	.byte	0x10
	.byte	0xc
	.byte	0x1b
	.long	.LASF51
	.long	0x52f
	.uleb128 0x13
	.long	.LASF52
	.byte	0xc
	.byte	0x1c
	.long	0x2e0
	.byte	0
	.uleb128 0x13
	.long	.LASF53
	.byte	0xc
	.byte	0x1d
	.long	0x4ff
	.byte	0x8
	.byte	0
	.uleb128 0xb
	.long	.LASF54
	.byte	0xc
	.byte	0x1e
	.long	0x50a
	.uleb128 0x1a
	.long	.LASF208
	.byte	0x9
	.byte	0x9a
	.uleb128 0x12
	.long	.LASF56
	.byte	0x18
	.byte	0x9
	.byte	0xa0
	.long	0x572
	.uleb128 0x13
	.long	.LASF57
	.byte	0x9
	.byte	0xa1
	.long	0x572
	.byte	0
	.uleb128 0x13
	.long	.LASF58
	.byte	0x9
	.byte	0xa2
	.long	0x578
	.byte	0x8
	.uleb128 0x13
	.long	.LASF59
	.byte	0x9
	.byte	0xa6
	.long	0x2d2
	.byte	0x10
	.byte	0
	.uleb128 0x10
	.byte	0x8
	.long	0x541
	.uleb128 0x10
	.byte	0x8
	.long	0x320
	.uleb128 0x18
	.long	0x314
	.long	0x58e
	.uleb128 0x19
	.long	0x2a3
	.byte	0
	.byte	0
	.uleb128 0x10
	.byte	0x8
	.long	0x53a
	.uleb128 0x18
	.long	0x314
	.long	0x5a4
	.uleb128 0x19
	.long	0x2a3
	.byte	0x13
	.byte	0
	.uleb128 0x1b
	.long	.LASF209
	.uleb128 0x1c
	.long	.LASF60
	.byte	0x9
	.value	0x13f
	.long	0x5a4
	.uleb128 0x1c
	.long	.LASF61
	.byte	0x9
	.value	0x140
	.long	0x5a4
	.uleb128 0x1c
	.long	.LASF62
	.byte	0x9
	.value	0x141
	.long	0x5a4
	.uleb128 0x10
	.byte	0x8
	.long	0x31b
	.uleb128 0x11
	.long	0x5cd
	.uleb128 0xb
	.long	.LASF63
	.byte	0xd
	.byte	0x4e
	.long	0x52f
	.uleb128 0x11
	.long	0x5d8
	.uleb128 0x1d
	.long	.LASF64
	.byte	0xd
	.byte	0x87
	.long	0x578
	.uleb128 0x1d
	.long	.LASF65
	.byte	0xd
	.byte	0x88
	.long	0x578
	.uleb128 0x1d
	.long	.LASF66
	.byte	0xd
	.byte	0x89
	.long	0x578
	.uleb128 0x1d
	.long	.LASF67
	.byte	0xe
	.byte	0x1a
	.long	0x2d2
	.uleb128 0x18
	.long	0x5d3
	.long	0x61f
	.uleb128 0x1e
	.byte	0
	.uleb128 0x1d
	.long	.LASF68
	.byte	0xe
	.byte	0x1b
	.long	0x614
	.uleb128 0x1d
	.long	.LASF69
	.byte	0xe
	.byte	0x1e
	.long	0x2d2
	.uleb128 0x1d
	.long	.LASF70
	.byte	0xe
	.byte	0x1f
	.long	0x614
	.uleb128 0x1f
	.long	.LASF85
	.byte	0xd
	.value	0x2f5
	.long	0x652
	.uleb128 0xa
	.long	0x652
	.byte	0
	.uleb128 0x10
	.byte	0x8
	.long	0x4a0
	.uleb128 0x20
	.long	.LASF71
	.byte	0xd
	.byte	0xc7
	.long	0x2d2
	.long	0x66d
	.uleb128 0xa
	.long	0x652
	.byte	0
	.uleb128 0x21
	.long	.LASF72
	.byte	0xd
	.value	0x2f7
	.long	0x2d2
	.long	0x683
	.uleb128 0xa
	.long	0x652
	.byte	0
	.uleb128 0x21
	.long	.LASF73
	.byte	0xd
	.value	0x2f9
	.long	0x2d2
	.long	0x699
	.uleb128 0xa
	.long	0x652
	.byte	0
	.uleb128 0x20
	.long	.LASF74
	.byte	0xd
	.byte	0xcc
	.long	0x2d2
	.long	0x6ae
	.uleb128 0xa
	.long	0x652
	.byte	0
	.uleb128 0x21
	.long	.LASF75
	.byte	0xd
	.value	0x1dd
	.long	0x2d2
	.long	0x6c4
	.uleb128 0xa
	.long	0x652
	.byte	0
	.uleb128 0x21
	.long	.LASF76
	.byte	0xd
	.value	0x2db
	.long	0x2d2
	.long	0x6df
	.uleb128 0xa
	.long	0x652
	.uleb128 0xa
	.long	0x6df
	.byte	0
	.uleb128 0x10
	.byte	0x8
	.long	0x5d8
	.uleb128 0x21
	.long	.LASF77
	.byte	0xd
	.value	0x234
	.long	0x30e
	.long	0x705
	.uleb128 0xa
	.long	0x30e
	.uleb128 0xa
	.long	0x2d2
	.uleb128 0xa
	.long	0x652
	.byte	0
	.uleb128 0x20
	.long	.LASF78
	.byte	0xd
	.byte	0xe8
	.long	0x652
	.long	0x71f
	.uleb128 0xa
	.long	0x5cd
	.uleb128 0xa
	.long	0x5cd
	.byte	0
	.uleb128 0x21
	.long	.LASF79
	.byte	0xd
	.value	0x286
	.long	0x298
	.long	0x744
	.uleb128 0xa
	.long	0x30c
	.uleb128 0xa
	.long	0x298
	.uleb128 0xa
	.long	0x298
	.uleb128 0xa
	.long	0x652
	.byte	0
	.uleb128 0x20
	.long	.LASF80
	.byte	0xd
	.byte	0xee
	.long	0x652
	.long	0x763
	.uleb128 0xa
	.long	0x5cd
	.uleb128 0xa
	.long	0x5cd
	.uleb128 0xa
	.long	0x652
	.byte	0
	.uleb128 0x21
	.long	.LASF81
	.byte	0xd
	.value	0x2ac
	.long	0x2d2
	.long	0x783
	.uleb128 0xa
	.long	0x652
	.uleb128 0xa
	.long	0x2d9
	.uleb128 0xa
	.long	0x2d2
	.byte	0
	.uleb128 0x21
	.long	.LASF82
	.byte	0xd
	.value	0x2e0
	.long	0x2d2
	.long	0x79e
	.uleb128 0xa
	.long	0x652
	.uleb128 0xa
	.long	0x79e
	.byte	0
	.uleb128 0x10
	.byte	0x8
	.long	0x5e3
	.uleb128 0x21
	.long	.LASF83
	.byte	0xd
	.value	0x2b1
	.long	0x2d9
	.long	0x7ba
	.uleb128 0xa
	.long	0x652
	.byte	0
	.uleb128 0x21
	.long	.LASF84
	.byte	0xd
	.value	0x1de
	.long	0x2d2
	.long	0x7d0
	.uleb128 0xa
	.long	0x652
	.byte	0
	.uleb128 0x22
	.long	.LASF92
	.byte	0xd
	.value	0x1e4
	.long	0x2d2
	.uleb128 0x1f
	.long	.LASF86
	.byte	0xd
	.value	0x307
	.long	0x7ee
	.uleb128 0xa
	.long	0x5cd
	.byte	0
	.uleb128 0x20
	.long	.LASF87
	.byte	0xd
	.byte	0x90
	.long	0x2d2
	.long	0x803
	.uleb128 0xa
	.long	0x5cd
	.byte	0
	.uleb128 0x20
	.long	.LASF88
	.byte	0xd
	.byte	0x92
	.long	0x2d2
	.long	0x81d
	.uleb128 0xa
	.long	0x5cd
	.uleb128 0xa
	.long	0x5cd
	.byte	0
	.uleb128 0x1f
	.long	.LASF89
	.byte	0xd
	.value	0x2b6
	.long	0x82f
	.uleb128 0xa
	.long	0x652
	.byte	0
	.uleb128 0x1f
	.long	.LASF90
	.byte	0xd
	.value	0x122
	.long	0x846
	.uleb128 0xa
	.long	0x652
	.uleb128 0xa
	.long	0x30e
	.byte	0
	.uleb128 0x21
	.long	.LASF91
	.byte	0xd
	.value	0x126
	.long	0x2d2
	.long	0x86b
	.uleb128 0xa
	.long	0x652
	.uleb128 0xa
	.long	0x30e
	.uleb128 0xa
	.long	0x2d2
	.uleb128 0xa
	.long	0x298
	.byte	0
	.uleb128 0x23
	.long	.LASF93
	.byte	0xd
	.byte	0x9f
	.long	0x652
	.uleb128 0x20
	.long	.LASF94
	.byte	0xd
	.byte	0xad
	.long	0x30e
	.long	0x88b
	.uleb128 0xa
	.long	0x30e
	.byte	0
	.uleb128 0x21
	.long	.LASF95
	.byte	0xd
	.value	0x27f
	.long	0x2d2
	.long	0x8a6
	.uleb128 0xa
	.long	0x2d2
	.uleb128 0xa
	.long	0x652
	.byte	0
	.uleb128 0xb
	.long	.LASF96
	.byte	0xf
	.byte	0x7
	.long	0x2f6
	.uleb128 0xb
	.long	.LASF97
	.byte	0x10
	.byte	0x7
	.long	0x301
	.uleb128 0x11
	.long	0x8b1
	.uleb128 0x24
	.string	"tm"
	.byte	0x38
	.byte	0x11
	.byte	0x7
	.long	0x951
	.uleb128 0x13
	.long	.LASF98
	.byte	0x11
	.byte	0x9
	.long	0x2d2
	.byte	0
	.uleb128 0x13
	.long	.LASF99
	.byte	0x11
	.byte	0xa
	.long	0x2d2
	.byte	0x4
	.uleb128 0x13
	.long	.LASF100
	.byte	0x11
	.byte	0xb
	.long	0x2d2
	.byte	0x8
	.uleb128 0x13
	.long	.LASF101
	.byte	0x11
	.byte	0xc
	.long	0x2d2
	.byte	0xc
	.uleb128 0x13
	.long	.LASF102
	.byte	0x11
	.byte	0xd
	.long	0x2d2
	.byte	0x10
	.uleb128 0x13
	.long	.LASF103
	.byte	0x11
	.byte	0xe
	.long	0x2d2
	.byte	0x14
	.uleb128 0x13
	.long	.LASF104
	.byte	0x11
	.byte	0xf
	.long	0x2d2
	.byte	0x18
	.uleb128 0x13
	.long	.LASF105
	.byte	0x11
	.byte	0x10
	.long	0x2d2
	.byte	0x1c
	.uleb128 0x13
	.long	.LASF106
	.byte	0x11
	.byte	0x11
	.long	0x2d2
	.byte	0x20
	.uleb128 0x13
	.long	.LASF107
	.byte	0x11
	.byte	0x14
	.long	0x2d9
	.byte	0x28
	.uleb128 0x13
	.long	.LASF108
	.byte	0x11
	.byte	0x15
	.long	0x5cd
	.byte	0x30
	.byte	0
	.uleb128 0x11
	.long	0x8c1
	.uleb128 0x18
	.long	0x30e
	.long	0x966
	.uleb128 0x19
	.long	0x2a3
	.byte	0x1
	.byte	0
	.uleb128 0x1d
	.long	.LASF109
	.byte	0x12
	.byte	0x9f
	.long	0x956
	.uleb128 0x1d
	.long	.LASF110
	.byte	0x12
	.byte	0xa0
	.long	0x2d2
	.uleb128 0x1d
	.long	.LASF111
	.byte	0x12
	.byte	0xa1
	.long	0x2d9
	.uleb128 0x1d
	.long	.LASF112
	.byte	0x12
	.byte	0xa6
	.long	0x956
	.uleb128 0x1d
	.long	.LASF113
	.byte	0x12
	.byte	0xae
	.long	0x2d2
	.uleb128 0x1d
	.long	.LASF114
	.byte	0x12
	.byte	0xaf
	.long	0x2d9
	.uleb128 0x1c
	.long	.LASF115
	.byte	0x12
	.value	0x118
	.long	0x2d2
	.uleb128 0x23
	.long	.LASF116
	.byte	0x12
	.byte	0x48
	.long	0x8a6
	.uleb128 0x20
	.long	.LASF117
	.byte	0x12
	.byte	0x4e
	.long	0x9d9
	.long	0x9d9
	.uleb128 0xa
	.long	0x8b1
	.uleb128 0xa
	.long	0x8b1
	.byte	0
	.uleb128 0xc
	.byte	0x8
	.byte	0x4
	.long	.LASF118
	.uleb128 0x20
	.long	.LASF119
	.byte	0x12
	.byte	0x52
	.long	0x8b1
	.long	0x9f5
	.uleb128 0xa
	.long	0x9f5
	.byte	0
	.uleb128 0x10
	.byte	0x8
	.long	0x8c1
	.uleb128 0x20
	.long	.LASF120
	.byte	0x12
	.byte	0x4b
	.long	0x8b1
	.long	0xa10
	.uleb128 0xa
	.long	0xa10
	.byte	0
	.uleb128 0x10
	.byte	0x8
	.long	0x8b1
	.uleb128 0x20
	.long	.LASF121
	.byte	0x12
	.byte	0x8b
	.long	0x30e
	.long	0xa2b
	.uleb128 0xa
	.long	0xa2b
	.byte	0
	.uleb128 0x10
	.byte	0x8
	.long	0x951
	.uleb128 0x20
	.long	.LASF122
	.byte	0x12
	.byte	0x8e
	.long	0x30e
	.long	0xa46
	.uleb128 0xa
	.long	0xa46
	.byte	0
	.uleb128 0x10
	.byte	0x8
	.long	0x8bc
	.uleb128 0x20
	.long	.LASF123
	.byte	0x12
	.byte	0x77
	.long	0x9f5
	.long	0xa61
	.uleb128 0xa
	.long	0xa46
	.byte	0
	.uleb128 0x20
	.long	.LASF124
	.byte	0x12
	.byte	0x7b
	.long	0x9f5
	.long	0xa76
	.uleb128 0xa
	.long	0xa46
	.byte	0
	.uleb128 0xc
	.byte	0x20
	.byte	0x3
	.long	.LASF125
	.uleb128 0xc
	.byte	0x10
	.byte	0x4
	.long	.LASF126
	.uleb128 0xc
	.byte	0x4
	.byte	0x4
	.long	.LASF127
	.uleb128 0xc
	.byte	0x10
	.byte	0x4
	.long	.LASF128
	.uleb128 0x15
	.byte	0x8
	.byte	0x13
	.byte	0x3b
	.long	.LASF129
	.long	0xab7
	.uleb128 0x13
	.long	.LASF130
	.byte	0x13
	.byte	0x3c
	.long	0x2d2
	.byte	0
	.uleb128 0x25
	.string	"rem"
	.byte	0x13
	.byte	0x3d
	.long	0x2d2
	.byte	0x4
	.byte	0
	.uleb128 0xb
	.long	.LASF131
	.byte	0x13
	.byte	0x3e
	.long	0xa92
	.uleb128 0x15
	.byte	0x10
	.byte	0x13
	.byte	0x43
	.long	.LASF132
	.long	0xae7
	.uleb128 0x13
	.long	.LASF130
	.byte	0x13
	.byte	0x44
	.long	0x2d9
	.byte	0
	.uleb128 0x25
	.string	"rem"
	.byte	0x13
	.byte	0x45
	.long	0x2d9
	.byte	0x8
	.byte	0
	.uleb128 0xb
	.long	.LASF133
	.byte	0x13
	.byte	0x46
	.long	0xac2
	.uleb128 0x15
	.byte	0x10
	.byte	0x13
	.byte	0x4d
	.long	.LASF134
	.long	0xb17
	.uleb128 0x13
	.long	.LASF130
	.byte	0x13
	.byte	0x4e
	.long	0xb17
	.byte	0
	.uleb128 0x25
	.string	"rem"
	.byte	0x13
	.byte	0x4f
	.long	0xb17
	.byte	0x8
	.byte	0
	.uleb128 0xc
	.byte	0x8
	.byte	0x5
	.long	.LASF135
	.uleb128 0xb
	.long	.LASF136
	.byte	0x13
	.byte	0x50
	.long	0xaf2
	.uleb128 0xc
	.byte	0x8
	.byte	0x7
	.long	.LASF137
	.uleb128 0xb
	.long	.LASF138
	.byte	0x14
	.byte	0x1b
	.long	0x2a3
	.uleb128 0x26
	.long	.LASF139
	.byte	0x13
	.value	0x325
	.long	0xb47
	.uleb128 0x10
	.byte	0x8
	.long	0xb4d
	.uleb128 0x27
	.long	0x2d2
	.long	0xb61
	.uleb128 0xa
	.long	0xb61
	.uleb128 0xa
	.long	0xb61
	.byte	0
	.uleb128 0x10
	.byte	0x8
	.long	0xb67
	.uleb128 0x28
	.uleb128 0x21
	.long	.LASF140
	.byte	0x13
	.value	0x250
	.long	0x2d2
	.long	0xb7e
	.uleb128 0xa
	.long	0xb7e
	.byte	0
	.uleb128 0x10
	.byte	0x8
	.long	0xb84
	.uleb128 0x29
	.uleb128 0x2a
	.long	.LASF210
	.byte	0x13
	.value	0x255
	.long	.LASF210
	.long	0x2d2
	.long	0xb9f
	.uleb128 0xa
	.long	0xb7e
	.byte	0
	.uleb128 0x20
	.long	.LASF141
	.byte	0x13
	.byte	0x65
	.long	0x9d9
	.long	0xbb4
	.uleb128 0xa
	.long	0x5cd
	.byte	0
	.uleb128 0x20
	.long	.LASF142
	.byte	0x13
	.byte	0x68
	.long	0x2d2
	.long	0xbc9
	.uleb128 0xa
	.long	0x5cd
	.byte	0
	.uleb128 0x20
	.long	.LASF143
	.byte	0x13
	.byte	0x6b
	.long	0x2d9
	.long	0xbde
	.uleb128 0xa
	.long	0x5cd
	.byte	0
	.uleb128 0x21
	.long	.LASF144
	.byte	0x13
	.value	0x331
	.long	0x30c
	.long	0xc08
	.uleb128 0xa
	.long	0xb61
	.uleb128 0xa
	.long	0xb61
	.uleb128 0xa
	.long	0x298
	.uleb128 0xa
	.long	0x298
	.uleb128 0xa
	.long	0xb3b
	.byte	0
	.uleb128 0x2b
	.string	"div"
	.byte	0x13
	.value	0x351
	.long	0xab7
	.long	0xc23
	.uleb128 0xa
	.long	0x2d2
	.uleb128 0xa
	.long	0x2d2
	.byte	0
	.uleb128 0x21
	.long	.LASF145
	.byte	0x13
	.value	0x277
	.long	0x30e
	.long	0xc39
	.uleb128 0xa
	.long	0x5cd
	.byte	0
	.uleb128 0x21
	.long	.LASF146
	.byte	0x13
	.value	0x353
	.long	0xae7
	.long	0xc54
	.uleb128 0xa
	.long	0x2d9
	.uleb128 0xa
	.long	0x2d9
	.byte	0
	.uleb128 0x21
	.long	.LASF147
	.byte	0x13
	.value	0x397
	.long	0x2d2
	.long	0xc6f
	.uleb128 0xa
	.long	0x5cd
	.uleb128 0xa
	.long	0x298
	.byte	0
	.uleb128 0x21
	.long	.LASF148
	.byte	0x13
	.value	0x3a2
	.long	0x298
	.long	0xc8f
	.uleb128 0xa
	.long	0xc8f
	.uleb128 0xa
	.long	0x5cd
	.uleb128 0xa
	.long	0x298
	.byte	0
	.uleb128 0x10
	.byte	0x8
	.long	0xc95
	.uleb128 0xc
	.byte	0x4
	.byte	0x5
	.long	.LASF149
	.uleb128 0x11
	.long	0xc95
	.uleb128 0x21
	.long	.LASF150
	.byte	0x13
	.value	0x39a
	.long	0x2d2
	.long	0xcc1
	.uleb128 0xa
	.long	0xc8f
	.uleb128 0xa
	.long	0x5cd
	.uleb128 0xa
	.long	0x298
	.byte	0
	.uleb128 0x1f
	.long	.LASF151
	.byte	0x13
	.value	0x33b
	.long	0xce2
	.uleb128 0xa
	.long	0x30c
	.uleb128 0xa
	.long	0x298
	.uleb128 0xa
	.long	0x298
	.uleb128 0xa
	.long	0xb3b
	.byte	0
	.uleb128 0x2c
	.long	.LASF152
	.byte	0x13
	.value	0x26c
	.long	0xcf4
	.uleb128 0xa
	.long	0x2d2
	.byte	0
	.uleb128 0x22
	.long	.LASF153
	.byte	0x13
	.value	0x1c5
	.long	0x2d2
	.uleb128 0x1f
	.long	.LASF154
	.byte	0x13
	.value	0x1c7
	.long	0xd12
	.uleb128 0xa
	.long	0x2b8
	.byte	0
	.uleb128 0x20
	.long	.LASF155
	.byte	0x13
	.byte	0x75
	.long	0x9d9
	.long	0xd2c
	.uleb128 0xa
	.long	0x5cd
	.uleb128 0xa
	.long	0xd2c
	.byte	0
	.uleb128 0x10
	.byte	0x8
	.long	0x30e
	.uleb128 0x20
	.long	.LASF156
	.byte	0x13
	.byte	0xb0
	.long	0x2d9
	.long	0xd51
	.uleb128 0xa
	.long	0x5cd
	.uleb128 0xa
	.long	0xd2c
	.uleb128 0xa
	.long	0x2d2
	.byte	0
	.uleb128 0x20
	.long	.LASF157
	.byte	0x13
	.byte	0xb4
	.long	0x2a3
	.long	0xd70
	.uleb128 0xa
	.long	0x5cd
	.uleb128 0xa
	.long	0xd2c
	.uleb128 0xa
	.long	0x2d2
	.byte	0
	.uleb128 0x21
	.long	.LASF158
	.byte	0x13
	.value	0x30d
	.long	0x2d2
	.long	0xd86
	.uleb128 0xa
	.long	0x5cd
	.byte	0
	.uleb128 0x21
	.long	.LASF159
	.byte	0x13
	.value	0x3a5
	.long	0x298
	.long	0xda6
	.uleb128 0xa
	.long	0x30e
	.uleb128 0xa
	.long	0xda6
	.uleb128 0xa
	.long	0x298
	.byte	0
	.uleb128 0x10
	.byte	0x8
	.long	0xc9c
	.uleb128 0x21
	.long	.LASF160
	.byte	0x13
	.value	0x39e
	.long	0x2d2
	.long	0xdc7
	.uleb128 0xa
	.long	0x30e
	.uleb128 0xa
	.long	0xc95
	.byte	0
	.uleb128 0x21
	.long	.LASF161
	.byte	0x13
	.value	0x357
	.long	0xb1e
	.long	0xde2
	.uleb128 0xa
	.long	0xb17
	.uleb128 0xa
	.long	0xb17
	.byte	0
	.uleb128 0x20
	.long	.LASF162
	.byte	0x13
	.byte	0x70
	.long	0xb17
	.long	0xdf7
	.uleb128 0xa
	.long	0x5cd
	.byte	0
	.uleb128 0x20
	.long	.LASF163
	.byte	0x13
	.byte	0xc8
	.long	0xb17
	.long	0xe16
	.uleb128 0xa
	.long	0x5cd
	.uleb128 0xa
	.long	0xd2c
	.uleb128 0xa
	.long	0x2d2
	.byte	0
	.uleb128 0x20
	.long	.LASF164
	.byte	0x13
	.byte	0xcd
	.long	0xb29
	.long	0xe35
	.uleb128 0xa
	.long	0x5cd
	.uleb128 0xa
	.long	0xd2c
	.uleb128 0xa
	.long	0x2d2
	.byte	0
	.uleb128 0x20
	.long	.LASF165
	.byte	0x13
	.byte	0x7b
	.long	0xa84
	.long	0xe4f
	.uleb128 0xa
	.long	0x5cd
	.uleb128 0xa
	.long	0xd2c
	.byte	0
	.uleb128 0x20
	.long	.LASF166
	.byte	0x13
	.byte	0x7e
	.long	0xa8b
	.long	0xe69
	.uleb128 0xa
	.long	0x5cd
	.uleb128 0xa
	.long	0xd2c
	.byte	0
	.uleb128 0x2d
	.byte	0x7
	.byte	0x4
	.long	0x2b8
	.byte	0x15
	.byte	0x2c
	.long	0xead
	.uleb128 0x2e
	.long	.LASF167
	.byte	0
	.uleb128 0x2e
	.long	.LASF168
	.byte	0x1
	.uleb128 0x2e
	.long	.LASF169
	.byte	0x2
	.uleb128 0x2e
	.long	.LASF170
	.byte	0x3
	.uleb128 0x2e
	.long	.LASF171
	.byte	0
	.uleb128 0x2e
	.long	.LASF172
	.byte	0x1
	.uleb128 0x2e
	.long	.LASF173
	.byte	0x2
	.uleb128 0x2e
	.long	.LASF174
	.byte	0
	.uleb128 0x2e
	.long	.LASF175
	.byte	0
	.byte	0
	.uleb128 0x2d
	.byte	0x7
	.byte	0x4
	.long	0x2b8
	.byte	0x15
	.byte	0x42
	.long	0xed3
	.uleb128 0x2e
	.long	.LASF176
	.byte	0
	.uleb128 0x2e
	.long	.LASF177
	.byte	0
	.uleb128 0x2e
	.long	.LASF178
	.byte	0x1
	.uleb128 0x2e
	.long	.LASF179
	.byte	0x1
	.byte	0
	.uleb128 0x2d
	.byte	0x7
	.byte	0x4
	.long	0x2b8
	.byte	0x15
	.byte	0x74
	.long	0xef9
	.uleb128 0x2e
	.long	.LASF180
	.byte	0
	.uleb128 0x2e
	.long	.LASF181
	.byte	0x1
	.uleb128 0x2e
	.long	.LASF182
	.byte	0x2
	.uleb128 0x2e
	.long	.LASF183
	.byte	0
	.byte	0
	.uleb128 0x18
	.long	0x5d3
	.long	0xf09
	.uleb128 0x19
	.long	0x2a3
	.byte	0x40
	.byte	0
	.uleb128 0x11
	.long	0xef9
	.uleb128 0x1c
	.long	.LASF184
	.byte	0x16
	.value	0x11e
	.long	0xf09
	.uleb128 0x1c
	.long	.LASF185
	.byte	0x16
	.value	0x11f
	.long	0xf09
	.uleb128 0x5
	.byte	0x17
	.byte	0x27
	.long	0xb68
	.uleb128 0x5
	.byte	0x17
	.byte	0x2b
	.long	0xb85
	.uleb128 0x5
	.byte	0x17
	.byte	0x2e
	.long	0xce2
	.uleb128 0x5
	.byte	0x17
	.byte	0x33
	.long	0xab7
	.uleb128 0x5
	.byte	0x17
	.byte	0x34
	.long	0xae7
	.uleb128 0x2b
	.string	"abs"
	.byte	0x13
	.value	0x345
	.long	0x2d2
	.long	0xf5f
	.uleb128 0xa
	.long	0x2d2
	.byte	0
	.uleb128 0x5
	.byte	0x17
	.byte	0x36
	.long	0xf49
	.uleb128 0x5
	.byte	0x17
	.byte	0x37
	.long	0xb9f
	.uleb128 0x5
	.byte	0x17
	.byte	0x38
	.long	0xbb4
	.uleb128 0x5
	.byte	0x17
	.byte	0x39
	.long	0xbc9
	.uleb128 0x5
	.byte	0x17
	.byte	0x3a
	.long	0xbde
	.uleb128 0x5
	.byte	0x17
	.byte	0x3c
	.long	0x27d
	.uleb128 0x5
	.byte	0x17
	.byte	0x3e
	.long	0xc23
	.uleb128 0x5
	.byte	0x17
	.byte	0x40
	.long	0xc39
	.uleb128 0x5
	.byte	0x17
	.byte	0x43
	.long	0xc54
	.uleb128 0x5
	.byte	0x17
	.byte	0x44
	.long	0xc6f
	.uleb128 0x5
	.byte	0x17
	.byte	0x45
	.long	0xca1
	.uleb128 0x5
	.byte	0x17
	.byte	0x47
	.long	0xcc1
	.uleb128 0x5
	.byte	0x17
	.byte	0x48
	.long	0xcf4
	.uleb128 0x5
	.byte	0x17
	.byte	0x4a
	.long	0xd00
	.uleb128 0x5
	.byte	0x17
	.byte	0x4b
	.long	0xd12
	.uleb128 0x5
	.byte	0x17
	.byte	0x4c
	.long	0xd32
	.uleb128 0x5
	.byte	0x17
	.byte	0x4d
	.long	0xd51
	.uleb128 0x5
	.byte	0x17
	.byte	0x4e
	.long	0xd70
	.uleb128 0x5
	.byte	0x17
	.byte	0x50
	.long	0xd86
	.uleb128 0x5
	.byte	0x17
	.byte	0x51
	.long	0xdac
	.uleb128 0x4
	.byte	0x1
	.byte	0xb
	.long	0x2d
	.uleb128 0x18
	.long	0xb17
	.long	0x1005
	.uleb128 0x2f
	.long	0x2a3
	.long	0x1e847f
	.byte	0
	.uleb128 0x30
	.long	.LASF186
	.byte	0x1
	.byte	0xd
	.long	0xff2
	.uleb128 0x9
	.byte	0x3
	.quad	var2
	.uleb128 0x30
	.long	.LASF187
	.byte	0x1
	.byte	0xd
	.long	0xff2
	.uleb128 0x9
	.byte	0x3
	.quad	var3
	.uleb128 0x30
	.long	.LASF188
	.byte	0x1
	.byte	0xd
	.long	0xff2
	.uleb128 0x9
	.byte	0x3
	.quad	var10
	.uleb128 0x30
	.long	.LASF189
	.byte	0x1
	.byte	0xd
	.long	0xff2
	.uleb128 0x9
	.byte	0x3
	.quad	var11
	.uleb128 0x31
	.string	"key"
	.byte	0x1
	.byte	0x12
	.long	0x2cd
	.uleb128 0x9
	.byte	0x3
	.quad	key
	.uleb128 0x31
	.string	"HR"
	.byte	0x1
	.byte	0x13
	.long	0x2b8
	.uleb128 0x9
	.byte	0x3
	.quad	HR
	.uleb128 0x30
	.long	.LASF190
	.byte	0x1
	.byte	0x13
	.long	0x2b8
	.uleb128 0x9
	.byte	0x3
	.quad	mask_HR
	.uleb128 0x18
	.long	0x2cd
	.long	0x10a7
	.uleb128 0x19
	.long	0x2a3
	.byte	0xf
	.byte	0
	.uleb128 0xd
	.long	0x1097
	.uleb128 0x31
	.string	"PHT"
	.byte	0x1
	.byte	0x16
	.long	0x10a7
	.uleb128 0x9
	.byte	0x3
	.quad	PHT
	.uleb128 0x18
	.long	0x10dd
	.long	0x10d1
	.uleb128 0x19
	.long	0x2a3
	.byte	0x1
	.byte	0
	.uleb128 0xd
	.long	0x10c1
	.uleb128 0xc
	.byte	0x1
	.byte	0x2
	.long	.LASF191
	.uleb128 0xd
	.long	0x10d6
	.uleb128 0x30
	.long	.LASF192
	.byte	0x1
	.byte	0x17
	.long	0x10d1
	.uleb128 0x9
	.byte	0x3
	.quad	coeff
	.uleb128 0x32
	.long	.LASF211
	.byte	0x1
	.byte	0x33
	.long	0x2d2
	.quad	.LFB3686
	.quad	.LFE3686-.LFB3686
	.uleb128 0x1
	.byte	0x9c
	.long	0x1318
	.uleb128 0x33
	.long	.LASF193
	.byte	0x1
	.byte	0x33
	.long	0x2d2
	.uleb128 0x3
	.byte	0x91
	.sleb128 -132
	.uleb128 0x33
	.long	.LASF194
	.byte	0x1
	.byte	0x33
	.long	0xd2c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -144
	.uleb128 0x34
	.long	.LASF195
	.byte	0x1
	.byte	0xb6
	.quad	.L36
	.uleb128 0x34
	.long	.LASF196
	.byte	0x1
	.byte	0x8c
	.quad	.L26
	.uleb128 0x34
	.long	.LASF197
	.byte	0x1
	.byte	0x62
	.quad	.L16
	.uleb128 0x35
	.string	"c2"
	.byte	0x1
	.byte	0x35
	.long	0xb17
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x35
	.string	"c3"
	.byte	0x1
	.byte	0x35
	.long	0xb17
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x35
	.string	"c10"
	.byte	0x1
	.byte	0x35
	.long	0xb17
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x35
	.string	"c11"
	.byte	0x1
	.byte	0x35
	.long	0xb17
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x35
	.string	"tr1"
	.byte	0x1
	.byte	0x4a
	.long	0x2d2
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x35
	.string	"tr2"
	.byte	0x1
	.byte	0x4a
	.long	0x2d2
	.uleb128 0x3
	.byte	0x91
	.sleb128 -108
	.uleb128 0x36
	.long	.LASF198
	.byte	0x1
	.byte	0x4a
	.long	0x2d2
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0x36
	.long	.LASF199
	.byte	0x1
	.byte	0x4d
	.long	0xb30
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x36
	.long	.LASF200
	.byte	0x1
	.byte	0x4f
	.long	0x2b8
	.uleb128 0x3
	.byte	0x91
	.sleb128 -92
	.uleb128 0x36
	.long	.LASF201
	.byte	0x1
	.byte	0x52
	.long	0x8a6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x35
	.string	"end"
	.byte	0x1
	.byte	0xbc
	.long	0x8a6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x36
	.long	.LASF202
	.byte	0x1
	.byte	0xc2
	.long	0x9d9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x37
	.quad	.LBB21
	.quad	.LBE21-.LBB21
	.long	0x1233
	.uleb128 0x35
	.string	"i"
	.byte	0x1
	.byte	0x43
	.long	0x2d2
	.uleb128 0x3
	.byte	0x91
	.sleb128 -116
	.byte	0
	.uleb128 0x38
	.quad	.LBB22
	.quad	.LBE22-.LBB22
	.uleb128 0x35
	.string	"j"
	.byte	0x1
	.byte	0x53
	.long	0x2d2
	.uleb128 0x3
	.byte	0x91
	.sleb128 -100
	.uleb128 0x38
	.quad	.LBB24
	.quad	.LBE24-.LBB24
	.uleb128 0x35
	.string	"i"
	.byte	0x1
	.byte	0x55
	.long	0x2d2
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x37
	.quad	.LBB31
	.quad	.LBE31-.LBB31
	.long	0x1294
	.uleb128 0x36
	.long	.LASF203
	.byte	0x1
	.byte	0x70
	.long	0x2c6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.byte	0
	.uleb128 0x37
	.quad	.LBB37
	.quad	.LBE37-.LBB37
	.long	0x12b9
	.uleb128 0x36
	.long	.LASF203
	.byte	0x1
	.byte	0x9a
	.long	0x2c6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -118
	.byte	0
	.uleb128 0x39
	.long	0x1398
	.quad	.LBB26
	.quad	.LBE26-.LBB26
	.byte	0x1
	.byte	0x64
	.uleb128 0x39
	.long	0x138c
	.quad	.LBB29
	.quad	.LBE29-.LBB29
	.byte	0x1
	.byte	0x6c
	.uleb128 0x39
	.long	0x1398
	.quad	.LBB32
	.quad	.LBE32-.LBB32
	.byte	0x1
	.byte	0x8e
	.uleb128 0x39
	.long	0x138c
	.quad	.LBB35
	.quad	.LBE35-.LBB35
	.byte	0x1
	.byte	0x96
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3a
	.long	.LASF212
	.byte	0x1
	.byte	0x1a
	.long	.LASF213
	.long	0x30c
	.quad	.LFB3685
	.quad	.LFE3685-.LFB3685
	.uleb128 0x1
	.byte	0x9c
	.long	0x138c
	.uleb128 0x3b
	.string	"arg"
	.byte	0x1
	.byte	0x1a
	.long	0x30c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x37
	.quad	.LBB19
	.quad	.LBE19-.LBB19
	.long	0x136d
	.uleb128 0x35
	.string	"i"
	.byte	0x1
	.byte	0x1d
	.long	0x2d2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x38
	.quad	.LBB20
	.quad	.LBE20-.LBB20
	.uleb128 0x35
	.string	"j"
	.byte	0x1
	.byte	0x21
	.long	0x2d2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0x3c
	.long	.LASF214
	.byte	0x2
	.byte	0x3d
	.long	.LASF215
	.byte	0x3
	.uleb128 0x3d
	.long	.LASF216
	.byte	0x2
	.byte	0x32
	.long	.LASF217
	.long	0x2b8
	.byte	0x3
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x39
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x39
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x3a
	.byte	0
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x18
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x8
	.byte	0
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x18
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x39
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x39
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x3a
	.byte	0
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x18
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x17
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x15
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2b
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2c
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x87
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2d
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2e
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x2f
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x30
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x31
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x32
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x33
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x34
	.uleb128 0xa
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x35
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x36
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x37
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x38
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x39
	.uleb128 0x1d
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x3a
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3b
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x3c
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x34
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x3d
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x34
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF162:
	.string	"atoll"
.LASF210:
	.string	"at_quick_exit"
.LASF7:
	.string	"short int"
.LASF124:
	.string	"localtime"
.LASF16:
	.string	"_IO_read_ptr"
.LASF28:
	.string	"_chain"
.LASF100:
	.string	"tm_hour"
.LASF130:
	.string	"quot"
.LASF9:
	.string	"size_t"
.LASF1:
	.string	"__cxx11"
.LASF34:
	.string	"_shortbuf"
.LASF213:
	.string	"_Z9predictorPv"
.LASF62:
	.string	"_IO_2_1_stderr_"
.LASF22:
	.string	"_IO_buf_base"
.LASF159:
	.string	"wcstombs"
.LASF134:
	.string	"7lldiv_t"
.LASF137:
	.string	"long long unsigned int"
.LASF87:
	.string	"remove"
.LASF49:
	.string	"__mbstate_t"
.LASF140:
	.string	"atexit"
.LASF131:
	.string	"div_t"
.LASF81:
	.string	"fseek"
.LASF135:
	.string	"long long int"
.LASF6:
	.string	"signed char"
.LASF147:
	.string	"mblen"
.LASF217:
	.string	"_Z7_xbeginv"
.LASF179:
	.string	"PTHREAD_MUTEX_ROBUST_NP"
.LASF188:
	.string	"var10"
.LASF189:
	.string	"var11"
.LASF17:
	.string	"_IO_read_end"
.LASF111:
	.string	"__timezone"
.LASF185:
	.string	"sys_siglist"
.LASF8:
	.string	"long int"
.LASF29:
	.string	"_fileno"
.LASF169:
	.string	"PTHREAD_MUTEX_ERRORCHECK_NP"
.LASF156:
	.string	"strtol"
.LASF15:
	.string	"_flags"
.LASF23:
	.string	"_IO_buf_end"
.LASF126:
	.string	"__float128"
.LASF133:
	.string	"ldiv_t"
.LASF118:
	.string	"double"
.LASF31:
	.string	"_old_offset"
.LASF36:
	.string	"_offset"
.LASF88:
	.string	"rename"
.LASF115:
	.string	"getdate_err"
.LASF54:
	.string	"_G_fpos_t"
.LASF4:
	.string	"short unsigned int"
.LASF125:
	.string	"__unknown__"
.LASF150:
	.string	"mbtowc"
.LASF183:
	.string	"PTHREAD_RWLOCK_DEFAULT_NP"
.LASF151:
	.string	"qsort"
.LASF96:
	.string	"clock_t"
.LASF52:
	.string	"__pos"
.LASF102:
	.string	"tm_mon"
.LASF114:
	.string	"timezone"
.LASF182:
	.string	"PTHREAD_RWLOCK_PREFER_WRITER_NONRECURSIVE_NP"
.LASF117:
	.string	"difftime"
.LASF56:
	.string	"_IO_marker"
.LASF64:
	.string	"stdin"
.LASF103:
	.string	"tm_year"
.LASF173:
	.string	"PTHREAD_MUTEX_ERRORCHECK"
.LASF82:
	.string	"fsetpos"
.LASF46:
	.string	"__wchb"
.LASF84:
	.string	"getc"
.LASF175:
	.string	"PTHREAD_MUTEX_FAST_NP"
.LASF119:
	.string	"mktime"
.LASF186:
	.string	"var2"
.LASF187:
	.string	"var3"
.LASF73:
	.string	"ferror"
.LASF209:
	.string	"_IO_FILE_plus"
.LASF214:
	.string	"_xend"
.LASF153:
	.string	"rand"
.LASF20:
	.string	"_IO_write_ptr"
.LASF113:
	.string	"daylight"
.LASF67:
	.string	"sys_nerr"
.LASF58:
	.string	"_sbuf"
.LASF129:
	.string	"5div_t"
.LASF94:
	.string	"tmpnam"
.LASF202:
	.string	"elapsed"
.LASF106:
	.string	"tm_isdst"
.LASF165:
	.string	"strtof"
.LASF93:
	.string	"tmpfile"
.LASF161:
	.string	"lldiv"
.LASF32:
	.string	"_cur_column"
.LASF45:
	.string	"__wch"
.LASF75:
	.string	"fgetc"
.LASF149:
	.string	"wchar_t"
.LASF12:
	.string	"__clock_t"
.LASF191:
	.string	"bool"
.LASF35:
	.string	"_lock"
.LASF204:
	.string	"GNU C++14 7.5.0 -mrtm -mtune=generic -march=x86-64 -g -O0 -fstack-protector-strong"
.LASF30:
	.string	"_flags2"
.LASF42:
	.string	"_mode"
.LASF77:
	.string	"fgets"
.LASF65:
	.string	"stdout"
.LASF198:
	.string	"iter"
.LASF122:
	.string	"ctime"
.LASF121:
	.string	"asctime"
.LASF60:
	.string	"_IO_2_1_stdin_"
.LASF86:
	.string	"perror"
.LASF145:
	.string	"getenv"
.LASF177:
	.string	"PTHREAD_MUTEX_STALLED_NP"
.LASF99:
	.string	"tm_min"
.LASF171:
	.string	"PTHREAD_MUTEX_NORMAL"
.LASF128:
	.string	"long double"
.LASF105:
	.string	"tm_yday"
.LASF144:
	.string	"bsearch"
.LASF85:
	.string	"clearerr"
.LASF24:
	.string	"_IO_save_base"
.LASF216:
	.string	"_xbegin"
.LASF79:
	.string	"fread"
.LASF21:
	.string	"_IO_write_end"
.LASF95:
	.string	"ungetc"
.LASF51:
	.string	"9_G_fpos_t"
.LASF205:
	.string	"traced_ifthenelse.cpp"
.LASF146:
	.string	"ldiv"
.LASF208:
	.string	"_IO_lock_t"
.LASF55:
	.string	"_IO_FILE"
.LASF120:
	.string	"time"
.LASF70:
	.string	"_sys_errlist"
.LASF10:
	.string	"__off_t"
.LASF136:
	.string	"lldiv_t"
.LASF97:
	.string	"time_t"
.LASF66:
	.string	"stderr"
.LASF90:
	.string	"setbuf"
.LASF127:
	.string	"float"
.LASF78:
	.string	"fopen"
.LASF59:
	.string	"_pos"
.LASF168:
	.string	"PTHREAD_MUTEX_RECURSIVE_NP"
.LASF68:
	.string	"sys_errlist"
.LASF74:
	.string	"fflush"
.LASF27:
	.string	"_markers"
.LASF148:
	.string	"mbstowcs"
.LASF53:
	.string	"__state"
.LASF154:
	.string	"srand"
.LASF206:
	.string	"/sputnik/toIntel/predictorTest"
.LASF123:
	.string	"gmtime"
.LASF141:
	.string	"atof"
.LASF196:
	.string	"TRACE2"
.LASF138:
	.string	"pthread_t"
.LASF142:
	.string	"atoi"
.LASF143:
	.string	"atol"
.LASF3:
	.string	"unsigned char"
.LASF132:
	.string	"6ldiv_t"
.LASF170:
	.string	"PTHREAD_MUTEX_ADAPTIVE_NP"
.LASF181:
	.string	"PTHREAD_RWLOCK_PREFER_WRITER_NP"
.LASF180:
	.string	"PTHREAD_RWLOCK_PREFER_READER_NP"
.LASF203:
	.string	"correctKey"
.LASF199:
	.string	"pred_id"
.LASF166:
	.string	"strtold"
.LASF195:
	.string	"finish_label"
.LASF69:
	.string	"_sys_nerr"
.LASF163:
	.string	"strtoll"
.LASF201:
	.string	"start"
.LASF112:
	.string	"tzname"
.LASF61:
	.string	"_IO_2_1_stdout_"
.LASF160:
	.string	"wctomb"
.LASF107:
	.string	"tm_gmtoff"
.LASF47:
	.string	"__count"
.LASF110:
	.string	"__daylight"
.LASF207:
	.string	"_ZN9__gnu_cxx3divExx"
.LASF48:
	.string	"__value"
.LASF176:
	.string	"PTHREAD_MUTEX_STALLED"
.LASF152:
	.string	"quick_exit"
.LASF2:
	.string	"long unsigned int"
.LASF14:
	.string	"char"
.LASF5:
	.string	"unsigned int"
.LASF164:
	.string	"strtoull"
.LASF63:
	.string	"fpos_t"
.LASF72:
	.string	"feof"
.LASF155:
	.string	"strtod"
.LASF104:
	.string	"tm_wday"
.LASF71:
	.string	"fclose"
.LASF80:
	.string	"freopen"
.LASF57:
	.string	"_next"
.LASF11:
	.string	"__off64_t"
.LASF192:
	.string	"coeff"
.LASF18:
	.string	"_IO_read_base"
.LASF26:
	.string	"_IO_save_end"
.LASF215:
	.string	"_Z5_xendv"
.LASF184:
	.string	"_sys_siglist"
.LASF92:
	.string	"getchar"
.LASF174:
	.string	"PTHREAD_MUTEX_DEFAULT"
.LASF101:
	.string	"tm_mday"
.LASF37:
	.string	"__pad1"
.LASF38:
	.string	"__pad2"
.LASF39:
	.string	"__pad3"
.LASF40:
	.string	"__pad4"
.LASF41:
	.string	"__pad5"
.LASF50:
	.string	"11__mbstate_t"
.LASF13:
	.string	"__time_t"
.LASF43:
	.string	"_unused2"
.LASF98:
	.string	"tm_sec"
.LASF194:
	.string	"argv"
.LASF157:
	.string	"strtoul"
.LASF200:
	.string	"status"
.LASF108:
	.string	"tm_zone"
.LASF172:
	.string	"PTHREAD_MUTEX_RECURSIVE"
.LASF190:
	.string	"mask_HR"
.LASF25:
	.string	"_IO_backup_base"
.LASF167:
	.string	"PTHREAD_MUTEX_TIMED_NP"
.LASF91:
	.string	"setvbuf"
.LASF158:
	.string	"system"
.LASF33:
	.string	"_vtable_offset"
.LASF139:
	.string	"__compar_fn_t"
.LASF193:
	.string	"argc"
.LASF197:
	.string	"TRACE1"
.LASF89:
	.string	"rewind"
.LASF83:
	.string	"ftell"
.LASF44:
	.string	"FILE"
.LASF76:
	.string	"fgetpos"
.LASF116:
	.string	"clock"
.LASF109:
	.string	"__tzname"
.LASF211:
	.string	"main"
.LASF19:
	.string	"_IO_write_base"
.LASF212:
	.string	"predictor"
.LASF178:
	.string	"PTHREAD_MUTEX_ROBUST"
.LASF0:
	.string	"__gnu_cxx"
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
