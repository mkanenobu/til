import type { ZodObject, ZodRawShape, ZodLiteral } from "zod";

export interface FilterType extends ZodRawShape {
  filterType: ZodLiteral<string>;
  properties: ZodObject<any>;
}
