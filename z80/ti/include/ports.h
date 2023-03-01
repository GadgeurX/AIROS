/*
 * This file has a list of hardware ports for use with SDCC
 * Ports are of the type __sfr, which is accessed as an unsigned char
 *
 * __at is a way to get SDCC to place the variable in a static location
 * __at with ports just say what port to use.
*/

// Copied from global.h in GlassOS
__sfr __at 0x00 Port_Link;
__sfr __at 0x01 Port_Keyboard;
__sfr __at 0x02 Port_Status;
__sfr __at 0x03 Port_Interrupt_Mask;
__sfr __at 0x04 Port_Mem_Map;
__sfr __at 0x04 Port_Interrupt_Status; // Same as above, just naming it
__sfr __at 0x05 Port_Mem_B3;
__sfr __at 0x06 Port_Mem_B1;
__sfr __at 0x07 Port_Mem_B2;
__sfr __at 0x10 Port_LCD_Command;
__sfr __at 0x11 Port_LCD_Data;
__sfr __at 0x14 Port_Flash_Protect;
__sfr __at 0x15 Port_ASIC_Version;
__sfr __at 0x20 Port_CPU_Scale;
__sfr __at 0x14 Port_Flash_Protection;
// Clock
__sfr __at 0x40 Port_Clock_Control;
__sfr __at 0x41 Port_Clock_Set_0;
__sfr __at 0x42 Port_Clock_Set_1;
__sfr __at 0x43 Port_Clock_Set_2;
__sfr __at 0x44 Port_Clock_Set_3;
__sfr __at 0x45 Port_Clock_Read_0;
__sfr __at 0x46 Port_Clock_Read_1;
__sfr __at 0x47 Port_Clock_Read_2;
__sfr __at 0x48 Port_Clock_Read_3;
// USB
__sfr __at 0x55 Port_USB_Interrupt;
__sfr __at 0x5B Port_USB_Mask;
__sfr __at 0x56 Port_USB_Line_Event;
__sfr __at 0x57 Port_USB_Line_Event_Mask;
__sfr __at 0xa1 Port_USB_Outgoing_Pipe;
// Timers
__sfr __at 0x30 Port_Timer_1_OnOff;
__sfr __at 0x31 Port_Timer_1_Loop;
__sfr __at 0x32 Port_Timer_1_Counter;
__sfr __at 0x33 Port_Timer_2_OnOff;
__sfr __at 0x34 Port_Timer_2_Loop;
__sfr __at 0x35 Port_Timer_2_Counter;
__sfr __at 0x36 Port_Timer_3_OnOff;
__sfr __at 0x37 Port_Timer_3_Loop;
__sfr __at 0x38 Port_Timer_3_Counter;

