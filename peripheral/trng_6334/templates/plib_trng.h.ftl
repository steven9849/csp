/*******************************************************************************
  Interface definition of TRNG PLIB.

  Company:
    Microchip Technology Inc.

  File Name:
    plib_trng.h

  Summary:
    Interface definition of the Watch Dog Timer Plib (TRNG).

  Description:
    This file defines the interface for the TRNG Plib.
    It allows user to setup timeout duration and restart watch dog timer.
*******************************************************************************/

/*******************************************************************************
Copyright (c) 2017 released Microchip Technology Inc.  All rights reserved.

Microchip licenses to you the right to use, modify, copy and distribute
Software only when embedded on a Microchip microcontroller or digital signal
controller that is integrated into your product or third party product
(pursuant to the sublicense terms in the accompanying license agreement).

You should refer to the license agreement accompanying this Software for
additional information regarding your rights and obligations.

SOFTWARE AND DOCUMENTATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND,
EITHER EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION, ANY WARRANTY OF
MERCHANTABILITY, TITLE, NON-INFRINGEMENT AND FITNESS FOR A PARTICULAR PURPOSE.
IN NO EVENT SHALL MICROCHIP OR ITS LICENSORS BE LIABLE OR OBLIGATED UNDER
CONTRACT, NEGLIGENCE, STRICT LIABILITY, CONTRIBUTION, BREACH OF WARRANTY, OR
OTHER LEGAL EQUITABLE THEORY ANY DIRECT OR INDIRECT DAMAGES OR EXPENSES
INCLUDING BUT NOT LIMITED TO ANY INCIDENTAL, SPECIAL, INDIRECT, PUNITIVE OR
CONSEQUENTIAL DAMAGES, LOST PROFITS OR LOST DATA, COST OF PROCUREMENT OF
SUBSTITUTE GOODS, TECHNOLOGY, SERVICES, OR ANY CLAIMS BY THIRD PARTIES
(INCLUDING BUT NOT LIMITED TO ANY DEFENSE THEREOF), OR OTHER SIMILAR COSTS.
*******************************************************************************/

<#macro GenerateCode>
#ifndef TRNG${INDEX?string}_H    // Guards against multiple inclusion
#define TRNG${INDEX?string}_H


#include "${__PROCESSOR}.h"
#include <stdint.h>
#include <stddef.h>

#ifdef __cplusplus // Provide C++ Compatibility
 extern "C" {
#endif


// *****************************************************************************
// *****************************************************************************
// Section: Interface
// *****************************************************************************
// *****************************************************************************

<#if trngEnableInterrupt == true>
	<#lt>typedef void (*TRNG_CALLBACK)(uintptr_t context, uint32_t random);
</#if>

<#if trngEnableInterrupt == true>
	<#lt>typedef struct
	<#lt>{
	<#lt>	TRNG_CALLBACK          callback; 
	<#lt>	uintptr_t               context;
	<#lt>	uint32_t				data;
	<#lt>} TRNG_OBJECT ;
	
	<#lt>TRNG_OBJECT trng;
</#if>
/***************************** TRNG API *******************************/
<#if trngEnableInterrupt == true>
	<#lt>void TRNG${INDEX?string}_RandomNumberGenerate( void );
</#if>
<#if trngEnableInterrupt == false>
	<#lt>uint32_t TRNG${INDEX?string}_ReadData( void );
</#if>
<#if trngEnableInterrupt == true>
	<#lt>void TRNG${INDEX?string}_CallbackRegister( TRNG_CALLBACK callback, uintptr_t context );
</#if>	

#ifdef __cplusplus // Provide C++ Compatibility
 }
#endif

#endif 
</#macro>

<#if TRNG_Reserved == false>
<@GenerateCode/>
<#else>
/**** Warning: This module is used and configured by Crypto Library ****/
</#if>