import { DB } from "https://deno.land/x/sqlite@v3.1.3/mod.ts";

export const createDB = (path: string): DB => new DB(path);
