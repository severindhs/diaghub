          main:
08000208:   push    {r7, lr}
0800020a:   sub     sp, #72 @ 0x48
0800020c:   add     r7, sp, #0
0800020e:   add.w   r3, r7, #80     @ 0x50
08000212:   str     r3, [r7, #64]   @ 0x40
 76         HAL_Init();
08000214:   bl      0x80005a8 <HAL_Init>
 83         SystemClock_Config();
08000218:   bl      0x8000244 <SystemClock_Config>
 90         MX_GPIO_Init();
0800021c:   bl      0x8000328 <MX_GPIO_Init>
 91         MX_USART2_UART_Init();
08000220:   bl      0x80002c8 <MX_USART2_UART_Init>
 93         uint32_t counter = 0;
08000224:   movs    r3, #0
08000226:   str     r3, [r7, #68]   @ 0x44
108       	  DebugMsg("Hier bin ich!\r\n");
08000228:   add.w   r3, r7, #64     @ 0x40
0800022c:   mov     r12, r3
0800022e:   ldr     r0, [pc, #16]   @ (0x8000240 <main+56>)
08000230:   bl      0x80001d8 <DebugMsg>
109       	  HAL_Delay(500);
08000234:   mov.w   r0,#500        @ 0x1f4
08000238:   bl      0x8000674 <HAL_Delay>
108       	  DebugMsg("Hier bin ich!\r\n");
0800023c:   nop     
0800023e:   b.n     0x8000228 <main+32>
08000240:   cmp     r0,#160        @ 0xa0
08000242:   lsrs    r0, r0, #32