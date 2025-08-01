	.file	"morse_enc.c"
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
.LFB7:
	.file 1 "morse_enc.c"
	.loc 1 59 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 64 0
	ldi r26,lo8(-63)
	ldi r27,0
	ld r24,X
	ori r24,lo8(8)
	st X,r24
	.loc 1 69 0
	ld r24,X
	ori r24,lo8(16)
	st X,r24
	.loc 1 74 0
	ldi r24,lo8(103)
	sts 196,r24
	.loc 1 75 0
	sts 197,__zero_reg__
	.loc 1 81 0
	ldi r30,lo8(-62)
	ldi r31,0
	ld r24,Z
	andi r24,lo8(127)
	st Z,r24
	.loc 1 82 0
	ld r24,Z
	andi r24,lo8(-65)
	st Z,r24
	.loc 1 87 0
	ld r24,X
	andi r24,lo8(-5)
	st X,r24
	.loc 1 88 0
	ld r24,Z
	ori r24,lo8(6)
	st Z,r24
	.loc 1 94 0
	ld r24,Z
	andi r24,lo8(-17)
	st Z,r24
	.loc 1 95 0
	ld r24,Z
	andi r24,lo8(-33)
	st Z,r24
	.loc 1 99 0
	ld r24,Z
	andi r24,lo8(-9)
	st Z,r24
/* epilogue start */
	.loc 1 101 0
	ret
	.cfi_endproc
.LFE7:
	.size	usart_init, .-usart_init
.global	usart_send
	.type	usart_send, @function
usart_send:
.LFB8:
	.loc 1 104 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LVL0:
.L3:
	.loc 1 107 0 discriminator 1
	lds r25,192
	.loc 1 107 0 discriminator 1
	sbrs r25,5
	rjmp .L3
	.loc 1 110 0
	sts 198,r24
/* epilogue start */
	.loc 1 111 0
	ret
	.cfi_endproc
.LFE8:
	.size	usart_send, .-usart_send
.global	usart_receive
	.type	usart_receive, @function
usart_receive:
.LFB9:
	.loc 1 114 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.L7:
	.loc 1 116 0 discriminator 1
	lds r24,192
	.loc 1 116 0 discriminator 1
	sbrs r24,7
	rjmp .L7
	.loc 1 119 0
	lds r24,198
/* epilogue start */
	.loc 1 120 0
	ret
	.cfi_endproc
.LFE9:
	.size	usart_receive, .-usart_receive
.global	usart_send_string
	.type	usart_send_string, @function
usart_send_string:
.LFB10:
	.loc 1 125 0
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
	.loc 1 127 0
	ld r24,Y+
.LVL3:
	cpse r24,__zero_reg__
	rjmp .L11
/* epilogue start */
	.loc 1 132 0
	pop r29
	pop r28
.LVL4:
	ret
.LVL5:
.L11:
	.loc 1 129 0
	call usart_send
.LVL6:
	rjmp .L10
	.cfi_endproc
.LFE10:
	.size	usart_send_string, .-usart_send_string
.global	delay_timer0
	.type	delay_timer0, @function
delay_timer0:
.LFB11:
	.loc 1 209 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 211 0
	ldi r24,lo8(2)
	out 0x24,r24
	.loc 1 212 0
	out 0x25,__zero_reg__
	.loc 1 221 0
	ldi r24,lo8(-7)
	out 0x27,r24
	.loc 1 224 0
	ldi r24,lo8(3)
	out 0x25,r24
.LVL7:
	ldi r24,lo8(100)
	ldi r25,0
.LVL8:
.L14:
.LBB2:
	.loc 1 231 0
	sbi 0x15,1
.L13:
	.loc 1 234 0 discriminator 1
	sbis 0x15,1
	rjmp .L13
.LVL9:
	sbiw r24,1
.LVL10:
	.loc 1 227 0 discriminator 2
	brne .L14
.LBE2:
	.loc 1 238 0
	out 0x25,__zero_reg__
	.loc 1 239 0
	out 0x24,__zero_reg__
/* epilogue start */
	.loc 1 240 0
	ret
	.cfi_endproc
.LFE11:
	.size	delay_timer0, .-delay_timer0
.global	delay_100ms_units
	.type	delay_100ms_units, @function
delay_100ms_units:
.LFB12:
	.loc 1 288 0
	.cfi_startproc
.LVL11:
	push r28
.LCFI2:
	.cfi_def_cfa_offset 3
	.cfi_offset 28, -2
	push r29
.LCFI3:
	.cfi_def_cfa_offset 4
	.cfi_offset 29, -3
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	mov r29,r24
.LVL12:
.LBB3:
	.loc 1 289 0
	ldi r28,0
.LVL13:
.L19:
	.loc 1 289 0 is_stmt 0 discriminator 1
	cpse r28,r29
	rjmp .L20
/* epilogue start */
.LBE3:
	.loc 1 293 0 is_stmt 1
	pop r29
.LVL14:
	pop r28
.LVL15:
	ret
.LVL16:
.L20:
.LBB4:
	.loc 1 291 0 discriminator 3
	call delay_timer0
