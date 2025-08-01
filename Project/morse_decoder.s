	.file	"morse_decoder.c"
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
	.file 1 "morse_decoder.c"
	.loc 1 58 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 63 0
	ldi r26,lo8(-63)
	ldi r27,0
	ld r24,X
	ori r24,lo8(8)
	st X,r24
	.loc 1 68 0
	ld r24,X
	ori r24,lo8(16)
	st X,r24
	.loc 1 73 0
	ldi r24,lo8(103)
	sts 196,r24
	.loc 1 74 0
	sts 197,__zero_reg__
	.loc 1 80 0
	ldi r30,lo8(-62)
	ldi r31,0
	ld r24,Z
	andi r24,lo8(127)
	st Z,r24
	.loc 1 81 0
	ld r24,Z
	andi r24,lo8(-65)
	st Z,r24
	.loc 1 86 0
	ld r24,X
	andi r24,lo8(-5)
	st X,r24
	.loc 1 87 0
	ld r24,Z
	ori r24,lo8(6)
	st Z,r24
	.loc 1 93 0
	ld r24,Z
	andi r24,lo8(-17)
	st Z,r24
	.loc 1 94 0
	ld r24,Z
	andi r24,lo8(-33)
	st Z,r24
	.loc 1 98 0
	ld r24,Z
	andi r24,lo8(-9)
	st Z,r24
/* epilogue start */
	.loc 1 100 0
	ret
	.cfi_endproc
.LFE1:
	.size	usart_init, .-usart_init
.global	usart_send
	.type	usart_send, @function
usart_send:
.LFB2:
	.loc 1 103 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LVL0:
.L3:
	.loc 1 106 0 discriminator 1
	lds r25,192
	.loc 1 106 0 discriminator 1
	sbrs r25,5
	rjmp .L3
	.loc 1 109 0
	sts 198,r24
/* epilogue start */
	.loc 1 110 0
	ret
	.cfi_endproc
.LFE2:
	.size	usart_send, .-usart_send
.global	usart_receive
	.type	usart_receive, @function
usart_receive:
.LFB3:
	.loc 1 113 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.L7:
	.loc 1 115 0 discriminator 1
	lds r24,192
	.loc 1 115 0 discriminator 1
	sbrs r24,7
	rjmp .L7
	.loc 1 118 0
	lds r24,198
/* epilogue start */
	.loc 1 119 0
	ret
	.cfi_endproc
.LFE3:
	.size	usart_receive, .-usart_receive
.global	usart_send_string
	.type	usart_send_string, @function
usart_send_string:
.LFB4:
	.loc 1 123 0
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
	.loc 1 124 0
	ld r24,Y+
.LVL3:
	cpse r24,__zero_reg__
	rjmp .L11
/* epilogue start */
	.loc 1 129 0
	pop r29
	pop r28
.LVL4:
	ret
.LVL5:
.L11:
	.loc 1 126 0
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
	.loc 1 203 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 205 0
	sts 128,__zero_reg__
	.loc 1 206 0
	ldi r24,lo8(8)
	sts 129,r24
	.loc 1 212 0
	ldi r24,lo8(-89)
	ldi r25,lo8(97)
	sts 136+1,r25
	sts 136,r24
	.loc 1 215 0
	lds r24,129
	ori r24,lo8(3)
	sts 129,r24
	.loc 1 218 0
	sbi 0x16,1
.L13:
	.loc 1 221 0 discriminator 1
	sbis 0x16,1
	rjmp .L13
	.loc 1 224 0
	sts 129,__zero_reg__
	.loc 1 226 0
	sbi 0x16,1
/* epilogue start */
	.loc 1 227 0
	ret
	.cfi_endproc
.LFE5:
	.size	delay_timer, .-delay_timer
.global	delay_100ms_units
	.type	delay_100ms_units, @function
delay_100ms_units:
.LFB6:
	.loc 1 250 0
	.cfi_startproc
