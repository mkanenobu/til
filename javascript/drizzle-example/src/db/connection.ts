import { createPool } from "mysql2/promise";
import { drizzle, type MySql2Database } from "drizzle-orm/mysql2";

export type DbInstance = MySql2Database;

export const createDbConnection = () => {
  const pool = createPool(
    "mariadb://root:password@127.0.0.1:3306/drizzle_orm_test"
  );
  return { pool, dbInstance: drizzle(pool) };
};