.LVL17:
	.loc 1 289 0 discriminator 3
	subi r28,lo8(-(1))
.LVL18:
	rjmp .L19
.LBE4:
	.cfi_endproc
.LFE12:
	.size	delay_100ms_units, .-delay_100ms_units
.global	start_buzzer_pwm
	.type	start_buzzer_pwm, @function
start_buzzer_pwm:
.LFB13:
	.loc 1 329 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 331 0
	sbi 0x4,1
	.loc 1 334 0
	ldi r24,lo8(64)
	sts 128,r24
	.loc 1 337 0
	ldi r24,lo8(11)
	sts 129,r24
	.loc 1 340 0
	ldi r24,lo8(124)
	ldi r25,0
	sts 136+1,r25
	sts 136,r24
/* epilogue start */
	.loc 1 341 0
	ret
	.cfi_endproc
.LFE13:
	.size	start_buzzer_pwm, .-start_buzzer_pwm
.global	stop_buzzer_pwm
	.type	stop_buzzer_pwm, @function
stop_buzzer_pwm:
.LFB14:
	.loc 1 348 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 350 0
	sts 128,__zero_reg__
	.loc 1 351 0
	sts 129,__zero_reg__
	.loc 1 354 0
	cbi 0x5,1
/* epilogue start */
	.loc 1 355 0
	ret
	.cfi_endproc
.LFE14:
	.size	stop_buzzer_pwm, .-stop_buzzer_pwm
.global	signal_morse
	.type	signal_morse, @function
signal_morse:
.LFB15:
	.loc 1 371 0
	.cfi_startproc
.LVL19:
	push r14
.LCFI4:
	.cfi_def_cfa_offset 3
	.cfi_offset 14, -2
	push r15
.LCFI5:
	.cfi_def_cfa_offset 4
	.cfi_offset 15, -3
	push r16
.LCFI6:
	.cfi_def_cfa_offset 5
	.cfi_offset 16, -4
	push r17
.LCFI7:
	.cfi_def_cfa_offset 6
	.cfi_offset 17, -5
	push r28
.LCFI8:
	.cfi_def_cfa_offset 7
	.cfi_offset 28, -6
	push r29
.LCFI9:
	.cfi_def_cfa_offset 8
	.cfi_offset 29, -7
/* prologue: function */
/* frame size = 0 */
/* stack size = 6 */
.L__stack_usage = 6
	movw r28,r24
.LVL20:
.LBB5:
	.loc 1 395 0
	ldi r24,lo8(100)
	mov r14,r24
	mov r15,__zero_reg__
.LVL21:
.L24:
.LBE5:
	.loc 1 378 0
	ld r24,Y+
.LVL22:
	cpse r24,__zero_reg__
	rjmp .L28
/* epilogue start */
	.loc 1 423 0
	pop r29
	pop r28
.LVL23:
	pop r17
	pop r16
	pop r15
	pop r14
	ret
.LVL24:
.L28:
.LBB7:
	.loc 1 381 0
	sbi 0x5,5
	.loc 1 388 0
	movw r30,r28
	sbiw r30,1
	ld r24,Z
	ldi r16,lo8(88)
	ldi r17,lo8(2)
	cpi r24,lo8(46)
	brne .L25
	ldi r16,lo8(-56)
	ldi r17,0
.L25:
.LVL25:
	.loc 1 391 0 discriminator 4
	call start_buzzer_pwm
.LVL26:
	.loc 1 395 0 discriminator 4
	movw r24,r16
	movw r22,r14
	call __udivmodhi4
	mov r16,r22
.LVL27:
.LBB6:
	.loc 1 399 0 discriminator 4
	ldi r17,0
.LVL28:
.L26:
	.loc 1 401 0 discriminator 3
	call delay_timer0
.LVL29:
	.loc 1 399 0 discriminator 3
	subi r17,lo8(-(1))
.LVL30:
	cp r17,r16
	brlo .L26
.LBE6:
	.loc 1 405 0
	call stop_buzzer_pwm
.LVL31:
	.loc 1 408 0
	cbi 0x5,5
	.loc 1 415 0
	ld r24,Y
	tst r24
	breq .L24
	.loc 1 417 0
	ldi r24,lo8(2)
	call delay_100ms_units
.LVL32:
	rjmp .L24
.LBE7:
	.cfi_endproc
.LFE15:
	.size	signal_morse, .-signal_morse
.global	letter_gap
	.type	letter_gap, @function
letter_gap:
.LFB16:
	.loc 1 431 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 432 0
	ldi r24,lo8(6)
	jmp delay_100ms_units
.LVL33:
	.cfi_endproc
.LFE16:
	.size	letter_gap, .-letter_gap
.global	word_gap
	.type	word_gap, @function
word_gap:
.LFB17:
	.loc 1 442 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 443 0
	ldi r24,lo8(14)
	jmp delay_100ms_units
.LVL34:
	.cfi_endproc
.LFE17:
	.size	word_gap, .-word_gap
.global	get_morse_code
	.type	get_morse_code, @function