.LVL7:
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
.LVL8:
.LBB2:
	.loc 1 251 0
	ldi r28,0
.LVL9:
.L17:
	.loc 1 251 0 is_stmt 0 discriminator 1
	cpse r28,r29
	rjmp .L18
/* epilogue start */
.LBE2:
	.loc 1 254 0 is_stmt 1
	pop r29
.LVL10:
	pop r28
.LVL11:
	ret
.LVL12:
.L18:
.LBB3:
	.loc 1 252 0 discriminator 3
	call delay_timer
.LVL13:
	.loc 1 251 0 discriminator 3
	subi r28,lo8(-(1))
.LVL14:
	rjmp .L17
.LBE3:
	.cfi_endproc
.LFE6:
	.size	delay_100ms_units, .-delay_100ms_units
.global	signal_morse
	.type	signal_morse, @function
signal_morse:
.LFB7:
	.loc 1 257 0
	.cfi_startproc
.LVL15:
	push r16
.LCFI4:
	.cfi_def_cfa_offset 3
	.cfi_offset 16, -2
	push r17
.LCFI5:
	.cfi_def_cfa_offset 4
	.cfi_offset 17, -3
	push r28
.LCFI6:
	.cfi_def_cfa_offset 5
	.cfi_offset 28, -4
	push r29
.LCFI7:
	.cfi_def_cfa_offset 6
	.cfi_offset 29, -5
	rcall .
	rcall .
.LCFI8:
	.cfi_def_cfa_offset 10
	in r28,__SP_L__
	in r29,__SP_H__
.LCFI9:
	.cfi_def_cfa_register 28
/* prologue: function */
/* frame size = 4 */
/* stack size = 8 */
.L__stack_usage = 8
	movw r16,r24
.LVL16:
.L20:
	.loc 1 259 0
	movw r30,r16
	ld r24,Z+
	movw r16,r30
.LVL17:
	cpse r24,__zero_reg__
	rjmp .L28
/* epilogue start */
	.loc 1 287 0
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop r29
	pop r28
	pop r17
	pop r16
.LVL18:
	ret
.LVL19:
.L28:
.LBB4:
	.loc 1 261 0
	sbi 0x5,5
	.loc 1 264 0
	movw r30,r16
	sbiw r30,1
	ld r24,Z
	ldi r20,lo8(88)
	ldi r21,lo8(2)
	cpi r24,lo8(46)
	brne .L21
	ldi r20,lo8(-56)
	ldi r21,0
.L21:
.LVL20:
	.loc 1 265 0 discriminator 4
	ldi r25,0
	ldi r24,0
.LVL21:
.L26:
	.loc 1 268 0
	sbi 0x5,1
.LBB5:
	.loc 1 270 0
	std Y+4,__zero_reg__
	std Y+3,__zero_reg__
.L22:
	.loc 1 270 0 is_stmt 0 discriminator 1
	ldd r18,Y+3
	ldd r19,Y+4
	cpi r18,-24
	sbci r19,3
	brlo .L23
.LBE5:
	.loc 1 271 0 is_stmt 1
	cbi 0x5,1
.LBB6:
	.loc 1 273 0
	std Y+2,__zero_reg__
	std Y+1,__zero_reg__
.L24:
	.loc 1 273 0 is_stmt 0 discriminator 1
	ldd r18,Y+1
	ldd r19,Y+2
	cpi r18,-24
	sbci r19,3
	brlo .L25
.LBE6:
	.loc 1 274 0 is_stmt 1
	adiw r24,1
.LVL22:
	.loc 1 266 0
	cp r20,r24
	cpc r21,r25
	brne .L26
	.loc 1 278 0
	cbi 0x5,5
	.loc 1 279 0
	cbi 0x5,1
	.loc 1 282 0
	movw r30,r16
	ld r24,Z
.LVL23:
	tst r24
	breq .L20
	.loc 1 283 0
	ldi r24,lo8(2)
	call delay_100ms_units
