import { prisma } from "./prisma-client";

/**
 * それぞれのレコードが親ノードの経路情報を持つ実装
 *
 * 実装は容易だが RDB の仕組みを使って参照の整合性を担保することが出来ない
 */
export const withPath = async () => {
  // Create data
  const topCategory = await prisma.categoryWithPath.create({
    data: {
      name: "Top Category",
      path: "",
    },
  });
  const secondLevelCategory1 = await prisma.categoryWithPath.create({
    data: {
      name: "Second Level Category1",
      path: pathJoin(topCategory.id),
    },
  });
  const secondLevelCategory2 = await prisma.categoryWithPath.create({
    data: {
      name: "Second Level Category2",
      path: pathJoin(topCategory.id),
    },
  });
  const thirdLevelCategory1 = await prisma.categoryWithPath.create({
    data: {
      name: "Third Level Category1",
      path: pathJoin(topCategory.id, secondLevelCategory2.id),
    },
  });

  // Get data
  const topParentCategory = await getTopParentCategoryFromChildCategory(
    "Third Level Category1",
  );
  console.log(
    "Third Level Category1's top parent category is:",
    topParentCategory.name,
  );

  const topCategoryChildren = await prisma.categoryWithPath.findMany({
    where: {
      path: {
        startsWith: `${topCategory.id}`,
      },
    },
  });
  console.log("Top Category's children are:", topCategoryChildren);
};

const getTopParentCategoryFromChildCategory = async (
  childCategoryName: string,
) => {
  const category = await prisma.categoryWithPath.findFirstOrThrow({
    where: {
      name: childCategoryName,
    },
  });

  const path = splitPath(category.path);
  const topId = path.at(0);
  if (!topId) {
    return category;
  }

  return await prisma.categoryWithPath.findFirstOrThrow({
    where: {
      id: parseInt(topId, 10),
    },
  });
};

const splitPath = (pathString: string): string[] =>
  pathString.split("/").filter((p) => p !== "");

const pathJoin = (...paths: Array<string | number>): string => paths.join("/");
