import { DB } from "https://deno.land/x/sqlite@v3.1.3/mod.ts";
import { QueryParameterSet } from "https://deno.land/x/sqlite@v3.1.3/src/query.ts";

export class DataBase {
  db: DB;

  constructor(path: string) {
    this.db = new DB(path);
  }

  query(sql: string, params?: QueryParameterSet | undefined) {
    return this.db.query(sql, params);
  }

  findById(id: number | string, table: string) {
    return this.query("SELECT * FROM ? WHERE id = ? LIMIT 1", [table, id])?.[0];
  }

  close() {
    return this.db.close();
  }
}
