import { zodToJsonSchema } from "zod-to-json-schema";
import { filterSchema } from "./schema/main.ts";

export const jsonSchema = zodToJsonSchema(filterSchema);

console.log(JSON.stringify(jsonSchema, undefined, 2));