get_morse_code:
.LFB18:
	.loc 1 453 0
	.cfi_startproc
.LVL35:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	mov r30,r24
	.loc 1 455 0
	ldi r24,lo8(-65)
.LVL36:
	add r24,r30
	cpi r24,lo8(26)
	brsh .L37
	.loc 1 457 0
	subi r30,65
	sbc r31,r31
.LVL37:
.L41:
	.loc 1 463 0
	lsl r30
	rol r31
	subi r30,lo8(-(morseCodeMap))
	sbci r31,hi8(-(morseCodeMap))
	ld r24,Z
	ldd r25,Z+1
	ret
.LVL38:
.L37:
	.loc 1 461 0
	ldi r24,lo8(-97)
	add r24,r30
	cpi r24,lo8(26)
	brsh .L39
	.loc 1 463 0
	subi r30,97
	sbc r31,r31
.LVL39:
	rjmp .L41
.LVL40:
.L39:
.LBB10:
.LBB11:
	.loc 1 467 0
	ldi r24,lo8(-48)
	add r24,r30
	.loc 1 469 0
	subi r30,22
	sbc r31,r31
.LVL41:
	.loc 1 467 0
	cpi r24,lo8(10)
	brlo .L41
	.loc 1 475 0
	ldi r25,0
	ldi r24,0
/* epilogue start */
.LBE11:
.LBE10:
	.loc 1 477 0
	ret
	.cfi_endproc
.LFE18:
	.size	get_morse_code, .-get_morse_code
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Morse Encoder"
.LC1:
	.string	"end of sentence"
	.section	.text.startup,"ax",@progbits
.global	main
	.type	main, @function
main:
.LFB19:
	.loc 1 481 0
	.cfi_startproc
	push r28
.LCFI10:
	.cfi_def_cfa_offset 3
	.cfi_offset 28, -2
	push r29
.LCFI11:
	.cfi_def_cfa_offset 4
	.cfi_offset 29, -3
	in r28,__SP_L__
	in r29,__SP_H__
.LCFI12:
	.cfi_def_cfa_register 28
	subi r28,-128
	sbc r29,__zero_reg__
.LCFI13:
	.cfi_def_cfa_offset 132
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 128 */
/* stack size = 130 */
.L__stack_usage = 130
	.loc 1 483 0
	in r24,0x4
	ori r24,lo8(60)
	out 0x4,r24
	.loc 1 484 0
	sbi 0x4,1
	.loc 1 487 0
	cbi 0x5,5
	.loc 1 488 0
	cbi 0x5,2
	.loc 1 489 0
	cbi 0x5,3
	.loc 1 490 0
	cbi 0x5,4
	.loc 1 491 0
	cbi 0x5,1
	.loc 1 494 0
	call usart_init
.LVL42:
	.loc 1 497 0
	ldi r24,lo8(12)
	call lcd_init
.LVL43:
	.loc 1 498 0
	call lcd_clrscr
.LVL44:
	.loc 1 499 0
	ldi r24,lo8(.LC0)
	ldi r25,hi8(.LC0)
	call lcd_puts
.LVL45:
.L59:
	.loc 1 507 0
	ldi r17,0
.LVL46:
.L43:
.LBB12:
	.loc 1 529 0
	call usart_receive
.LVL47:
	mov r16,r24
.LVL48:
	.loc 1 532 0
	call usart_send
.LVL49:
	.loc 1 535 0
	cpi r16,lo8(10)
	breq .L44
	.loc 1 535 0 is_stmt 0 discriminator 1
	cpi r16,lo8(13)
	breq .+2
	rjmp .L45
.L44:
.LBB13:
	.loc 1 538 0 is_stmt 1
	ldi r30,lo8(1)
	ldi r31,0
	add r30,r28
	adc r31,r29
	add r30,r17
	adc r31,__zero_reg__
	st Z,__zero_reg__
.LVL50:
	.loc 1 547 0
	call lcd_clrscr
.LVL51:
	.loc 1 541 0
	mov r15,__zero_reg__
.LVL52:
.L46:
	.loc 1 550 0
	mov r16,r15
	ldi r17,0
	ldi r30,lo8(1)
	ldi r31,0
	add r30,r28
	adc r31,r29
	add r30,r16
	adc r31,r17
	ld r24,Z
	cpse r24,__zero_reg__
	rjmp .L51
	.loc 1 631 0
	call lcd_clrscr
.LVL53:
	.loc 1 632 0
	ldi r24,lo8(.LC1)
	ldi r25,hi8(.LC1)
	call lcd_puts
.LVL54:
	.loc 1 635 0
	sbi 0x5,4
	.loc 1 638 0
	ldi r24,lo8(10)
	call delay_100ms_units
.LVL55:
	.loc 1 641 0
	cbi 0x5,4
.LVL56:
	rjmp .L59
.LVL57:
.L51:
	.loc 1 554 0
	cpi r24,lo8(32)
	brne .L47
	.loc 1 557 0
	sbi 0x5,3
	.loc 1 560 0
	call word_gap