.LVL24:
	rjmp .L20
.LVL25:
.L23:
.LBB7:
	.loc 1 270 0 discriminator 3
/* #APP */
 ;  270 "morse_decoder.c" 1
	nop
 ;  0 "" 2
/* #NOAPP */
	ldd r18,Y+3
	ldd r19,Y+4
	subi r18,-1
	sbci r19,-1
	std Y+4,r19
	std Y+3,r18
	rjmp .L22
.L25:
.LBE7:
.LBB8:
	.loc 1 273 0 discriminator 3
/* #APP */
 ;  273 "morse_decoder.c" 1
	nop
 ;  0 "" 2
/* #NOAPP */
	ldd r18,Y+1
	ldd r19,Y+2
	subi r18,-1
	sbci r19,-1
	std Y+2,r19
	std Y+1,r18
	rjmp .L24
.LBE8:
.LBE4:
	.cfi_endproc
.LFE7:
	.size	signal_morse, .-signal_morse
.global	letter_gap
	.type	letter_gap, @function
letter_gap:
.LFB8:
	.loc 1 290 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 291 0
	ldi r24,lo8(6)
	jmp delay_100ms_units
.LVL26:
	.cfi_endproc
.LFE8:
	.size	letter_gap, .-letter_gap
.global	word_gap
	.type	word_gap, @function
word_gap:
.LFB9:
	.loc 1 295 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 296 0
	ldi r24,lo8(14)
	jmp delay_100ms_units
.LVL27:
	.cfi_endproc
.LFE9:
	.size	word_gap, .-word_gap
.global	get_morse_code
	.type	get_morse_code, @function
get_morse_code:
.LFB10:
	.loc 1 301 0
	.cfi_startproc
.LVL28:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	mov r30,r24
	.loc 1 302 0
	ldi r24,lo8(-65)
.LVL29:
	add r24,r30
	cpi r24,lo8(26)
	brsh .L37
	.loc 1 303 0
	subi r30,65
	sbc r31,r31
.LVL30:
.L41:
	.loc 1 305 0
	lsl r30
	rol r31
	subi r30,lo8(-(morseCodeMap))
	sbci r31,hi8(-(morseCodeMap))
	ld r24,Z
	ldd r25,Z+1
	ret
.LVL31:
.L37:
	.loc 1 304 0
	ldi r24,lo8(-97)
	add r24,r30
	cpi r24,lo8(26)
	brsh .L39
	.loc 1 305 0
	subi r30,97
	sbc r31,r31
.LVL32:
	rjmp .L41
.LVL33:
.L39:
.LBB11:
.LBB12:
	.loc 1 306 0
	ldi r24,lo8(-48)
	add r24,r30
	.loc 1 307 0
	subi r30,22
	sbc r31,r31
.LVL34:
	.loc 1 306 0
	cpi r24,lo8(10)
	brlo .L41
	.loc 1 309 0
	ldi r25,0
	ldi r24,0
/* epilogue start */
.LBE12:
.LBE11:
	.loc 1 311 0
	ret
	.cfi_endproc
.LFE10:
	.size	get_morse_code, .-get_morse_code
	.section	.text.startup,"ax",@progbits
.global	main
	.type	main, @function
main:
.LFB11:
	.loc 1 313 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 315 0
	sbi 0x4,5
	.loc 1 316 0
	sbi 0x4,1
	.loc 1 319 0
	cbi 0x5,5
	.loc 1 320 0
	cbi 0x5,1
	.loc 1 323 0
	call usart_init
.LVL35:
.L43:
.LBB13:
	.loc 1 329 0
	call usart_receive
.LVL36:
	mov r28,r24
.LVL37:
	.loc 1 331 0
	call usart_send
.LVL38:
	.loc 1 333 0
	cpi r28,lo8(32)
	brne .L44
	.loc 1 335 0
	call word_gap
.LVL39:
	rjmp .L43
