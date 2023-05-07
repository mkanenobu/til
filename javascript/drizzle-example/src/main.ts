import { users, cities, type NewUser, type NewCity } from "./db/schema";
import { createDbConnection, type DbInstance } from "./db/connection";
import { eq } from "drizzle-orm";
import { randomUUID } from "node:crypto";

const getAllUsers = async (db: DbInstance) =>
  db
    .select()
    .from(users)
    .leftJoin(cities, eq(users.cityId, cities.id))
    .execute();

const insertRecords = async (db: DbInstance) => {
  const tokyoId = randomUUID();
  const tokyo: NewCity = {
    id: tokyoId,
    name: "Tokyo",
  };
  // insert one
  await db.insert(cities).ignore().values(tokyo).execute();
  const newYorkId = randomUUID();
  const newYork: NewCity = {
    id: newYorkId,
    name: "New York",
  };
  await db.insert(cities).ignore().values(newYork).execute();

  const newUsers: Array<NewUser> = [
    {
      id: randomUUID(),
      email: "john@example.com",
      cityId: tokyoId,
    },
    {
      id: randomUUID(),
      email: "alice@example.com",
      cityId: tokyoId,
    },
    {
      id: randomUUID(),
      email: "tanaka@example.com",
      cityId: newYorkId,
    },
  ];
  // insert many
  await db.insert(users).ignore().values(newUsers).execute();
};

const findAlice = async (db: DbInstance) =>
  db
    .select()
    .from(users)
    .where(eq(users.email, "alice@example.com"))
    .leftJoin(cities, eq(users.cityId, cities.id))
    .execute();

const update = async (db: DbInstance) => {
  const aliceBeforeUpdate = await findAlice(db);
  console.log("aliceBeforeUpdate", aliceBeforeUpdate);

  const newYork = (
    await db.select().from(cities).where(eq(cities.name, "New York")).execute()
  ).at(0)!;

  await db
    .update(users)
    .set({ cityId: newYork.id })
    .where(eq(users.email, "alice@example.com"))
    .execute();

  const aliceAfterUpdate = await findAlice(db);
  console.log("aliceAfterUpdate", aliceAfterUpdate);
};

const deleteRecords = async (db: DbInstance) => {
  // delete all
  await db.delete(users).execute();

  // delete one
  await db.delete(cities).where(eq(cities.name, "Tokyo")).execute();
  await db.delete(cities).where(eq(cities.name, "New York")).execute();
};
const main = async () => {
  console.info("Start");

  const { pool, dbInstance: db } = createDbConnection();

  let allUsers = await getAllUsers(db);
  console.log("allUsers", allUsers);

  await insertRecords(db);

  allUsers = await getAllUsers(db);
  console.log("allUsers", allUsers);

  const tokyo = (
    await db.select().from(cities).where(eq(cities.name, "Tokyo"))
  ).at(0)!;

  const tokyoUsers = await db
    .select()
    .from(users)
    .where(eq(users.cityId, tokyo.id));
  console.log("tokyoUsers", tokyoUsers);

  await update(db);

  await deleteRecords(db);

  await pool.end();
  console.info("End");
};

main();
