import { z } from "zod";
import type { FilterType } from "./filter-type.ts";
import { notProperty } from "./common-properties.ts";
import { toZodUnionType, ZodUnionType } from "../../type-util.ts";

const expressions = [
  "less_than",
  "less_than_or_equal",
  "equal",
  "greater_than",
  "greater_than_or_equal",
] as const;

export const eventCountFilter = z
  .object<FilterType>({
    filterType: z.literal("eventCount"),
    properties: z.object({
      eventName: z.string(),
      count: z.number(),
      expression: z.union(
        toZodUnionType(expressions.map((expression) => z.literal(expression)))
      ),
      timeWindowStart: z.string().datetime(),
      timeWindowEnd: z.string().datetime(),
    }),
  })
  .merge(notProperty);
