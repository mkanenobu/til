import { z } from "zod";
import type { FilterType } from "./filter-type.ts";
import { notProperty } from "./common-properties.ts";

export const dateRangeFilter = z
  .object<FilterType>({
    filterType: z.literal("dateRange"),
    properties: z.object({
      start: z.string().datetime(),
      end: z.string().datetime(),
    }),
  })
  .merge(notProperty);
