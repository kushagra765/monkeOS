#include <kernel/log.h>
#include <kernel/tty.h>

void log(const char message) {
  terminal_writestring("%s", message);
}
