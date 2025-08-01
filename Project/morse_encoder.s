	.file	"morse_encoder.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.Ltext0:
	.cfi_sections	.debug_frame
.global	usart_init
	.type	usart_init, @function
usart_init:
.LFB1:
	.file 1 "morse_encoder.c"
	.loc 1 55 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 60 0
	ldi r26,lo8(-63)
	ldi r27,0
	ld r24,X
	ori r24,lo8(8)
	st X,r24
	.loc 1 65 0
	ld r24,X
	ori r24,lo8(16)
	st X,r24
	.loc 1 70 0
	ldi r24,lo8(103)
	sts 196,r24
	.loc 1 71 0
	sts 197,__zero_reg__
	.loc 1 77 0
	ldi r30,lo8(-62)
	ldi r31,0
	ld r24,Z
	andi r24,lo8(127)
	st Z,r24
	.loc 1 78 0
	ld r24,Z
	andi r24,lo8(-65)
	st Z,r24
	.loc 1 83 0
	ld r24,X
	andi r24,lo8(-5)
	st X,r24
	.loc 1 84 0
	ld r24,Z
	ori r24,lo8(6)
	st Z,r24
	.loc 1 90 0
	ld r24,Z
	andi r24,lo8(-17)
	st Z,r24
	.loc 1 91 0
	ld r24,Z
	andi r24,lo8(-33)
	st Z,r24
	.loc 1 95 0
	ld r24,Z
	andi r24,lo8(-9)
	st Z,r24
/* epilogue start */
	.loc 1 97 0
	ret
	.cfi_endproc
.LFE1:
	.size	usart_init, .-usart_init
.global	usart_send
	.type	usart_send, @function
usart_send:
.LFB2:
	.loc 1 100 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LVL0:
.L3:
	.loc 1 103 0 discriminator 1
	lds r25,192
	.loc 1 103 0 discriminator 1
	sbrs r25,5
	rjmp .L3
	.loc 1 106 0
	sts 198,r24
/* epilogue start */
	.loc 1 107 0
	ret
	.cfi_endproc
.LFE2:
	.size	usart_send, .-usart_send
.global	usart_receive
	.type	usart_receive, @function
usart_receive:
.LFB3:
	.loc 1 110 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.L7:
	.loc 1 112 0 discriminator 1
	lds r24,192
	.loc 1 112 0 discriminator 1
	sbrs r24,7
	rjmp .L7
	.loc 1 115 0
	lds r24,198
/* epilogue start */
	.loc 1 116 0
	ret
	.cfi_endproc
.LFE3:
	.size	usart_receive, .-usart_receive
.global	usart_send_string
	.type	usart_send_string, @function
usart_send_string:
.LFB4:
	.loc 1 120 0
	.cfi_startproc
.LVL1:
	push r28
.LCFI0:
	.cfi_def_cfa_offset 3
	.cfi_offset 28, -2
	push r29
.LCFI1:
	.cfi_def_cfa_offset 4
	.cfi_offset 29, -3
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r28,r24
.LVL2:
.L10:
	.loc 1 121 0
	ld r24,Y+
.LVL3:
	cpse r24,__zero_reg__
	rjmp .L11
/* epilogue start */
	.loc 1 126 0
	pop r29
	pop r28
.LVL4:
	ret
.LVL5:
.L11:
	.loc 1 123 0
	call usart_send
.LVL6:
	rjmp .L10
	.cfi_endproc
.LFE4:
	.size	usart_send_string, .-usart_send_string
.global	delay_timer
	.type	delay_timer, @function
delay_timer:
.LFB5:
	.loc 1 200 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 202 0
	sts 128,__zero_reg__
	.loc 1 203 0
	ldi r24,lo8(8)
	sts 129,r24
	.loc 1 209 0
	ldi r24,lo8(-89)
	ldi r25,lo8(97)
	sts 136+1,r25
	sts 136,r24
	.loc 1 212 0
	lds r24,129
	ori r24,lo8(3)
	sts 129,r24
	.loc 1 215 0
	sbi 0x16,1
.L13:
	.loc 1 218 0 discriminator 1
	sbis 0x16,1
	rjmp .L13
	.loc 1 221 0
	sts 129,__zero_reg__
	.loc 1 223 0
	sbi 0x16,1
/* epilogue start */
	.loc 1 224 0
	ret
	.cfi_endproc
.LFE5:
	.size	delay_timer, .-delay_timer
.global	decode_morse
	.type	decode_morse, @function
decode_morse:
.LFB6:
	.loc 1 275 0
	.cfi_startproc
.LVL7:
	push r14
.LCFI2:
	.cfi_def_cfa_offset 3
	.cfi_offset 14, -2
	push r15
.LCFI3:
	.cfi_def_cfa_offset 4
	.cfi_offset 15, -3
	push r16
.LCFI4:
	.cfi_def_cfa_offset 5
	.cfi_offset 16, -4
	push r17
.LCFI5:
	.cfi_def_cfa_offset 6
	.cfi_offset 17, -5
	push r28
.LCFI6:
	.cfi_def_cfa_offset 7
	.cfi_offset 28, -6
	push r29
.LCFI7:
	.cfi_def_cfa_offset 8
	.cfi_offset 29, -7
/* prologue: function */
/* frame size = 0 */
/* stack size = 6 */
.L__stack_usage = 6
	movw r14,r24
.LVL8:
	ldi r16,lo8(morseDecodeTable)
	ldi r17,hi8(morseDecodeTable)
.LBB2:
	.loc 1 276 0
	ldi r29,0
	ldi r28,0
