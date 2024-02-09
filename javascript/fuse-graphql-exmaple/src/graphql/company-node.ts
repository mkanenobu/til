import { node } from "fuse";
import { prisma } from "../db";

type CompanySource = {
  id: string;
  name: string;
};

export const CompanyNode = node<CompanySource>({
  name: "User",
  load: async (ids) => prisma.company.findMany({ where: { id: { in: ids } } }),
  fields: (t) => ({
    name: t.exposeString("name"),
  }),
});
