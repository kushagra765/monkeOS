#include <kernel/tty.h>
#include <kernel/log.h>
#include <stdio.h>

void kernel_main(void) {
  terminal_initialize();
  log("TTY initialized");
  log("Kernel booted");
  printf("Welcome to monkeOS!\n");
  printf("This is all there is :(\n");
  printf("At least it works.");
}