.LVL9:
.L17:
	.loc 1 276 0 is_stmt 0 discriminator 1
	movw r30,r16
	ld r24,Z
	ldd r25,Z+1
	sbiw r24,0
	brne .L20
.LBE2:
	.loc 1 279 0 is_stmt 1
	ldi r24,lo8(63)
	rjmp .L16
.L20:
.LBB3:
	.loc 1 277 0
	movw r22,r14
	call strcmp
.LVL10:
	subi r16,-3
	sbci r17,-1
	or r24,r25
	brne .L18
	.loc 1 277 0 is_stmt 0 discriminator 1
	movw r30,r28
	lsl r30
	rol r31
	add r30,r28
	adc r31,r29
	subi r30,lo8(-(morseDecodeTable))
	sbci r31,hi8(-(morseDecodeTable))
	ldd r24,Z+2
.L16:
/* epilogue start */
.LBE3:
	.loc 1 280 0 is_stmt 1
	pop r29
	pop r28
.LVL11:
	pop r17
	pop r16
	pop r15
	pop r14
.LVL12:
	ret
.LVL13:
.L18:
.LBB4:
	.loc 1 276 0 discriminator 2
	adiw r28,1
.LVL14:
	rjmp .L17
.LBE4:
	.cfi_endproc
.LFE6:
	.size	decode_morse, .-decode_morse
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	".-.-."
	.text
.global	is_AR
	.type	is_AR, @function
is_AR:
.LFB7:
	.loc 1 283 0
	.cfi_startproc
.LVL15:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 284 0
	ldi r22,lo8(.LC0)
	ldi r23,hi8(.LC0)
	call strcmp
.LVL16:
	ldi r18,lo8(1)
	or r24,r25
	breq .L22
	ldi r18,0
.L22:
	.loc 1 285 0
	mov r24,r18
/* epilogue start */
	ret
	.cfi_endproc
.LFE7:
	.size	is_AR, .-is_AR
.global	delay_ms
	.type	delay_ms, @function
delay_ms:
.LFB8:
	.loc 1 288 0
	.cfi_startproc
.LVL17:
	push r28
.LCFI8:
	.cfi_def_cfa_offset 3
	.cfi_offset 28, -2
	push r29
.LCFI9:
	.cfi_def_cfa_offset 4
	.cfi_offset 29, -3
	rcall .
.LCFI10:
	.cfi_def_cfa_offset 6
	in r28,__SP_L__
	in r29,__SP_H__
.LCFI11:
	.cfi_def_cfa_register 28
/* prologue: function */
/* frame size = 2 */
/* stack size = 4 */
.L__stack_usage = 4
.L27:
	.loc 1 289 0
.LVL18:
	sbiw r24,1
	brcc .L30
/* epilogue start */
	.loc 1 292 0
	pop __tmp_reg__
	pop __tmp_reg__
	pop r29
	pop r28
	ret
.L30:
.LBB5:
	.loc 1 290 0
	std Y+2,__zero_reg__
	std Y+1,__zero_reg__
.L28:
	.loc 1 290 0 is_stmt 0 discriminator 1
	ldd r18,Y+1
	ldd r19,Y+2
	cpi r18,-48
	sbci r19,7
	brsh .L27
	.loc 1 290 0 discriminator 3
/* #APP */
 ;  290 "morse_encoder.c" 1
	nop
 ;  0 "" 2
/* #NOAPP */
	ldd r18,Y+1
	ldd r19,Y+2
	subi r18,-1
	sbci r19,-1
	std Y+2,r19
	std Y+1,r18
	rjmp .L28
.LBE5:
	.cfi_endproc
.LFE8:
	.size	delay_ms, .-delay_ms
	.section	.rodata.str1.1
.LC1:
	.string	"Morse Decoder"
.LC2:
	.string	"Decoded:"
	.section	.text.startup,"ax",@progbits
.global	main
	.type	main, @function
main:
.LFB9:
	.loc 1 294 0 is_stmt 1
	.cfi_startproc
	push r28
.LCFI12:
	.cfi_def_cfa_offset 3
	.cfi_offset 28, -2
	push r29
.LCFI13:
	.cfi_def_cfa_offset 4
	.cfi_offset 29, -3
	in r28,__SP_L__
	in r29,__SP_H__
.LCFI14:
	.cfi_def_cfa_register 28
	sbiw r28,42
.LCFI15:
	.cfi_def_cfa_offset 46
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 42 */
/* stack size = 44 */
.L__stack_usage = 44
	.loc 1 296 0
	sbi 0x4,5
	.loc 1 297 0
	sbi 0x4,1
	.loc 1 299 0
	cbi 0xa,7
	.loc 1 300 0
	sbi 0xb,7
	.loc 1 303 0
	ldi r24,lo8(12)
	call lcd_init
.LVL19:
	.loc 1 304 0
	call lcd_clrscr
.LVL20:
	.loc 1 305 0
	ldi r22,0
	ldi r24,0
	call lcd_gotoxy
.LVL21:
	.loc 1 306 0
	ldi r24,lo8(.LC1)
	ldi r25,hi8(.LC1)
	call lcd_puts
.LVL22:
	.loc 1 308 0
	movw r12,r28
	ldi r18,34
	add r12,r18
	adc r13,__zero_reg__
	ldi r24,lo8(9)
	movw r30,r12
	0:
	st Z+,__zero_reg__
	dec r24
	brne 0b
	.loc 1 309 0
	movw r24,r28
	adiw r24,1
	movw r14,r24
	ldi r24,lo8(33)
	movw r30,r14
	0:
	st Z+,__zero_reg__
	dec r24
	brne 0b
