#include <klee/klee.h>
#include <stdio.h>

int main() {
  int x, t;
  int y = 0;
  int z = 0;
  klee_make_symbolic(&x, sizeof(x), "x");
  klee_make_symbolic(&t, sizeof(t), "t");

  klee_assert(t > 0 && x > -1 && x < 2);

  if (t > 1) {
    y = 0;
    z = 1;
  } else {
    y = 1;
    z = 2;
  }

  if (x > 0) {
    x++;
    z = z + 33;
  } else {
    x = x + 3;
    y = -y;
    z = -z + 2;
  }

  klee_assert(x > -3 && x < 6 && y < z);
}
