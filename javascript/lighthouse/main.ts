import { promises as fs } from "fs";
import { measureMetrics } from "./measure-metrics";

const main = async (url: string) => {
  const result = await measureMetrics(url);
  await fs.writeFile("lhreport.html", result);
};

const url = process.argv.at(-1);
if (process.argv.length <= 2 || !url) {
  throw new Error("No URL parameter.");
} else {
  main(url);
}