.LVL23:
	.loc 1 311 0
	ldi r24,lo8(1)
	.loc 1 310 0
	ldi r17,0
	ldi r16,0
	.loc 1 361 0
	ldi r25,lo8(32)
	mov r8,r25
.LBB6:
	.loc 1 341 0
	ldi r18,lo8(45)
	mov r3,r18
	.loc 1 339 0
	ldi r19,lo8(46)
	mov r2,r19
.LVL24:
.L32:
.LBE6:
	.loc 1 321 0
	in r25,0x9
	.loc 1 321 0
	mov r9,r25
	rol r9
	clr r9
	rol r9
.LVL25:
	.loc 1 322 0
	sbrc r25,7
	rjmp .L33
	.loc 1 322 0 is_stmt 0 discriminator 1
	tst r24
	breq .L34
.LBB7:
	.loc 1 324 0 is_stmt 1
	sbi 0x5,5
	.loc 1 325 0
	sbi 0x5,1
.LVL26:
	.loc 1 327 0
	mov r11,__zero_reg__
	mov r10,__zero_reg__
.LVL27:
.L35:
	.loc 1 328 0
	sbis 0x9,7
	rjmp .L36
	.loc 1 334 0
	cbi 0x5,5
	.loc 1 335 0
	cbi 0x5,1
	mov r24,r16
	ldi r25,0
	subi r16,lo8(-(1))
.LVL28:
	.loc 1 339 0
	add r24,r12
	adc r25,r13
.LVL29:
	movw r30,r24
	.loc 1 338 0
	ldi r18,-56
	cp r10,r18
	cpc r11,__zero_reg__
	brsh .L37
.LVL30:
	.loc 1 339 0
	st Z,r2
.LVL31:
.L38:
	.loc 1 343 0
	movw r30,r12
	add r30,r16
	adc r31,__zero_reg__
	st Z,__zero_reg__
.LVL32:
.L34:
.LBE7:
	.loc 1 379 0
	mov r24,r9
	rjmp .L32
.LVL33:
.L36:
.LBB8:
	.loc 1 329 0
	ldi r24,lo8(1)
	ldi r25,0
	call delay_ms
.LVL34:
	.loc 1 330 0
	ldi r31,-1
	sub r10,r31
	sbc r11,r31
.LVL35:
	rjmp .L35
.LVL36:
.L37:
	.loc 1 341 0
	st Z,r3
	rjmp .L38
.LVL37:
.L33:
.LBE8:
	.loc 1 345 0 discriminator 1
	cpse r24,__zero_reg__
	rjmp .L34
	.loc 1 347 0
	mov r4,__zero_reg__
	mov r5,__zero_reg__
	movw r6,r4
.LVL38:
.L39:
	.loc 1 348 0
	sbis 0x9,7
	rjmp .L40
	.loc 1 348 0 discriminator 1
	ldi r18,120
	cp r4,r18
	ldi r18,5
	cpc r5,r18
	cpc r6,__zero_reg__
	cpc r7,__zero_reg__
	brne .L41
.L44:
.LVL39:
	.loc 1 355 0
	cpse r16,__zero_reg__
	rjmp .L42
.LVL40:
.L43:
	.loc 1 361 0
	ldi r24,lo8(1)
	add r24,r17
.LVL41:
	movw r30,r14
	add r30,r17
	adc r31,__zero_reg__
	st Z,r8
	.loc 1 362 0
	movw r30,r14
	add r30,r24
	adc r31,__zero_reg__
	st Z,__zero_reg__
	.loc 1 361 0
	mov r17,r24
.LVL42:
.L62:
	.loc 1 370 0
	ldi r16,0
.LVL43:
.L46:
	.loc 1 373 0
	movw r24,r12
	call is_AR
.LVL44:
	tst r24
	breq .L34
	.loc 1 374 0
	call lcd_clrscr
.LVL45:
	.loc 1 375 0
	ldi r22,0
	ldi r24,0
	call lcd_gotoxy
.LVL46:
	.loc 1 376 0
	ldi r24,lo8(.LC2)
	ldi r25,hi8(.LC2)
	call lcd_puts
.LVL47:
	.loc 1 377 0
	ldi r22,0
	ldi r24,lo8(1)
	call lcd_gotoxy
.LVL48:
	.loc 1 378 0
	movw r24,r14
	call lcd_puts
.LVL49:
	.loc 1 380 0
	std Y+34,__zero_reg__
	std Y+1,__zero_reg__
	.loc 1 381 0
	ldi r24,lo8(-48)
	ldi r25,lo8(7)
	call delay_ms
.LVL50:
	.loc 1 382 0
	call lcd_clrscr
.LVL51:
	.loc 1 383 0
	ldi r22,0
	ldi r24,0
	call lcd_gotoxy
.LVL52:
	.loc 1 384 0
	ldi r24,lo8(.LC1)
	ldi r25,hi8(.LC1)
	call lcd_puts
.LVL53:
	.loc 1 379 0
	ldi r17,0
	ldi r16,0
	rjmp .L34
.LVL54:
.L41:
	.loc 1 349 0
	ldi r24,lo8(1)
	ldi r25,0
	call delay_ms
.LVL55:
	.loc 1 350 0
	ldi r31,-1
	sub r4,r31
	sbc r5,r31
	sbc r6,r31
	sbc r7,r31
.LVL56:
	.loc 1 351 0
	sbic 0x9,7
	rjmp .L39
.L40:
	.loc 1 354 0
	ldi r24,120
	cp r4,r24
	ldi r24,5
	cpc r5,r24
	cpc r6,__zero_reg__
	cpc r7,__zero_reg__
	brne .+2
	rjmp .L44
	.loc 1 363 0
	ldi r25,88
	cp r4,r25
	ldi r25,2
	cpc r5,r25
	cpc r6,__zero_reg__
	cpc r7,__zero_reg__
	brsh .+2
	rjmp .L46
	.loc 1 364 0
	tst r16
	breq .L47