.L44:
.LBB14:
	.loc 1 337 0
	mov r24,r28
	call get_morse_code
.LVL40:
	.loc 1 338 0
	sbiw r24,0
	breq .L43
	.loc 1 339 0
	call signal_morse
.LVL41:
	.loc 1 340 0
	call letter_gap
.LVL42:
	rjmp .L43
.LBE14:
.LBE13:
	.cfi_endproc
.LFE11:
	.size	main, .-main
.global	morseCodeMap
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	".-"
.LC1:
	.string	"-..."
.LC2:
	.string	"-.-."
.LC3:
	.string	"-.."
.LC4:
	.string	"."
.LC5:
	.string	"..-."
.LC6:
	.string	"--."
.LC7:
	.string	"...."
.LC8:
	.string	".."
.LC9:
	.string	".---"
.LC10:
	.string	"-.-"
.LC11:
	.string	".-.."
.LC12:
	.string	"--"
.LC13:
	.string	"-."
.LC14:
	.string	"---"
.LC15:
	.string	".--."
.LC16:
	.string	"--.-"
.LC17:
	.string	".-."
.LC18:
	.string	"..."
.LC19:
	.string	"-"
.LC20:
	.string	"..-"
.LC21:
	.string	"...-"
.LC22:
	.string	".--"
.LC23:
	.string	"-..-"
.LC24:
	.string	"-.--"
.LC25:
	.string	"--.."
.LC26:
	.string	"-----"
.LC27:
	.string	".----"
.LC28:
	.string	"..---"
.LC29:
	.string	"...--"
.LC30:
	.string	"....-"
.LC31:
	.string	"....."
.LC32:
	.string	"-...."
.LC33:
	.string	"--..."
.LC34:
	.string	"---.."
.LC35:
	.string	"----."
	.data
	.type	morseCodeMap, @object
	.size	morseCodeMap, 72
morseCodeMap:
	.word	.LC0
	.word	.LC1
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
	.text