.LVL58:
	.loc 1 563 0
	cbi 0x5,3
	.loc 1 566 0
	ldi r24,lo8(32)
.L60:
.LBB14:
.LBB15:
	.loc 1 622 0
	call lcd_putc
.LVL59:
.L48:
.LBE15:
.LBE14:
	.loc 1 627 0
	inc r15
.LVL60:
	rjmp .L46
.L47:
.LBB19:
	.loc 1 579 0
	call get_morse_code
.LVL61:
	movw r12,r24
.LVL62:
	.loc 1 582 0
	sbiw r24,0
	breq .L48
.LBB18:
	.loc 1 586 0
	call signal_morse
.LVL63:
	.loc 1 589 0
	sbi 0x5,2
	.loc 1 592 0
	ldi r24,lo8(2)
	call delay_100ms_units
.LVL64:
	.loc 1 595 0
	cbi 0x5,2
	.loc 1 598 0
	call letter_gap
.LVL65:
	.loc 1 601 0
	call lcd_clrscr
.LVL66:
.LBB16:
	.loc 1 612 0
	mov r14,__zero_reg__
.LVL67:
.L49:
	.loc 1 612 0 is_stmt 0 discriminator 1
	movw r30,r12
	add r30,r14
	adc r31,__zero_reg__
	ld r24,Z
	cpse r24,__zero_reg__
	rjmp .L50
.LBE16:
	.loc 1 619 0 is_stmt 1
	ldi r24,lo8(32)
	call lcd_putc
.LVL68:
	.loc 1 622 0
	ldi r30,lo8(1)
	ldi r31,0
	add r30,r28
	adc r31,r29
	add r30,r16
	adc r31,r17
	ld r24,Z
	rjmp .L60
.L50:
.LBB17:
	.loc 1 615 0 discriminator 3
	call lcd_putc
.LVL69:
	.loc 1 612 0 discriminator 3
	inc r14
.LVL70:
	rjmp .L49
.LVL71:
.L45:
.LBE17:
.LBE18:
.LBE19:
.LBE13:
	.loc 1 656 0
	cpi r17,lo8(127)
	brlo .+2
	rjmp .L43
	.loc 1 656 0 is_stmt 0 discriminator 1
	ldi r24,lo8(-32)
	add r24,r16
	cpi r24,lo8(95)
	brlo .+2
	rjmp .L43
.LVL72:
	.loc 1 659 0 is_stmt 1
	ldi r30,lo8(1)
	ldi r31,0
	add r30,r28
	adc r31,r29
	add r30,r17
	adc r31,__zero_reg__
	st Z,r16
	subi r17,lo8(-(1))
.LVL73:
	rjmp .L43
.LBE12:
	.cfi_endproc
.LFE19:
	.size	main, .-main
.global	morseCodeMap
	.section	.rodata.str1.1
.LC2:
	.string	".-"
.LC3:
	.string	"-..."
.LC4:
	.string	"-.-."
.LC5:
	.string	"-.."
.LC6:
	.string	"."
.LC7:
	.string	"..-."
.LC8:
	.string	"--."
.LC9:
	.string	"...."
.LC10:
	.string	".."
.LC11:
	.string	".---"
.LC12:
	.string	"-.-"
.LC13:
	.string	".-.."
.LC14:
	.string	"--"
.LC15:
	.string	"-."
.LC16:
	.string	"---"
.LC17:
	.string	".--."
.LC18:
	.string	"--.-"
.LC19:
	.string	".-."
.LC20:
	.string	"..."
.LC21:
	.string	"-"
.LC22:
	.string	"..-"
.LC23:
	.string	"...-"
.LC24:
	.string	".--"
.LC25:
	.string	"-..-"
.LC26:
	.string	"-.--"
.LC27:
	.string	"--.."
.LC28:
	.string	"-----"
.LC29:
	.string	".----"
.LC30:
	.string	"..---"
.LC31:
	.string	"...--"
.LC32:
	.string	"....-"
.LC33:
	.string	"....."
.LC34:
	.string	"-...."
.LC35:
	.string	"--..."
.LC36:
	.string	"---.."
.LC37:
	.string	"----."
	.data
	.type	morseCodeMap, @object
	.size	morseCodeMap, 72
morseCodeMap:
	.word	.LC2
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
	.text