.LBB9:
	.loc 1 365 0
	movw r24,r12
	call decode_morse
.LVL57:
	.loc 1 366 0
	movw r30,r14
	add r30,r17
	adc r31,__zero_reg__
	st Z,r24
.LVL58:
	.loc 1 368 0
	std Y+34,__zero_reg__
	.loc 1 366 0
	subi r17,lo8(-(1))
.LVL59:
.L47:
.LBE9:
	.loc 1 370 0
	movw r30,r14
	add r30,r17
	adc r31,__zero_reg__
	st Z,__zero_reg__
	rjmp .L62
.LVL60:
.L42:
	ldi r16,lo8(1)
.LVL61:
	add r16,r17
.LBB10:
	.loc 1 356 0
	movw r24,r12
	call decode_morse
.LVL62:
	.loc 1 357 0
	movw r30,r14
	add r30,r17
	adc r31,__zero_reg__
	st Z,r24
.LVL63:
	.loc 1 359 0
	std Y+34,__zero_reg__
	.loc 1 357 0
	mov r17,r16
	rjmp .L43
.LBE10:
	.cfi_endproc
.LFE9:
	.size	main, .-main
.global	morseDecodeTable
	.section	.rodata.str1.1
.LC3:
	.string	".-"
.LC4:
	.string	"-..."
.LC5:
	.string	"-.-."
.LC6:
	.string	"-.."
.LC7:
	.string	"."
.LC8:
	.string	"..-."
.LC9:
	.string	"--."
.LC10:
	.string	"...."
.LC11:
	.string	".."
.LC12:
	.string	".---"
.LC13:
	.string	"-.-"
.LC14:
	.string	".-.."
.LC15:
	.string	"--"
.LC16:
	.string	"-."
.LC17:
	.string	"---"
.LC18:
	.string	".--."
.LC19:
	.string	"--.-"
.LC20:
	.string	".-."
.LC21:
	.string	"..."
.LC22:
	.string	"-"
.LC23:
	.string	"..-"
.LC24:
	.string	"...-"
.LC25:
	.string	".--"
.LC26:
	.string	"-..-"
.LC27:
	.string	"-.--"
.LC28:
	.string	"--.."
.LC29:
	.string	"-----"
.LC30:
	.string	".----"
.LC31:
	.string	"..---"
.LC32:
	.string	"...--"
.LC33:
	.string	"....-"
.LC34:
	.string	"....."
.LC35:
	.string	"-...."
.LC36:
	.string	"--..."
.LC37:
	.string	"---.."
.LC38:
	.string	"----."
	.section	.rodata
	.type	morseDecodeTable, @object
	.size	morseDecodeTable, 111
morseDecodeTable:
	.word	.LC3
	.byte	65
	.word	.LC4
	.byte	66
	.word	.LC5
	.byte	67
	.word	.LC6
	.byte	68
	.word	.LC7
	.byte	69
	.word	.LC8
	.byte	70
	.word	.LC9
	.byte	71
	.word	.LC10
	.byte	72
	.word	.LC11
	.byte	73
	.word	.LC12
	.byte	74
	.word	.LC13
	.byte	75
	.word	.LC14
	.byte	76
	.word	.LC15
	.byte	77
	.word	.LC16
	.byte	78
	.word	.LC17
	.byte	79
	.word	.LC18
	.byte	80
	.word	.LC19
	.byte	81
	.word	.LC20
	.byte	82
	.word	.LC21
	.byte	83
	.word	.LC22
	.byte	84
	.word	.LC23
	.byte	85
	.word	.LC24
	.byte	86
	.word	.LC25
	.byte	87
	.word	.LC26
	.byte	88
	.word	.LC27
	.byte	89
	.word	.LC28
	.byte	90
	.word	.LC29
	.byte	48
	.word	.LC30
	.byte	49
	.word	.LC31
	.byte	50
	.word	.LC32
	.byte	51
	.word	.LC33
	.byte	52
	.word	.LC34
	.byte	53
	.word	.LC35
	.byte	54
	.word	.LC36
	.byte	55
	.word	.LC37
	.byte	56
	.word	.LC38
	.byte	57
	.word	0
	.byte	0
.global	morseCodeMap
	.data
	.type	morseCodeMap, @object
	.size	morseCodeMap, 72
morseCodeMap:
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.word	.LC10
	.word	.LC11
	.word	.LC12
	.word	.LC13
	.word	.LC14
	.word	.LC15
	.word	.LC16
	.word	.LC17
	.word	.LC18
	.word	.LC19
	.word	.LC20
	.word	.LC21
	.word	.LC22
	.word	.LC23
	.word	.LC24
	.word	.LC25
	.word	.LC26
	.word	.LC27
	.word	.LC28
	.word	.LC29
	.word	.LC30
	.word	.LC31
	.word	.LC32
	.word	.LC33
	.word	.LC34
	.word	.LC35
	.word	.LC36
	.word	.LC37
	.word	.LC38
	.text