.Letext0:
	.file 2 "/usr/lib/avr/include/stdint.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x390
	.word	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF22
	.byte	0xc
	.long	.LASF23
	.long	.LASF24
	.long	.Ldebug_ranges0+0x48
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
	.long	0x59
	.uleb128 0x5
	.long	0x49
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
	.uleb128 0x6
	.long	0x8c
	.long	0x8c
	.uleb128 0x7
	.long	0x59
	.byte	0x23
	.byte	0
	.uleb128 0x8
	.byte	0x2
	.long	0x99
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF9
	.uleb128 0x9
	.long	0x92
	.uleb128 0xa
	.long	.LASF25
	.byte	0x1
	.byte	0x88
	.long	0x7c
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	morseCodeMap
	.uleb128 0xb
	.byte	0x1
	.long	.LASF26
	.byte	0x1
	.word	0x139
	.byte	0x1
	.long	0x42
	.long	.LFB11
	.long	.LFE11
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x15f
	.uleb128 0xc
	.long	.LBB13
	.long	.LBE13
	.long	0x155
	.uleb128 0xd
	.string	"c"
	.byte	0x1
	.word	0x149
	.long	0x92
	.long	.LLST12
	.uleb128 0xc
	.long	.LBB14
	.long	.LBE14
	.long	0x12e
	.uleb128 0xe
	.long	.LASF10
	.byte	0x1
	.word	0x151
	.long	0x8c
	.long	.LLST13
	.uleb128 0xf
	.long	.LVL40
	.long	0x15f
	.long	0x11b
	.uleb128 0x10
	.byte	0x1
	.byte	0x68
	.byte	0x2
	.byte	0x8c
	.sleb128 0
	.byte	0
	.uleb128 0x11
	.long	.LVL41
	.long	0x1d3
	.uleb128 0x11
	.long	.LVL42
	.long	0x1a8
	.byte	0
	.uleb128 0x11
	.long	.LVL36
	.long	0x308
	.uleb128 0xf
	.long	.LVL38
	.long	0x322
	.long	0x14b
	.uleb128 0x10
	.byte	0x1
	.byte	0x68
	.byte	0x2
	.byte	0x8c
	.sleb128 0
	.byte	0
	.uleb128 0x11
	.long	.LVL39
	.long	0x17d
	.byte	0
	.uleb128 0x11
	.long	.LVL35
	.long	0x34a
	.byte	0
	.uleb128 0x12
	.byte	0x1
	.long	.LASF27
	.byte	0x1
	.word	0x12d
	.byte	0x1
	.long	0x8c
	.byte	0x1
	.long	0x17d
	.uleb128 0x13
	.string	"c"
	.byte	0x1
	.word	0x12d
	.long	0x92
	.byte	0
	.uleb128 0x14
	.byte	0x1
	.long	.LASF11
	.byte	0x1
	.word	0x127
	.long	.LFB9
	.long	.LFE9
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x1a8
	.uleb128 0x15
	.long	.LVL27
	.byte	0x1
	.long	0x274
	.uleb128 0x10
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x3e
	.byte	0
	.byte	0
	.uleb128 0x14
	.byte	0x1
	.long	.LASF12
	.byte	0x1
	.word	0x122
	.long	.LFB8
	.long	.LFE8
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x1d3
	.uleb128 0x15
	.long	.LVL26
	.byte	0x1
	.long	0x274
	.uleb128 0x10
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x36
	.byte	0
	.byte	0
	.uleb128 0x16
	.byte	0x1
	.long	.LASF15
	.byte	0x1
	.word	0x101
	.byte	0x1
	.long	.LFB7
	.long	.LFE7
	.long	.LLST5
	.byte	0x1
	.long	0x274
	.uleb128 0x17
	.long	.LASF17
	.byte	0x1
	.word	0x101
	.long	0x8c
	.long	.LLST6
	.uleb128 0xd
	.string	"i"
	.byte	0x1
	.word	0x102
	.long	0x42
	.long	.LLST7
	.uleb128 0x18
	.long	.LBB4
	.long	.LBE4
	.uleb128 0xe
	.long	.LASF13
	.byte	0x1
	.word	0x108
	.long	0x49
	.long	.LLST8
	.uleb128 0xe
	.long	.LASF14
	.byte	0x1
	.word	0x109
	.long	0x49
	.long	.LLST9
	.uleb128 0x19
	.long	.Ldebug_ranges0+0x18
	.long	0x24c
	.uleb128 0x1a
	.string	"d"
	.byte	0x1
	.word	0x10e
	.long	0x54
	.byte	0x2
	.byte	0x8c
	.sleb128 3
	.byte	0
	.uleb128 0x19
	.long	.Ldebug_ranges0+0x30
	.long	0x263
	.uleb128 0x1a
	.string	"d"
	.byte	0x1
	.word	0x111
	.long	0x54
	.byte	0x2
	.byte	0x8c
	.sleb128 1
	.byte	0
	.uleb128 0x1b
	.long	.LVL24
	.long	0x274
	.uleb128 0x10
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x32
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1c
	.byte	0x1
	.long	.LASF16
	.byte	0x1
	.byte	0xfa
	.byte	0x1
	.long	.LFB6
	.long	.LFE6
	.long	.LLST2
	.byte	0x1
	.long	0x2ba
	.uleb128 0x1d
	.long	.LASF18
	.byte	0x1
	.byte	0xfa
	.long	0x30
	.long	.LLST3
	.uleb128 0x1e
	.long	.Ldebug_ranges0+0
	.uleb128 0x1f
	.string	"i"
	.byte	0x1
	.byte	0xfb
	.long	0x30
	.long	.LLST4
	.uleb128 0x11
	.long	.LVL13
	.long	0x2ba
	.byte	0
	.byte	0
	.uleb128 0x20
	.byte	0x1
	.long	.LASF28
	.byte	0x1
	.byte	0xca
	.long	.LFB5
	.long	.LFE5
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.uleb128 0x1c
	.byte	0x1
	.long	.LASF19
	.byte	0x1
	.byte	0x7a
	.byte	0x1
	.long	.LFB4
	.long	.LFE4
	.long	.LLST0
	.byte	0x1
	.long	0x302
	.uleb128 0x21
	.string	"str"
	.byte	0x1
	.byte	0x7a
	.long	0x302
	.long	.LLST1
	.uleb128 0x11
	.long	.LVL6
	.long	0x322
	.byte	0
	.uleb128 0x8
	.byte	0x2
	.long	0x92
	.uleb128 0x22
	.byte	0x1
	.long	.LASF29
	.byte	0x1
	.byte	0x70
	.byte	0x1
	.long	0x92
	.long	.LFB3
	.long	.LFE3
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.uleb128 0x23
	.byte	0x1
	.long	.LASF20
	.byte	0x1
	.byte	0x66
	.byte	0x1
	.long	.LFB2
	.long	.LFE2
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x34a
	.uleb128 0x24
	.long	.LASF21
	.byte	0x1
	.byte	0x66
	.long	0x92
	.byte	0x1
	.byte	0x68
	.byte	0
	.uleb128 0x25
	.byte	0x1
	.long	.LASF30
	.byte	0x1
	.byte	0x39
	.byte	0x1
	.long	.LFB1
	.long	.LFE1
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.uleb128 0x26
	.long	0x15f
	.long	.LFB10
	.long	.LFE10
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.uleb128 0x27
	.long	0x172
	.long	.LLST10
	.uleb128 0x28
	.long	0x15f
	.long	.LBB11
	.long	.LBE11
	.uleb128 0x27
	.long	0x172
	.long	.LLST11
	.byte	0
	.byte	0
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
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x26
	.byte	0
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
	.uleb128 0xc
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
	.uleb128 0xd
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
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x10
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0xa
	.uleb128 0x2111
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x15
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
	.uleb128 0x17
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
	.uleb128 0x18
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
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
	.uleb128 0x1b
	.uleb128 0x4109
	.byte	0x1
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
	.uleb128 0x1d
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
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x6
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
	.byte	0
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
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST12:
	.long	.LVL37
	.long	.LVL38-1
	.word	0x1
	.byte	0x68
	.long	.LVL38-1
	.long	.LFE11
	.word	0x1
	.byte	0x6c
	.long	0
	.long	0
