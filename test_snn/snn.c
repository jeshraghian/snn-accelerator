/*
 * SPDX-FileCopyrightText: 2020 Efabless Corporation
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * SPDX-License-Identifier: Apache-2.0
 */

// This include is relative to $CARAVEL_PATH (see Makefile)
#include <defs.h>
#include <stub.c>

#define PROJECT_ID 9

/*
	IO Test:
		- Configures MPRJ lower 8-IO pins as outputs
		- Observes counter value through the MPRJ lower 8 IO pins (in the testbench)
*/

#define PROJECT_ID 9

void main()
{
		/* 
		IO Control Registers
		| DM     | VTRIP | SLOW  | AN_POL | AN_SEL | AN_EN | MOD_SEL | INP_DIS | HOLDH | OEB_N | MGMT_EN |
		| 3-bits | 1-bit | 1-bit | 1-bit  | 1-bit  | 1-bit | 1-bit   | 1-bit   | 1-bit | 1-bit | 1-bit   |

		Output: 0000_0110_0000_1110  (0x1808) = GPIO_MODE_USER_STD_OUTPUT
		| DM     | VTRIP | SLOW  | AN_POL | AN_SEL | AN_EN | MOD_SEL | INP_DIS | HOLDH | OEB_N | MGMT_EN |
		| 110    | 0     | 0     | 0      | 0      | 0     | 0       | 1       | 0     | 0     | 0       |
		
		
		Input: 0000_0001_0000_1111 (0x0402) = GPIO_MODE_USER_STD_INPUT_NOPULL
		| DM     | VTRIP | SLOW  | AN_POL | AN_SEL | AN_EN | MOD_SEL | INP_DIS | HOLDH | OEB_N | MGMT_EN |
		| 001    | 0     | 0     | 0      | 0      | 0     | 0       | 0       | 0     | 1     | 0       |

		*/

		/* Set up the housekeeping SPI to be connected internally so	*/
		/* that external pin changes don't affect it.			*/

		// reg_spi_enable = 1;
		// reg_spimaster_cs = 0x10001;
		// reg_spimaster_control = 0x0801;

		// reg_spimaster_control = 0xa002;	// Enable, prescaler = 2,
											// connect to housekeeping SPI

		// Connect the housekeeping SPI to the SPI master
		// so that the CSB line is not left floating.  This allows
		// all of the GPIO pins to be used for user functions.

		// 8-bit input stream
		// Observe counter value in the testbench
		reg_mprj_io_8  =  GPIO_MODE_USER_STD_INPUT_NOPULL;
		reg_mprj_io_9  =  GPIO_MODE_USER_STD_INPUT_NOPULL;
		reg_mprj_io_10 =  GPIO_MODE_USER_STD_INPUT_NOPULL;
		reg_mprj_io_11 =  GPIO_MODE_USER_STD_INPUT_NOPULL;
		reg_mprj_io_12 =  GPIO_MODE_USER_STD_INPUT_NOPULL;
		reg_mprj_io_13 =  GPIO_MODE_USER_STD_INPUT_NOPULL;
		reg_mprj_io_14 =  GPIO_MODE_USER_STD_INPUT_NOPULL;
		reg_mprj_io_15 =  GPIO_MODE_USER_STD_INPUT_NOPULL;

		// 2x spike_out
		reg_mprj_io_16 =  GPIO_MODE_USER_STD_OUTPUT;
		reg_mprj_io_17 =  GPIO_MODE_USER_STD_OUTPUT;

		// 8-bit output state
		reg_mprj_io_18 =  GPIO_MODE_USER_STD_OUTPUT;
		reg_mprj_io_19 =  GPIO_MODE_USER_STD_OUTPUT;
		reg_mprj_io_20 =  GPIO_MODE_USER_STD_OUTPUT;
		reg_mprj_io_21 =  GPIO_MODE_USER_STD_OUTPUT;
		reg_mprj_io_22 =  GPIO_MODE_USER_STD_OUTPUT;
		reg_mprj_io_23 =  GPIO_MODE_USER_STD_OUTPUT;
		reg_mprj_io_24 =  GPIO_MODE_USER_STD_OUTPUT;
		reg_mprj_io_25 =  GPIO_MODE_USER_STD_OUTPUT;

		// hard-wired reset
		reg_mprj_io_26 =  GPIO_MODE_USER_STD_INPUT_NOPULL;

	/* Apply configuration */
	reg_mprj_xfer = 1;
	while (reg_mprj_xfer == 1);

	// activate the project by setting the 0th bit of 1st bank of LA
    reg_la0_iena = 0; // input enable off
    reg_la0_oenb = 0xffffffff; // output enable bar low (enabled)
    reg_la0_data |= (1 << PROJECT_ID);

    // // reset design with 0bit of 2nd bank of LA
    reg_la1_oenb = 0xffffffff; // enable
    reg_la1_iena = 0;
    reg_la1_data = 1;
    reg_la1_data = 0;

    // no need for anything else as this design is free running.
}