.Letext0:
	.file 2 "/usr/lib/avr/include/stdint.h"
	.file 3 "lcd.h"
	.file 4 "/usr/lib/avr/include/string.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x5b1
	.word	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF41
	.byte	0xc
	.long	.LASF42
	.long	.LASF43
	.long	.Ldebug_ranges0+0x40
	.long	0
	.long	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF0
	.uleb128 0x3
	.long	.LASF2
	.byte	0x2
	.byte	0x7e
	.long	0x3b
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x4
	.byte	0x2
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.long	.LASF3
	.byte	0x2
	.byte	0x80
	.long	0x5e
	.uleb128 0x5
	.long	0x49
	.uleb128 0x6
	.long	0x49
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF4
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.long	.LASF5
	.uleb128 0x3
	.long	.LASF6
	.byte	0x2
	.byte	0x82
	.long	0x77
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF7
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF8
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF9
	.uleb128 0x7
	.long	0x9c
	.long	0x9c
	.uleb128 0x8
	.long	0x5e
	.byte	0x23
	.byte	0
	.uleb128 0x9
	.byte	0x2
	.long	0xa9
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF10
	.uleb128 0x5
	.long	0xa2
	.uleb128 0xa
	.long	.LASF14
	.byte	0x1
	.byte	0x85
	.long	0x8c
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	morseCodeMap
	.uleb128 0xb
	.byte	0x3
	.byte	0x1
	.word	0x101
	.long	0xe8
	.uleb128 0xc
	.long	.LASF11
	.byte	0x1
	.word	0x102
	.long	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0xc
	.long	.LASF12
	.byte	0x1
	.word	0x103
	.long	0xa2
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0
	.uleb128 0xd
	.long	.LASF13
	.byte	0x1
	.word	0x104
	.long	0xc0
	.uleb128 0x5
	.long	0xe8
	.uleb128 0x7
	.long	0xf4
	.long	0x109
	.uleb128 0x8
	.long	0x5e
	.byte	0x24
	.byte	0
	.uleb128 0x5
	.long	0xf9
	.uleb128 0xe
	.long	.LASF15
	.byte	0x1
	.word	0x106
	.long	0x109
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	morseDecodeTable
	.uleb128 0xf
	.byte	0x1
	.long	.LASF27
	.byte	0x1
	.word	0x126
	.byte	0x1
	.long	0x42
	.long	.LFB9
	.long	.LFE9
	.long	.LLST8
	.byte	0x1
	.long	0x3b8
	.uleb128 0x10
	.long	.LASF16
	.byte	0x1
	.word	0x134
	.long	0x3b8
	.byte	0x2
	.byte	0x8c
	.sleb128 34
	.uleb128 0x10
	.long	.LASF17
	.byte	0x1
	.word	0x135
	.long	0x3c8
	.byte	0x2
	.byte	0x8c
	.sleb128 1
	.uleb128 0x11
	.long	.LASF18
	.byte	0x1
	.word	0x136
	.long	0x30
	.long	.LLST9
	.uleb128 0x11
	.long	.LASF19
	.byte	0x1
	.word	0x136
	.long	0x30
	.long	.LLST10
	.uleb128 0x11
	.long	.LASF20
	.byte	0x1
	.word	0x137
	.long	0x30
	.long	.LLST11
	.uleb128 0x12
	.string	"btn"
	.byte	0x1
	.word	0x137
	.long	0x30
	.byte	0x1
	.byte	0x59
	.uleb128 0x11
	.long	.LASF21
	.byte	0x1
	.word	0x138
	.long	0x6c
	.long	.LLST12
	.uleb128 0x11
	.long	.LASF22
	.byte	0x1
	.word	0x138
	.long	0x6c
	.long	.LLST13
	.uleb128 0x13
	.long	.LASF23
	.byte	0x1
	.word	0x13b
	.long	0x54
	.byte	0xc8
	.uleb128 0x14
	.long	.LASF24
	.byte	0x1
	.word	0x13c
	.long	0x54
	.word	0x258
	.uleb128 0x14
	.long	.LASF25
	.byte	0x1
	.word	0x13d
	.long	0x54
	.word	0x578
	.uleb128 0x15
	.long	.Ldebug_ranges0+0x20
	.long	0x211
	.uleb128 0x16
	.string	"t"
	.byte	0x1
	.word	0x147
	.long	0x49
	.long	.LLST14
	.uleb128 0x17
	.long	.LVL34
	.long	0x3d8
	.uleb128 0x18
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x1
	.byte	0x31
	.byte	0
	.byte	0
	.uleb128 0x19
	.long	.LBB10
	.long	.LBE10
	.long	0x242
	.uleb128 0x10
	.long	.LASF26
	.byte	0x1
	.word	0x164
	.long	0xa2
	.byte	0x1
	.byte	0x68
	.uleb128 0x17
	.long	.LVL62
	.long	0x46e
	.uleb128 0x18
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x19
	.long	.LBB9
	.long	.LBE9
	.long	0x275
	.uleb128 0x11
	.long	.LASF26
	.byte	0x1
	.word	0x16d
	.long	0xa2
	.long	.LLST15
	.uleb128 0x17
	.long	.LVL57
	.long	0x46e
	.uleb128 0x18
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x1a
	.long	.LVL19
	.long	0x56e
	.long	0x288
	.uleb128 0x18
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x3c
	.byte	0
	.uleb128 0x1b
	.long	.LVL20
	.long	0x57c
	.uleb128 0x1a
	.long	.LVL21
	.long	0x58a
	.long	0x2a9
	.uleb128 0x18
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x30
	.uleb128 0x18
	.byte	0x1
	.byte	0x66
	.byte	0x1
	.byte	0x30
	.byte	0
	.uleb128 0x1a
	.long	.LVL22
	.long	0x598
	.long	0x2c5
	.uleb128 0x18
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x5
	.byte	0x3
	.long	.LC1
	.byte	0
	.uleb128 0x1a
	.long	.LVL44
	.long	0x41a
	.long	0x2de
	.uleb128 0x18
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.uleb128 0x1b
	.long	.LVL45
	.long	0x57c
	.uleb128 0x1a
	.long	.LVL46
	.long	0x58a
	.long	0x2ff
	.uleb128 0x18
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x30
	.uleb128 0x18
	.byte	0x1
	.byte	0x66
	.byte	0x1
	.byte	0x30
	.byte	0
	.uleb128 0x1a
	.long	.LVL47
	.long	0x598
	.long	0x31b
	.uleb128 0x18
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x5
	.byte	0x3
	.long	.LC2
	.byte	0
	.uleb128 0x1a
	.long	.LVL48
	.long	0x58a
	.long	0x333
	.uleb128 0x18
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x31
	.uleb128 0x18
	.byte	0x1
	.byte	0x66
	.byte	0x1
	.byte	0x30
	.byte	0
	.uleb128 0x1a
	.long	.LVL49
	.long	0x598
	.long	0x34c
	.uleb128 0x18
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0
	.uleb128 0x1a
	.long	.LVL50
	.long	0x3d8
	.long	0x366
	.uleb128 0x18
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x3
	.byte	0xa
	.word	0x7d0
	.byte	0
	.uleb128 0x1b
	.long	.LVL51
	.long	0x57c
	.uleb128 0x1a
	.long	.LVL52
	.long	0x58a
	.long	0x387
	.uleb128 0x18
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x30
	.uleb128 0x18
	.byte	0x1
	.byte	0x66
	.byte	0x1
	.byte	0x30
	.byte	0
	.uleb128 0x1a
	.long	.LVL53
	.long	0x598
	.long	0x3a3
	.uleb128 0x18
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x5
	.byte	0x3
	.long	.LC1
	.byte	0
	.uleb128 0x17
	.long	.LVL55
	.long	0x3d8
	.uleb128 0x18
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x1
	.byte	0x31
	.byte	0
	.byte	0
	.uleb128 0x7
	.long	0xa2
	.long	0x3c8
	.uleb128 0x8
	.long	0x5e
	.byte	0x8
	.byte	0
	.uleb128 0x7
	.long	0xa2
	.long	0x3d8
	.uleb128 0x8
	.long	0x5e
	.byte	0x20
	.byte	0
	.uleb128 0x1c
	.byte	0x1
	.long	.LASF30
	.byte	0x1
	.word	0x120
	.byte	0x1
	.long	.LFB8
	.long	.LFE8
	.long	.LLST6
	.byte	0x1
	.long	0x41a
	.uleb128 0x1d
	.string	"ms"
	.byte	0x1
	.word	0x120
	.long	0x49
	.long	.LLST7
	.uleb128 0x1e
	.long	.LBB5
	.long	.LBE5
	.uleb128 0x12
	.string	"d"
	.byte	0x1
	.word	0x122
	.long	0x59
	.byte	0x2
	.byte	0x8c
	.sleb128 1
	.byte	0
	.byte	0
	.uleb128 0x1f
	.byte	0x1
	.long	.LASF28
	.byte	0x1
	.word	0x11b
	.byte	0x1
	.long	0x30
	.long	.LFB7
	.long	.LFE7
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x46e
	.uleb128 0x20
	.long	.LASF11
	.byte	0x1
	.word	0x11b
	.long	0x9c
	.long	.LLST5
	.uleb128 0x17
	.long	.LVL16
	.long	0x5a6
	.uleb128 0x18
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.uleb128 0x18
	.byte	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.byte	0x5
	.byte	0x3
	.long	.LC0
	.byte	0
	.byte	0
	.uleb128 0xf
	.byte	0x1
	.long	.LASF29
	.byte	0x1
	.word	0x113
	.byte	0x1
	.long	0xa2
	.long	.LFB6
	.long	.LFE6
	.long	.LLST2
	.byte	0x1
	.long	0x4c7
	.uleb128 0x20
	.long	.LASF11
	.byte	0x1
	.word	0x113
	.long	0x9c
	.long	.LLST3
	.uleb128 0x21
	.long	.Ldebug_ranges0+0
	.uleb128 0x16
	.string	"i"
	.byte	0x1
	.word	0x114
	.long	0x42
	.long	.LLST4
	.uleb128 0x17
	.long	.LVL10
	.long	0x5a6
	.uleb128 0x18
	.byte	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x22
	.byte	0x1
	.long	.LASF34
	.byte	0x1
	.byte	0xc7
	.byte	0x1
	.long	.LFB5
	.long	.LFE5
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.uleb128 0x23
	.byte	0x1
	.long	.LASF31
	.byte	0x1
	.byte	0x77
	.byte	0x1
	.long	.LFB4
	.long	.LFE4
	.long	.LLST0
	.byte	0x1
	.long	0x510
	.uleb128 0x24
	.string	"str"
	.byte	0x1
	.byte	0x77
	.long	0x510
	.long	.LLST1
	.uleb128 0x1b
	.long	.LVL6
	.long	0x530
	.byte	0
	.uleb128 0x9
	.byte	0x2
	.long	0xa2
	.uleb128 0x25
	.byte	0x1
	.long	.LASF44
	.byte	0x1
	.byte	0x6d
	.byte	0x1
	.long	0xa2
	.long	.LFB3
	.long	.LFE3
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.uleb128 0x26
	.byte	0x1
	.long	.LASF32
	.byte	0x1
	.byte	0x63
	.byte	0x1
	.long	.LFB2
	.long	.LFE2
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x558
	.uleb128 0x27
	.long	.LASF33
	.byte	0x1
	.byte	0x63
	.long	0xa2
	.byte	0x1
	.byte	0x68
	.byte	0
	.uleb128 0x22
	.byte	0x1
	.long	.LASF35
	.byte	0x1
	.byte	0x36
	.byte	0x1
	.long	.LFB1
	.long	.LFE1
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.uleb128 0x28
	.byte	0x1
	.byte	0x1
	.long	.LASF36
	.long	.LASF36
	.byte	0x3
	.word	0x129
	.uleb128 0x28
	.byte	0x1
	.byte	0x1
	.long	.LASF37
	.long	.LASF37
	.byte	0x3
	.word	0x130
	.uleb128 0x28
	.byte	0x1
	.byte	0x1
	.long	.LASF38
	.long	.LASF38
	.byte	0x3
	.word	0x141
	.uleb128 0x28
	.byte	0x1
	.byte	0x1
	.long	.LASF39
	.long	.LASF39
	.byte	0x3
	.word	0x151
	.uleb128 0x28
	.byte	0x1
	.byte	0x1
	.long	.LASF40
	.long	.LASF40
	.byte	0x4
	.word	0x11f
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
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2
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
	.uleb128 0x3
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
	.uleb128 0x4
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
	.uleb128 0x5
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x11
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
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x14
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
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0xa
	.uleb128 0x2111
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
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
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x27
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
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x2007
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST8:
	.long	.LFB9
	.long	.LCFI12
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI12
	.long	.LCFI13
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI13
	.long	.LCFI14
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	.LCFI14
	.long	.LCFI15
	.word	0x2
	.byte	0x8c
	.sleb128 4
	.long	.LCFI15
	.long	.LFE9
	.word	0x2
	.byte	0x8c
	.sleb128 46
	.long	0
	.long	0
