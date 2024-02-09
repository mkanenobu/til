import { node, addNodeFields } from "fuse";
import { prisma } from "../db";
import { CompanyNode } from "./company-node";

type UserSource = {
  id: string;
  email: string;
  name: string | null;
};

export const UserNode = node<UserSource>({
  name: "User",
  load: async (ids) => prisma.user.findMany({ where: { id: { in: ids } } }),
  fields: (t) => ({
    name: t.exposeString("name"),
    email: t.exposeString("email"),
    // computed field
    firstName: t.string({
      resolve: (user) => user.name?.split(" ").at(0) ?? null,
    }),
  }),
});

addNodeFields(CompanyNode, (t) => ({
  users: t.field({
    type: [UserNode],
    resolve: async (company) => {
      const result = await prisma.user.findMany({
        where: { companyId: company.id },
      });
      return result;
    },
  }),
}));
