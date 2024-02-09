import { addQueryFields } from "fuse";
import { CompanyNode } from "./graphql/company-node";
import { UserNode } from "./graphql/user-node";
import { prisma } from "./db";

addQueryFields((t) => ({
  companies: t.field({
    type: [CompanyNode],
    resolve: async () => {
      const result = await prisma.company.findMany();
      return result.map((company) => company.id);
    },
  }),
  users: t.field({
    type: [UserNode],
    resolve: async () => {
      const result = await await prisma.user.findMany();
      return result.map((user) => user.id);
    },
  }),
}));