.LLST9:
	.long	.LVL23
	.long	.LVL24
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	.LVL24
	.long	.LVL28
	.word	0x1
	.byte	0x60
	.long	.LVL28
	.long	.LVL29
	.word	0x1
	.byte	0x68
	.long	.LVL29
	.long	.LVL30
	.word	0x3
	.byte	0x80
	.sleb128 -1
	.byte	0x9f
	.long	.LVL30
	.long	.LVL31
	.word	0x3
	.byte	0x80
	.sleb128 1
	.byte	0x9f
	.long	.LVL31
	.long	.LVL32
	.word	0x1
	.byte	0x60
	.long	.LVL33
	.long	.LVL36
	.word	0x1
	.byte	0x60
	.long	.LVL36
	.long	.LVL37
	.word	0x3
	.byte	0x80
	.sleb128 1
	.byte	0x9f
	.long	.LVL37
	.long	.LVL40
	.word	0x1
	.byte	0x60
	.long	.LVL40
	.long	.LVL43
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	.LVL43
	.long	.LVL49
	.word	0x1
	.byte	0x60
	.long	.LVL49
	.long	.LVL54
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	.LVL54
	.long	.LVL58
	.word	0x1
	.byte	0x60
	.long	.LVL58
	.long	.LVL60
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	.LVL60
	.long	.LVL61
	.word	0x1
	.byte	0x60
	.long	.LVL63
	.long	.LFE9
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	0
	.long	0
