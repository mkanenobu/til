import { prisma } from "./prisma-client";

/**
 * それぞれのレコードが親の ID を持つ最もシンプルな実装
 */
export const withParentId = async () => {
  // Create data
  await prisma.categoryWithParentId.create({
    data: {
      name: "Top Category",
      children: {
        create: [
          {
            name: "Second Level Category1",
          },
          {
            name: "Second Level Category2",
            children: {
              create: [
                {
                  name: "Third Level Category1",
                },
              ],
            },
          },
        ],
      },
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
};

/**
 * カテゴリから一番上の親カテゴリを取得する
 * 階層数が分からないので、再帰的に親カテゴリを取得する必要がある
 */
const getTopParentCategoryFromChildCategory = async (
  childCategoryName: string,
) => {
  let category = await prisma.categoryWithParentId.findFirstOrThrow({
    where: {
      name: childCategoryName,
    },
  });

  while (true) {
    if (category.parentId === null) {
      return category;
    }

    category = await prisma.categoryWithParentId.findFirstOrThrow({
      where: {
        id: category.parentId,
      },
    });
  }
};