.Letext0:
	.file 2 "/usr/lib/avr/include/stdint.h"
	.file 3 "lcd.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x550
	.word	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF32
	.byte	0xc
	.long	.LASF33
	.long	.LASF34
	.long	.Ldebug_ranges0+0x78
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
	.long	0x54
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF4
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.long	.LASF5
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF6
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF7
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF8
	.uleb128 0x5
	.long	0x87
	.long	0x87
	.uleb128 0x6
	.long	0x54
	.byte	0x23
	.byte	0
	.uleb128 0x7
	.byte	0x2
	.long	0x94
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF9
	.uleb128 0x8
	.long	0x8d
	.uleb128 0x9
	.long	.LASF35
	.byte	0x1
	.byte	0x94
	.long	0x77
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	morseCodeMap
	.uleb128 0xa
	.byte	0x1
	.long	.LASF36
	.byte	0x1
	.word	0x1e0
	.byte	0x1
	.long	0x42
	.long	.LFB19
	.long	.LFE19
	.long	.LLST13
	.byte	0x1
	.long	0x287
	.uleb128 0xb
	.long	.LASF10
	.byte	0x1
	.word	0x1f4
	.long	0x30
	.long	.LLST14
	.uleb128 0xc
	.long	.LASF11
	.byte	0x1
	.word	0x1f8
	.long	0x287
	.byte	0x2
	.byte	0x8c
	.sleb128 1
	.uleb128 0xb
	.long	.LASF12
	.byte	0x1
	.word	0x1fb
	.long	0x30
	.long	.LLST15
	.uleb128 0xd
	.long	.LBB12
	.long	.LBE12
	.long	0x249
	.uleb128 0xe
	.string	"c"
	.byte	0x1
	.word	0x211
	.long	0x8d
	.long	.LLST16
	.uleb128 0xd
	.long	.LBB13
	.long	.LBE13
	.long	0x22f
	.uleb128 0xe
	.string	"i"
	.byte	0x1
	.word	0x21d
	.long	0x30
	.long	.LLST17
	.uleb128 0xf
	.long	.Ldebug_ranges0+0x30
	.long	0x1e4
	.uleb128 0xb
	.long	.LASF13
	.byte	0x1
	.word	0x243
	.long	0x87
	.long	.LLST18
	.uleb128 0xf
	.long	.Ldebug_ranges0+0x48
	.long	0x1da
	.uleb128 0xb
	.long	.LASF14
	.byte	0x1
	.word	0x260
	.long	0x87
	.long	.LLST19
	.uleb128 0xf
	.long	.Ldebug_ranges0+0x60
	.long	0x182
	.uleb128 0xe
	.string	"m"
	.byte	0x1
	.word	0x264
	.long	0x30
	.long	.LLST20
	.uleb128 0x10
	.long	.LVL69
	.long	0x51b
	.byte	0
	.uleb128 0x10
	.long	.LVL59
	.long	0x51b
	.uleb128 0x11
	.long	.LVL63
	.long	0x30b
	.long	0x1a4
	.uleb128 0x12
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
	.uleb128 0x11
	.long	.LVL64
	.long	0x3d9
	.long	0x1b7
	.uleb128 0x12
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x32
	.byte	0
	.uleb128 0x10
	.long	.LVL65
	.long	0x2e0
	.uleb128 0x10
	.long	.LVL66
	.long	0x529
	.uleb128 0x13
	.long	.LVL68
	.long	0x51b
	.uleb128 0x12
	.byte	0x1
	.byte	0x68
	.byte	0x2
	.byte	0x8
	.byte	0x20
	.byte	0
	.byte	0
	.uleb128 0x10
	.long	.LVL61
	.long	0x297
	.byte	0
	.uleb128 0x10
	.long	.LVL51
	.long	0x529
	.uleb128 0x10
	.long	.LVL53
	.long	0x529
	.uleb128 0x11
	.long	.LVL54
	.long	0x537
	.long	0x212
	.uleb128 0x12
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
	.uleb128 0x11
	.long	.LVL55
	.long	0x3d9
	.long	0x225
	.uleb128 0x12
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x3a
	.byte	0
	.uleb128 0x10
	.long	.LVL58
	.long	0x2b5
	.byte	0
	.uleb128 0x10
	.long	.LVL47
	.long	0x48c
	.uleb128 0x13
	.long	.LVL49
	.long	0x4a6
	.uleb128 0x12
	.byte	0x1
	.byte	0x68
	.byte	0x2
	.byte	0x80
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x10
	.long	.LVL42
	.long	0x4ce
	.uleb128 0x11
	.long	.LVL43
	.long	0x545
	.long	0x265
	.uleb128 0x12
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x3c
	.byte	0
	.uleb128 0x10
	.long	.LVL44
	.long	0x529
	.uleb128 0x13
	.long	.LVL45
	.long	0x537
	.uleb128 0x12
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x5
	.byte	0x3
	.long	.LC0
	.byte	0
	.byte	0
	.uleb128 0x5
	.long	0x8d
	.long	0x297
	.uleb128 0x6
	.long	0x54
	.byte	0x7f
	.byte	0
	.uleb128 0x14
	.byte	0x1
	.long	.LASF37
	.byte	0x1
	.word	0x1c4
	.byte	0x1
	.long	0x87
	.byte	0x1
	.long	0x2b5
	.uleb128 0x15
	.string	"c"
	.byte	0x1
	.word	0x1c4
	.long	0x8d
	.byte	0
	.uleb128 0x16
	.byte	0x1
	.long	.LASF15
	.byte	0x1
	.word	0x1b9
	.long	.LFB17
	.long	.LFE17
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x2e0
	.uleb128 0x17
	.long	.LVL34
	.byte	0x1
	.long	0x3d9
	.uleb128 0x12
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x3e
	.byte	0
	.byte	0
	.uleb128 0x16
	.byte	0x1
	.long	.LASF16
	.byte	0x1
	.word	0x1ae
	.long	.LFB16
	.long	.LFE16
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x30b
	.uleb128 0x17
	.long	.LVL33
	.byte	0x1
	.long	0x3d9
	.uleb128 0x12
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x36
	.byte	0
	.byte	0
	.uleb128 0x18
	.byte	0x1
	.long	.LASF20
	.byte	0x1
	.word	0x172
	.byte	0x1
	.long	.LFB15
	.long	.LFE15
	.long	.LLST6
	.byte	0x1
	.long	0x3ad
	.uleb128 0x19
	.long	.LASF22
	.byte	0x1
	.word	0x172
	.long	0x87
	.long	.LLST7
	.uleb128 0xe
	.string	"i"
	.byte	0x1
	.word	0x175
	.long	0x42
	.long	.LLST8
	.uleb128 0x1a
	.long	.Ldebug_ranges0+0x18
	.uleb128 0xb
	.long	.LASF17
	.byte	0x1
	.word	0x184
	.long	0x49
	.long	.LLST9
	.uleb128 0x1b
	.long	.LASF23
	.byte	0x1
	.word	0x18b
	.long	0x30
	.uleb128 0xd
	.long	.LBB6
	.long	.LBE6
	.long	0x38a
	.uleb128 0xe
	.string	"t"
	.byte	0x1
	.word	0x18f
	.long	0x30
	.long	.LLST10
	.uleb128 0x10
	.long	.LVL29
	.long	0x422
	.byte	0
	.uleb128 0x10
	.long	.LVL26
	.long	0x3c3
	.uleb128 0x10
	.long	.LVL31
	.long	0x3ad
	.uleb128 0x13
	.long	.LVL32
	.long	0x3d9
	.uleb128 0x12
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x32
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1c
	.byte	0x1
	.long	.LASF18
	.byte	0x1
	.word	0x15b
	.long	.LFB14
	.long	.LFE14
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.uleb128 0x1c
	.byte	0x1
	.long	.LASF19
	.byte	0x1
	.word	0x148
	.long	.LFB13
	.long	.LFE13
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.uleb128 0x18
	.byte	0x1
	.long	.LASF21
	.byte	0x1
	.word	0x11f
	.byte	0x1
	.long	.LFB12
	.long	.LFE12
	.long	.LLST3
	.byte	0x1
	.long	0x422
	.uleb128 0x19
	.long	.LASF23
	.byte	0x1
	.word	0x11f
	.long	0x30
	.long	.LLST4
	.uleb128 0x1a
	.long	.Ldebug_ranges0+0
	.uleb128 0xe
	.string	"i"
	.byte	0x1
	.word	0x121
	.long	0x30
	.long	.LLST5
	.uleb128 0x10
	.long	.LVL17
	.long	0x422
	.byte	0
	.byte	0
	.uleb128 0x1d
	.byte	0x1
	.long	.LASF24
	.byte	0x1
	.byte	0xd0
	.long	.LFB11
	.long	.LFE11
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x453
	.uleb128 0x1e
	.long	.LBB2
	.long	.LBE2
	.uleb128 0x1f
	.string	"i"
	.byte	0x1
	.byte	0xe3
	.long	0x49
	.long	.LLST2
	.byte	0
	.byte	0
	.uleb128 0x20
	.byte	0x1
	.long	.LASF25
	.byte	0x1
	.byte	0x7c
	.byte	0x1
	.long	.LFB10
	.long	.LFE10
	.long	.LLST0
	.byte	0x1
	.long	0x486
	.uleb128 0x21
	.string	"str"
	.byte	0x1
	.byte	0x7c
	.long	0x486
	.long	.LLST1
	.uleb128 0x10
	.long	.LVL6
	.long	0x4a6
	.byte	0
	.uleb128 0x7
	.byte	0x2
	.long	0x8d
	.uleb128 0x22
	.byte	0x1
	.long	.LASF38
	.byte	0x1
	.byte	0x71
	.byte	0x1
	.long	0x8d
	.long	.LFB9
	.long	.LFE9
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.uleb128 0x23
	.byte	0x1
	.long	.LASF26
	.byte	0x1
	.byte	0x67
	.byte	0x1
	.long	.LFB8
	.long	.LFE8
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x4ce
	.uleb128 0x24
	.long	.LASF27
	.byte	0x1
	.byte	0x67
	.long	0x8d
	.byte	0x1
	.byte	0x68
	.byte	0
	.uleb128 0x25
	.byte	0x1
	.long	.LASF39
	.byte	0x1
	.byte	0x3a
	.byte	0x1
	.long	.LFB7
	.long	.LFE7
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.uleb128 0x26
	.long	0x297
	.long	.LFB18
	.long	.LFE18
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x51b
	.uleb128 0x27
	.long	0x2aa
	.long	.LLST11
	.uleb128 0x28
	.long	0x297
	.long	.LBB10
	.long	.LBE10
	.uleb128 0x27
	.long	0x2aa
	.long	.LLST12
	.byte	0
	.byte	0
	.uleb128 0x29
	.byte	0x1
	.byte	0x1
	.long	.LASF28
	.long	.LASF28
	.byte	0x3
	.word	0x149
	.uleb128 0x29
	.byte	0x1
	.byte	0x1
	.long	.LASF29
	.long	.LASF29
	.byte	0x3
	.word	0x130
	.uleb128 0x29
	.byte	0x1
	.byte	0x1
	.long	.LASF30
	.long	.LASF30
	.byte	0x3
	.word	0x151
	.uleb128 0x29
	.byte	0x1
	.byte	0x1
	.long	.LASF31
	.long	.LASF31
	.byte	0x3
	.word	0x129
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
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0xf
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
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
	.uleb128 0x12
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0xa
	.uleb128 0x2111
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
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
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.byte	0
	.byte	0
	.uleb128 0x16
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
	.uleb128 0x17
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x2115
	.uleb128 0xc
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
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
	.uleb128 0x19
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
	.uleb128 0x1a
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x1b
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
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
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
	.uleb128 0x1d
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
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x20
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
	.uleb128 0x21
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
	.uleb128 0xa
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
	.uleb128 0x31
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
	.uleb128 0x27
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x29
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
.LLST13:
	.long	.LFB19
	.long	.LCFI10
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI10
	.long	.LCFI11
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI11
	.long	.LCFI12
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	.LCFI12
	.long	.LCFI13
	.word	0x2
	.byte	0x8c
	.sleb128 4
	.long	.LCFI13
	.long	.LFE19
	.word	0x3
	.byte	0x8c
	.sleb128 132
	.long	0
	.long	0