.LLST10:
	.long	.LVL23
	.long	.LVL24
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	.LVL24
	.long	.LVL32
	.word	0x1
	.byte	0x61
	.long	.LVL33
	.long	.LVL41
	.word	0x1
	.byte	0x61
	.long	.LVL41
	.long	.LVL42
	.word	0x1
	.byte	0x68
	.long	.LVL42
	.long	.LVL49
	.word	0x1
	.byte	0x61
	.long	.LVL49
	.long	.LVL54
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	.LVL54
	.long	.LVL57
	.word	0x1
	.byte	0x61
	.long	.LVL57
	.long	.LVL59
	.word	0x3
	.byte	0x81
	.sleb128 1
	.byte	0x9f
	.long	.LVL59
	.long	.LVL62
	.word	0x1
	.byte	0x61
	.long	.LVL62
	.long	.LFE9
	.word	0x1
	.byte	0x60
	.long	0
	.long	0
.LLST11:
	.long	.LVL23
	.long	.LVL24
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.long	.LVL24
	.long	.LVL27
	.word	0x1
	.byte	0x68
	.long	.LVL37
	.long	.LVL38
	.word	0x1
	.byte	0x68
	.long	0
	.long	0
.LLST12:
	.long	.LVL23
	.long	.LVL24
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	0
	.long	0
.LLST13:
	.long	.LVL23
	.long	.LVL24
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	.LVL38
	.long	.LVL39
	.word	0xc
	.byte	0x54
	.byte	0x93
	.uleb128 0x1
	.byte	0x55
	.byte	0x93
	.uleb128 0x1
	.byte	0x56
	.byte	0x93
	.uleb128 0x1
	.byte	0x57
	.byte	0x93
	.uleb128 0x1
	.long	.LVL54
	.long	.LVL60
	.word	0xc
	.byte	0x54
	.byte	0x93
	.uleb128 0x1
	.byte	0x55
	.byte	0x93
	.uleb128 0x1
	.byte	0x56
	.byte	0x93
	.uleb128 0x1
	.byte	0x57
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST14:
	.long	.LVL26
	.long	.LVL27
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	.LVL34
	.long	.LVL35
	.word	0x3
	.byte	0x7a
	.sleb128 1
	.byte	0x9f
	.long	.LVL35
	.long	.LVL36
	.word	0x6
	.byte	0x5a
	.byte	0x93
	.uleb128 0x1
	.byte	0x5b
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST15:
	.long	.LVL57
	.long	.LVL59
	.word	0x1
	.byte	0x68
	.long	0
	.long	0
