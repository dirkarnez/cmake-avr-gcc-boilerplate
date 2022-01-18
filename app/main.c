// // /**
// //  * \brief Simple application to toggle an AVR output for a LED.
// //  *
// //  * \file main.c
// //  * \author Matthias Kleemann
// //  */

// // #include <avr/io.h>
// // #include "mylib.h"

// // /**
// //  * \brief main loop
// //  * Within the main loop the LED port(s) are initialized and toggled, using mylib. The
// //  * main loop never ends until switching off the AVR itself.
// //  */
// // int main(void)
// // {
// //    /* test the GNU __extension__ with -pedantic settings */
// //    uint8_t someBinVar = __extension__ 0b01011010;

// //    DDRB |= someBinVar;

// //    initPort();

// //    while(1)
// //    {
// //       togglePin();
// //    }
// // }

// #include <avr/io.h>
// #include "mylib.h"

// int main(void)
// {
//    DDRB = 0xFF;
//    PORTB &= ~(0x10);

//    while (1) {
//       /* 8-bit (0 - 255) */
//       TCNT0 = 186;

//       /* WGM00 WGM01 */
//       TCCR0A = 0;

//       /* WGM02 is implicitly set 0 */
//       TCCR0B = (1 << CS02) | (1 << CS00);

//       while ((TIFR0 & (1 << TOV0)) == 0);

//       TCCR0B = 0;

//       TIFR0 = (1 << TOV0);

//       PORTB ^= 0x10;
//    }
// }

#include <avr/io.h>
#include <avr/interrupt.h>

// Every 4 times 25ms is equal to 1s
int ms25 = 0;

int main(void)
{
   // Set pin PC5 as output for the LED
   DDRB = 0xFF;
   PORTB &= ~(0x10);

   // Set timer mode to CTC
   TCCR0A = (1 << WGM01);

   // Calculate the equivalence of 0.25s using
   // an online AVR calculator
   OCR0A = 244;
   TIMSK0 = (1 << OCIE0A);

   // Enable interrupts
   sei();

   // Set prescaler to 1024
   TCCR0B = (1 << CS02) | (1 << CS00);

   while (1)
   {
      // Do nothing
   }
}

ISR(TIMER0_COMPA_vect)
{
   // Increment 25ms timer
   ms25++;

   // If already 1 second
   if (ms25 > 3)
   {

      // Reset timer
      ms25 = 0;

      // Toggle LED
      PORTB = PORTB ^ 0x10;
   }
}