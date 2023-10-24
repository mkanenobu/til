import type { ZodObject, ZodRawShape } from "zod";
import { dateRangeFilter } from "./date-range-filter.ts";
import { eventCountFilter } from "./event-count-filter.ts";

export const filters = {
  dateRangeFilter,
  eventCountFilter,
} as const satisfies Record<string, ZodObject<ZodRawShape>>;