.LLST13:
	.long	.LVL40
	.long	.LVL41-1
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
	.long	.LFB7
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
	.sleb128 10
	.long	.LCFI9
	.long	.LFE7
	.word	0x2
	.byte	0x8c
	.sleb128 10
	.long	0
	.long	0
.LLST6:
	.long	.LVL15
	.long	.LVL16
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL16
	.long	.LFE7
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x9f
	.long	0
	.long	0
.LLST7:
	.long	.LVL16
	.long	.LVL17
	.word	0x7
	.byte	0x80
	.sleb128 0
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x1c
	.byte	0x9f
	.long	.LVL17
	.long	.LVL18
	.word	0x8
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x20
	.byte	0x80
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.long	.LVL18
	.long	.LVL19
	.word	0x8
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x20
	.byte	0x8e
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.long	.LVL19
	.long	.LVL24
	.word	0x8
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x20
	.byte	0x80
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.long	.LVL24
	.long	.LVL25
	.word	0x7
	.byte	0x80
	.sleb128 0
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x1c
	.byte	0x9f
	.long	.LVL25
	.long	.LFE7
	.word	0x8
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x20
	.byte	0x80
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.long	0
	.long	0
.LLST8:
	.long	.LVL20
	.long	.LVL24-1
	.word	0x6
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x65
	.byte	0x93
	.uleb128 0x1
	.long	.LVL25
	.long	.LFE7
	.word	0x6
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x65
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST9:
	.long	.LVL20
	.long	.LVL21
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	.LVL21
	.long	.LVL23
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL25
	.long	.LFE7
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
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
	.long	.LFE6
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	0
	.long	0