.LLST14:
	.long	.LVL45
	.long	.LVL52
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	.LVL71
	.long	.LFE19
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	0
	.long	0
.LLST15:
	.long	.LVL45
	.long	.LVL46
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	.LVL46
	.long	.LVL52
	.word	0x1
	.byte	0x61
	.long	.LVL56
	.long	.LVL57
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	.LVL71
	.long	.LVL72
	.word	0x1
	.byte	0x61
	.long	.LVL72
	.long	.LVL73
	.word	0x3
	.byte	0x81
	.sleb128 1
	.byte	0x9f
	.long	.LVL73
	.long	.LFE19
	.word	0x1
	.byte	0x61
	.long	0
	.long	0
.LLST16:
	.long	.LVL48
	.long	.LVL52
	.word	0x1
	.byte	0x60
	.long	.LVL71
	.long	.LFE19
	.word	0x1
	.byte	0x60
	.long	0
	.long	0
.LLST17:
	.long	.LVL50
	.long	.LVL52
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	.LVL52
	.long	.LVL71
	.word	0x1
	.byte	0x5f
	.long	0
	.long	0
.LLST18:
	.long	.LVL62
	.long	.LVL71
	.word	0x6
	.byte	0x5c
	.byte	0x93
	.uleb128 0x1
	.byte	0x5d
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST19:
	.long	.LVL66
	.long	.LVL71
	.word	0x6
	.byte	0x5c
	.byte	0x93
	.uleb128 0x1
	.byte	0x5d
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST20:
	.long	.LVL66
	.long	.LVL67
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	.LVL67
	.long	.LVL71
	.word	0x1
	.byte	0x5e
	.long	0
	.long	0
