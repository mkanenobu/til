import * as log from "https://deno.land/std@0.115.1/log/mod.ts";

const p1 = Deno.run({
  cmd: ["echo", "hello world"],
});
p1.close();

const p2 = Deno.run({
  cmd: ["echo", "hello world"],
  stdout: "piped",
  stderr: "piped",
});

const output = await p2.output();
const outStr = new TextDecoder().decode(output);
log.info(outStr);
p2.close();
