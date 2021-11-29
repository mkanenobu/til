import { assertNotEquals, assertEquals } from "https://deno.land/std@0.94.0/testing/asserts.ts";
import { helloWorld } from "../../src/hello.ts";

Deno.test("Hello test", () => {
  assertEquals(helloWorld(), "Hello, World!");
  assertNotEquals(helloWorld(), "Hello, World");
});
