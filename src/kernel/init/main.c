#include <stdio.h>
#include <kernel/tty.h>

void kernel_main(void) {
  terminal_initialize();
  printf("Welcome to monkeOS!\n");
  printf("This is all there is :(");
}
