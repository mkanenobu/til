import { z } from "zod";
import { filters } from "./filters/filters.ts";
import { toZodUnionType } from "../type-util.ts";

const filtersArray = toZodUnionType(Object.values(filters));

export const filterSchema = z.object({
  filters: z.array(z.union(filtersArray)),
  properties: z.object({}),
});