.LLST6:
	.long	.LFB15
	.long	.LCFI4
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI4
	.long	.LCFI5
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI5
	.long	.LCFI6
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	.LCFI6
	.long	.LCFI7
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 5
	.long	.LCFI7
	.long	.LCFI8
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 6
	.long	.LCFI8
	.long	.LCFI9
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 7
	.long	.LCFI9
	.long	.LFE15
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 8
	.long	0
	.long	0
.LLST7:
	.long	.LVL19
	.long	.LVL21
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL21
	.long	.LFE15
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x9f
	.long	0
	.long	0
.LLST8:
	.long	.LVL20
	.long	.LVL21
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	.LVL21
	.long	.LVL22
	.word	0x7
	.byte	0x8c
	.sleb128 0
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x1c
	.byte	0x9f
	.long	.LVL22
	.long	.LVL23
	.word	0x8
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x20
	.byte	0x8c
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.long	.LVL24
	.long	.LVL32
	.word	0x8
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x20
	.byte	0x8c
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.long	.LVL32
	.long	.LFE15
	.word	0x7
	.byte	0x8c
	.sleb128 0
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x1c
	.byte	0x9f
	.long	0
	.long	0
.LLST9:
	.long	.LVL25
	.long	.LVL27
	.word	0x6
	.byte	0x60
	.byte	0x93
	.uleb128 0x1
	.byte	0x61
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST10:
	.long	.LVL27
	.long	.LVL28
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	.LVL28
	.long	.LFE15
	.word	0x1
	.byte	0x61
	.long	0
	.long	0
.LLST3:
	.long	.LFB12
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
	.long	.LFE12
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	0
	.long	0
.LLST4:
	.long	.LVL11
	.long	.LVL13
	.word	0x1
	.byte	0x68
	.long	.LVL13
	.long	.LVL14
	.word	0x1
	.byte	0x6d
	.long	.LVL14
	.long	.LVL16
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x9f
	.long	.LVL16
	.long	.LFE12
	.word	0x1
	.byte	0x6d
	.long	0
	.long	0
