import util from "util";
import { exec as _exec } from "child_process";

const exec = util.promisify(_exec);

const result = await exec("echo hello world");
console.log(result.stdout);
