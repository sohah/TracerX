#include <stdio.h>
#include <klee/klee.h>

int main() {
  int x = 0;
  int b1, b2;

  klee_make_symbolic(&b1, sizeof(b1), "b1");
  klee_make_symbolic(&b2, sizeof(b2), "b2");

  if (b1==1)              // interp: b1 => b2 => x!=1
    x = x + 12;           // interp: b2 => x+12!=13 -> b2 => x!=1

  if (b2==1)              // interp_T: b2 => x != 13      interp_F: !b2 => x!=28 ----> (x!=13 && x!=28) ==============> !b1 && x=0 => x!=13 && x!=28 <========= subsumption occurs for 2 paths
    x = x + 15;           // interp: x+15 != 28 -> x!=13        

  klee_assert(x !=28 );   //(T,T) interp: (x!=28)
}


