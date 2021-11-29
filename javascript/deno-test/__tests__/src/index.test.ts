import { assert } from "https://deno.land/std@0.94.0/testing/asserts.ts";
import { isZero } from "../../src/index.ts";

Deno.test("Hello test", () => {
  assert(isZero(0));
});
