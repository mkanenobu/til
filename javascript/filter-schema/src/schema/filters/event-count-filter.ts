import { z } from "zod";
import type { FilterType } from "./filter-type.ts";
import { notProperty } from "./common-properties.ts";

export const eventOccurrenceFilter = z
  .object<FilterType>({
    filterType: z.literal("eventCount"),
    properties: z.object({
      eventName: z.string(),
      count: z.number(),

    }),
  })
  .merge(notProperty);