.LLST6:
	.long	.LFB8
	.long	.LCFI8
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI8
	.long	.LCFI9
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI9
	.long	.LCFI10
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	.LCFI10
	.long	.LCFI11
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 6
	.long	.LCFI11
	.long	.LFE8
	.word	0x2
	.byte	0x8c
	.sleb128 6
	.long	0
	.long	0
.LLST7:
	.long	.LVL17
	.long	.LVL18
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL18
	.long	.LFE8
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST5:
	.long	.LVL15
	.long	.LVL16-1
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL16-1
	.long	.LFE7
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x9f
	.long	0
	.long	0
.LLST2:
	.long	.LFB6
	.long	.LCFI2
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI2
	.long	.LCFI3
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI3
	.long	.LCFI4
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	.LCFI4
	.long	.LCFI5
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 5
	.long	.LCFI5
	.long	.LCFI6
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 6
	.long	.LCFI6
	.long	.LCFI7
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 7
	.long	.LCFI7
	.long	.LFE6
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 8
	.long	0
	.long	0
.LLST3:
	.long	.LVL7
	.long	.LVL9
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL9
	.long	.LVL12
	.word	0x6
	.byte	0x5e
	.byte	0x93
	.uleb128 0x1
	.byte	0x5f
	.byte	0x93
	.uleb128 0x1
	.long	.LVL12
	.long	.LVL13
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x9f
	.long	.LVL13
	.long	.LFE6
	.word	0x6
	.byte	0x5e
	.byte	0x93
	.uleb128 0x1
	.byte	0x5f
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST4:
	.long	.LVL8
	.long	.LVL9
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	.LVL9
	.long	.LVL11
	.word	0x6
	.byte	0x6c
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	.LVL13
	.long	.LFE6
	.word	0x6
	.byte	0x6c
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST0:
	.long	.LFB4
	.long	.LCFI0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI0
	.long	.LCFI1
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI1
	.long	.LFE4
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	0
	.long	0
.LLST1:
	.long	.LVL1
	.long	.LVL2
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL2
	.long	.LVL3
	.word	0x6
	.byte	0x6c
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	.LVL3
	.long	.LVL4
	.word	0x3
	.byte	0x8c
	.sleb128 -1
	.byte	0x9f
	.long	.LVL5
	.long	.LVL6
	.word	0x3
	.byte	0x8c
	.sleb128 -1
	.byte	0x9f
	.long	.LVL6
	.long	.LFE4
	.word	0x6
	.byte	0x6c
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
	.section	.debug_aranges,"",@progbits
	.long	0x24
	.word	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0
	.word	0
	.word	0
	.long	.Ltext0
	.long	.Letext0-.Ltext0
	.long	.LFB9
	.long	.LFE9-.LFB9
	.long	0
	.long	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.long	.LBB2
	.long	.LBE2
	.long	.LBB3
	.long	.LBE3
	.long	.LBB4
	.long	.LBE4
	.long	0
	.long	0
	.long	.LBB6
	.long	.LBE6
	.long	.LBB7
	.long	.LBE7
	.long	.LBB8
	.long	.LBE8
	.long	0
	.long	0
	.long	.Ltext0
	.long	.Letext0
	.long	.LFB9
	.long	.LFE9
	.long	0
	.long	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF42:
	.string	"morse_encoder.c"
.LASF25:
	.string	"WORD_GAP"
.LASF23:
	.string	"DOT_THRESH"
.LASF21:
	.string	"press_time"
.LASF31:
	.string	"usart_send_string"
.LASF29:
	.string	"decode_morse"
.LASF41:
	.string	"GNU C99 7.3.0 -mn-flash=1 -mno-skip-bug -mmcu=avr5 -gdwarf-2 -Os -std=gnu99 -funsigned-char -funsigned-bitfields -fpack-struct -fshort-enums"
.LASF34:
	.string	"delay_timer"
.LASF28:
	.string	"is_AR"
.LASF18:
	.string	"morse_idx"
.LASF39:
	.string	"lcd_puts"
.LASF1:
	.string	"unsigned char"
.LASF30:
	.string	"delay_ms"
.LASF38:
	.string	"lcd_gotoxy"
.LASF35:
	.string	"usart_init"
.LASF7:
	.string	"long unsigned int"
.LASF36:
	.string	"lcd_init"
.LASF26:
	.string	"decoded"
.LASF24:
	.string	"LETTER_GAP"
.LASF33:
	.string	"send_char"
.LASF20:
	.string	"last_btn"
.LASF37:
	.string	"lcd_clrscr"
.LASF27:
	.string	"main"
.LASF14:
	.string	"morseCodeMap"
.LASF11:
	.string	"code"
.LASF22:
	.string	"gap_time"
.LASF32:
	.string	"usart_send"
.LASF4:
	.string	"unsigned int"
.LASF9:
	.string	"long long unsigned int"
.LASF2:
	.string	"uint8_t"
.LASF16:
	.string	"morse_buf"
.LASF40:
	.string	"strcmp"
.LASF44:
	.string	"usart_receive"
.LASF43:
	.string	"/media/ravindu/Documents/University/CO321/Repo/CO321_Embedded_Labs/Project"
.LASF8:
	.string	"long long int"
.LASF10:
	.string	"char"
.LASF13:
	.string	"MorseEntry"
.LASF3:
	.string	"uint16_t"
.LASF15:
	.string	"morseDecodeTable"
.LASF6:
	.string	"uint32_t"
.LASF5:
	.string	"long int"
.LASF17:
	.string	"msg_buf"
.LASF12:
	.string	"letter"
.LASF0:
	.string	"signed char"
.LASF19:
	.string	"msg_idx"
	.ident	"GCC: (GNU) 7.3.0"
.global __do_copy_data
