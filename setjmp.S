  .align  4
  .global setjmp
  .extern setjmp
  .type   setjmp,@function
setjmp:

  l.sw  4(r3),r1
  l.sw  8(r3),r2
  l.sw  12(r3),r3
  l.sw  16(r3),r4
  l.sw  20(r3),r5
  l.sw  24(r3),r6
  l.sw  28(r3),r7
  l.sw  32(r3),r8
  l.sw  36(r3),r9
  l.sw  40(r3),r10
  /* Skip r11, setjmp always set it to 0 */
  l.sw  44(r3),r12
  l.sw  48(r3),r13
  l.sw  52(r3),r14
  l.sw  56(r3),r15
  l.sw  60(r3),r16
  l.sw  64(r3),r17
  l.sw  68(r3),r18
  l.sw  72(r3),r19
  l.sw  76(r3),r20
  l.sw  80(r3),r21
  l.sw  84(r3),r22
  l.sw  88(r3),r23
  l.sw  92(r3),r24
  l.sw  96(r3),r25
  l.sw  100(r3),r26
  l.sw  104(r3),r27
  l.sw  108(r3),r28
  l.sw  112(r3),r29
  l.sw  116(r3),r30
  l.sw  120(r3),r31
  /* Save Status Register */
  l.mfspr  r13,r0,17
  l.sw    124(r3), r13
  /* Set result register to 0 and jump */
  l.addi r11,r0,0
  l.jr   r9
  l.nop

  .align  4
  .global longjmp
  .extern longjmp
  .type   longjmp,@function
longjmp:

  /* If the second argument to longjmp is zero, set return address to 1,
  otherwise set it to the value of the second argument */
  l.addi  r11,r0,1
  l.sfne  r4,r0
  l.bf    1f
  l.nop
  l.addi  r11,r4,0

  /* Load status register */
1: 
  l.lwz   r15,124(r3)
  l.mtspr r0,r15,17

  l.lwz  r1,4(r3)
  l.lwz  r2,8(r3)
  /* Skip r3 as it contains the current buffer address */
  l.lwz  r4,16(r3)
  l.lwz  r5,20(r3)
  l.lwz  r6,24(r3)
  l.lwz  r7,28(r3)
  l.lwz  r8,32(r3)
  l.lwz  r9,36(r3)
  l.lwz  r10,40(r3)
  /* Skip r11 as it's always set by longjmp */
  l.lwz  r12,44(r3)
  l.lwz  r13,48(r3)
  l.lwz  r14,52(r3)
  l.lwz  r15,56(r3)
  l.lwz  r16,60(r3)
  l.lwz  r17,64(r3)
  l.lwz  r18,68(r3)
  l.lwz  r19,72(r3)
  l.lwz  r20,76(r3)
  l.lwz  r21,80(r3)
  l.lwz  r22,84(r3)
  l.lwz  r23,88(r3)
  l.lwz  r24,92(r3)
  l.lwz  r25,96(r3)
  l.lwz  r26,100(r3)
  l.lwz  r27,104(r3)
  l.lwz  r28,108(r3)
  l.lwz  r29,112(r3)
  l.lwz  r30,116(r3)
  l.lwz  r31,120(r3)
  l.lwz  r3,12(r3)

  l.jr   r9
  l.nop
