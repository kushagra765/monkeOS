#ifndef _INCLUDE_ASM_IO_H
#define _INCLUDE_ASM_IO_H

#include <stdint.h>

void outb(unsigned short port, unsigned char data) {
  __asm__ volatile("outb %1, %0" : : "dN"(port), "a"(data));
}

uint8_t inb(unsigned short port) {
  unsigned char c;
  __asm__ volatile("inb %1, %0" : "=a"(c) : "dN"(port));
}
#endif // _INCLUDE_ASM_IO_H