.LLST5:
	.long	.LVL12
	.long	.LVL13
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	.LVL13
	.long	.LVL15
	.word	0x1
	.byte	0x6c
	.long	.LVL16
	.long	.LFE12
	.word	0x1
	.byte	0x6c
	.long	0
	.long	0
.LLST2:
	.long	.LVL7
	.long	.LVL8
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	.LVL8
	.long	.LVL9
	.word	0x6
	.byte	0x8
	.byte	0x64
	.byte	0x88
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.long	.LVL9
	.long	.LVL10
	.word	0x6
	.byte	0x8
	.byte	0x65
	.byte	0x88
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.long	.LVL10
	.long	.LFE11
	.word	0x6
	.byte	0x8
	.byte	0x64
	.byte	0x88
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.long	0
	.long	0
.LLST0:
	.long	.LFB10
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
	.long	.LFE10
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
	.long	.LFE10
	.word	0x6
	.byte	0x6c
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST11:
	.long	.LVL35
	.long	.LVL36
	.word	0x1
	.byte	0x68
	.long	.LVL36
	.long	.LVL37
	.word	0x1
	.byte	0x6e
	.long	.LVL37
	.long	.LVL38
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x9f
	.long	.LVL38
	.long	.LVL39
	.word	0x1
	.byte	0x6e
	.long	.LVL39
	.long	.LVL40
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x9f
	.long	.LVL40
	.long	.LVL41
	.word	0x1
	.byte	0x6e
	.long	.LVL41
	.long	.LFE18
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x9f
	.long	0
	.long	0
.LLST12:
	.long	.LVL40
	.long	.LVL41
	.word	0x1
	.byte	0x6e
	.long	.LVL41
	.long	.LFE18
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x9f
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
	.long	.LFB19
	.long	.LFE19-.LFB19
	.long	0
	.long	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.long	.LBB3
	.long	.LBE3
	.long	.LBB4
	.long	.LBE4
	.long	0
	.long	0
	.long	.LBB5
	.long	.LBE5
	.long	.LBB7
	.long	.LBE7
	.long	0
	.long	0
	.long	.LBB14
	.long	.LBE14
	.long	.LBB19
	.long	.LBE19
	.long	0
	.long	0
	.long	.LBB15
	.long	.LBE15
	.long	.LBB18
	.long	.LBE18
	.long	0
	.long	0
	.long	.LBB16
	.long	.LBE16
	.long	.LBB17
	.long	.LBE17
	.long	0
	.long	0
	.long	.Ltext0
	.long	.Letext0
	.long	.LFB19
	.long	.LFE19
	.long	0
	.long	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF33:
	.string	"morse_enc.c"
.LASF38:
	.string	"usart_receive"
.LASF30:
	.string	"lcd_puts"
.LASF17:
	.string	"on_duration_ms"
.LASF25:
	.string	"usart_send_string"
.LASF32:
	.string	"GNU C99 7.3.0 -mn-flash=1 -mno-skip-bug -mmcu=avr5 -gdwarf-2 -Os -std=gnu99 -funsigned-char -funsigned-bitfields -fpack-struct -fshort-enums"
.LASF14:
	.string	"morse_str"
.LASF23:
	.string	"units"
.LASF13:
	.string	"morse"
.LASF10:
	.string	"lcd_col"
.LASF1:
	.string	"unsigned char"
.LASF39:
	.string	"usart_init"
.LASF22:
	.string	"morse_string"
.LASF37:
	.string	"get_morse_code"
.LASF6:
	.string	"long unsigned int"
.LASF31:
	.string	"lcd_init"
.LASF24:
	.string	"delay_timer0"
.LASF20:
	.string	"signal_morse"
.LASF27:
	.string	"send_char"
.LASF29:
	.string	"lcd_clrscr"
.LASF36:
	.string	"main"
.LASF35:
	.string	"morseCodeMap"
.LASF16:
	.string	"letter_gap"
.LASF26:
	.string	"usart_send"
.LASF21:
	.string	"delay_100ms_units"
.LASF4:
	.string	"unsigned int"
.LASF12:
	.string	"buf_idx"
.LASF8:
	.string	"long long unsigned int"
.LASF2:
	.string	"uint8_t"
.LASF19:
	.string	"start_buzzer_pwm"
.LASF15:
	.string	"word_gap"
.LASF34:
	.string	"/media/ravindu/Documents/University/CO321/Repo/CO321_Embedded_Labs/Project"
.LASF7:
	.string	"long long int"
.LASF9:
	.string	"char"
.LASF18:
	.string	"stop_buzzer_pwm"
.LASF11:
	.string	"buffer"
.LASF3:
	.string	"uint16_t"
.LASF5:
	.string	"long int"
.LASF0:
	.string	"signed char"
.LASF28:
	.string	"lcd_putc"
	.ident	"GCC: (GNU) 7.3.0"
.global __do_copy_data