.LLST3:
	.long	.LVL7
	.long	.LVL9
	.word	0x1
	.byte	0x68
	.long	.LVL9
	.long	.LVL10
	.word	0x1
	.byte	0x6d
	.long	.LVL10
	.long	.LVL12
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x9f
	.long	.LVL12
	.long	.LFE6
	.word	0x1
	.byte	0x6d
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
	.word	0x1
	.byte	0x6c
	.long	.LVL12
	.long	.LFE6
	.word	0x1
	.byte	0x6c
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
.LLST10:
	.long	.LVL28
	.long	.LVL29
	.word	0x1
	.byte	0x68
	.long	.LVL29
	.long	.LVL30
	.word	0x1
	.byte	0x6e
	.long	.LVL30
	.long	.LVL31
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x9f
	.long	.LVL31
	.long	.LVL32
	.word	0x1
	.byte	0x6e
	.long	.LVL32
	.long	.LVL33
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x9f
	.long	.LVL33
	.long	.LVL34
	.word	0x1
	.byte	0x6e
	.long	.LVL34
	.long	.LFE10
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x9f
	.long	0
	.long	0
.LLST11:
	.long	.LVL33
	.long	.LVL34
	.word	0x1
	.byte	0x6e
	.long	.LVL34
	.long	.LFE10
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
	.long	.LFB11
	.long	.LFE11-.LFB11
	.long	0
	.long	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.long	.LBB2
	.long	.LBE2
	.long	.LBB3
	.long	.LBE3
	.long	0
	.long	0
	.long	.LBB5
	.long	.LBE5
	.long	.LBB7
	.long	.LBE7
	.long	0
	.long	0
	.long	.LBB6
	.long	.LBE6
	.long	.LBB8
	.long	.LBE8
	.long	0
	.long	0
	.long	.Ltext0
	.long	.Letext0
	.long	.LFB11
	.long	.LFE11
	.long	0
	.long	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF10:
	.string	"morse"
.LASF29:
	.string	"usart_receive"
.LASF13:
	.string	"on_duration_ms"
.LASF19:
	.string	"usart_send_string"
.LASF22:
	.string	"GNU C99 7.3.0 -mn-flash=1 -mno-skip-bug -mmcu=avr5 -gdwarf-2 -Os -std=gnu99 -funsigned-char -funsigned-bitfields -fpack-struct -fshort-enums"
.LASF18:
	.string	"units"
.LASF28:
	.string	"delay_timer"
.LASF11:
	.string	"word_gap"
.LASF23:
	.string	"morse_decoder.c"
.LASF1:
	.string	"unsigned char"
.LASF17:
	.string	"morse_string"
.LASF27:
	.string	"get_morse_code"
.LASF6:
	.string	"long unsigned int"
.LASF15:
	.string	"signal_morse"
.LASF21:
	.string	"send_char"
.LASF26:
	.string	"main"
.LASF25:
	.string	"morseCodeMap"
.LASF12:
	.string	"letter_gap"
.LASF20:
	.string	"usart_send"
.LASF16:
	.string	"delay_100ms_units"
.LASF4:
	.string	"unsigned int"
.LASF8:
	.string	"long long unsigned int"
.LASF2:
	.string	"uint8_t"
.LASF14:
	.string	"elapsed"
.LASF30:
	.string	"usart_init"
.LASF24:
	.string	"/media/ravindu/Documents/University/CO321/Repo/CO321_Embedded_Labs/Project"
.LASF7:
	.string	"long long int"
.LASF9:
	.string	"char"
.LASF3:
	.string	"uint16_t"
.LASF5:
	.string	"long int"
.LASF0:
	.string	"signed char"
	.ident	"GCC: (GNU) 7.3.0"
.global __do_copy_data
