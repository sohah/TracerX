#include <stdio.h>
#include <klee/klee.h>

int main() {
  int x, p1, p2, p3;
  klee_make_symbolic(&p1, sizeof(p1), "p1");
  klee_make_symbolic(&p2, sizeof(p2), "p2");
  klee_make_symbolic(&p3, sizeof(p3), "p3");
  klee_make_symbolic(&x, sizeof(x), "x");

  if (p1 > 8)
    x = x + 1;
  else
    x = 1;
    
  if (p2 > 8)
    x = x + 2;
  else
    x = 0;

  if (p3 > 8)
    x = x + 3;
  else
    x = 3;

  klee_assert(x <= 3);
}
