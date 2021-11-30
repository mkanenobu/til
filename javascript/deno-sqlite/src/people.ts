import type { DataBase } from "./db.ts";

const sql = (str: TemplateStringsArray): string => str.join("\n");

export class People {
  db: DataBase;

  constructor(db: DataBase) {
    this.db = db;
    this.createTable();
  }

  createTable() {
    return this.db.query(sql`
        CREATE TABLE IF NOT EXISTS people (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT
        )
    `);
  }

  create(name: string) {
    return this.db.query(sql`INSERT INTO people (name) VALUES (?)`, [name]);
  }

  get(id: number) {
    return this.db.query(sql`SELECT * FROM people WHERE id=? LIMIT 1`, [id])[0];
  }

  getAll() {
    return this.db.query(sql`SELECT * FROM people`);
  }
}
