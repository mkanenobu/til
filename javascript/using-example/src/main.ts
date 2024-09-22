import { FileWrapper } from "./file-wrapper.ts";

const main = async () => {
  using f = await FileWrapper.new({ path: "./test.txt", flags: "w" });

  await f.handle.write("Hello, world!");
  console.log("Wrote to file");
};

await main();
