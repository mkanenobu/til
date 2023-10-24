import { z } from "zod";

export const notProperty = z.object({
  not: z.boolean().optional(),
});
