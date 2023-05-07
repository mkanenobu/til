import {
  mysqlTable,
  text,
  timestamp,
  varchar,
  uniqueIndex,
} from "drizzle-orm/mysql-core";
import { InferModel } from "drizzle-orm";

export const users = mysqlTable(
  "users",
  {
    id: varchar("id", { length: 255 }).primaryKey(),
    email: varchar("email", { length: 255 }).notNull(),
    cityId: varchar("city_id", { length: 255 })
      .notNull()
      .references(() => cities.id),
    createdAt: timestamp("created_at").notNull().defaultNow().notNull(),
    updatedAt: timestamp("updated_at")
      .notNull()
      .defaultNow()
      .notNull()
      .onUpdateNow(),
  },
  (users) => ({
    emailUniqIndex: uniqueIndex("email_uniq_idx").on(users.email),
  })
);

export type User = InferModel<typeof users>;
export type NewUser = InferModel<typeof users, "insert">;

export const cities = mysqlTable(
  "cities",
  {
    id: varchar("id", { length: 255 }).primaryKey(),
    name: text("name").notNull(),
  },
  (cities) => ({
    nameUniqIndex: uniqueIndex("name_uniq_idx").on(cities.name),
  })
);

export type City = InferModel<typeof cities>;
export type NewCity = InferModel<typeof cities, "insert">;
