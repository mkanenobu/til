import type { ZodTypeAny } from "zod";

export type ZodUnionType<T = ZodTypeAny> = [T, T, ...T[]];
export const isZodUnionType = <T extends ZodTypeAny = ZodTypeAny>(
  unionValues: T[]
): unionValues is ZodUnionType<T> => {
  return unionValues.length >= 2;
};

export const toZodUnionType = <T extends ZodTypeAny = ZodTypeAny>(
  unionValues: T[]
): ZodUnionType<T> => {
  if (!isZodUnionType(unionValues)) {
    throw new Error("Invalid union values");
  }
  return unionValues;
};
