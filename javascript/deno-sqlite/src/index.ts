import { createDB } from "./db.ts";

const path = "data.sqlite";

const main = async () => {
  const db = createDB(path);
  try {
    await db.query(`
        CREATE TABLE IF NOT EXISTS people (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT
        )
    `);

    console.log(await db.query("SELECT * FROM people"));

    const names = ["Peter Parker", "Clark Kent", "Bruce Wayne"];
    names.forEach((name) => {
      db.query("INSERT INTO people (name) VALUES (:name)", { name });
    });

    console.log(await db.query("SELECT * FROM people"));
    console.log(await db.query("SELECT * FROM people WHERE id = 2"));
  } finally {
    db.close();
  }
};

main();
