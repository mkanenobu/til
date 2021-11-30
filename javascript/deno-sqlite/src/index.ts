import { DataBase } from "./db.ts";
import { People } from "./people.ts";

const path = "data.sqlite";

const main = async () => {
  const db = new DataBase(path);
  try {
    const people = new People(db);

    await people.create("John Doe");
    console.log(await people.getAll())

    console.log(await people.get(2));
  } finally {
    db.close();
  }
};

main();
