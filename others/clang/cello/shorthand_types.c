#include "Cello.h"

int main(int argc, char** argv) {
  /* Shorthand $ can be used for basic types */
  var prices = new(Table, String, Int);
  set(prices, $S("Apple"),  $I(120));
  set(prices, $S("Banana"), $I(70));
  set(prices, $S("Pear"),   $I(240));

  /* Tables also support iteration */
  foreach (key in prices) {
    var val = get(prices, key);
    print("Price of %$ is %$ yen\n", key, val);
  }

  return 0;
}
