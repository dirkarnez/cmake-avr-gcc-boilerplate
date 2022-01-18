/**
 * \brief Header for mylib.
 *
 * \file mylib.h
 * \author Matthias Kleemann
 */

/**
 * \brief initializes a port pin for a LED
 * In this case port pin 2 of the port D of an atmega8 is used.
 */
void initPort(void);

/**
 * \brief toggle the defined port pin for the LED
 */
void togglePin(void);

#include <avr/io.h>

/*
Steps 
1. set inital value to TCNT0
2. set timer configuration to TCCR0A / TCCR0B (CS02 CS01 CS00)
3. monitor TOV0
4. stop the timer by disconnecting the timer
5. clear TOV0 flag for next iteration
6. back to step 1 to load TCNT0 again
*/ 
void NORMAL_MODE_TIMER() {
    /* 8-bit (0 - 255) */ 
    TCNT0 = 186; 
    
    /* WGM00 WGM01 */ 
    TCCR0A = 0;
    
    /* WGM02 is implicitly set 0 */
    TCCR0B = 1; 

    while ((TIFR0 & (1 << TOV0)) == 0); 

    TCCR0B = 0;

    TIFR0 = 1 << TOV0;
}