import { prisma } from "./prisma-client";

/**
 * Closure Table を使った実装
 *
 * RDB の仕組みを使って参照の整合性を担保することができ、データの挿入・参照も容易だが、構造が複雑でデータ量も多くなる
 */
export const closureTable = async () => {
  // Create data
  const topCategory = await prisma.categoryWithClosureTable.create({
    data: {
      name: "Top Category",
    },
  });
  const secondLevelCategory1 = await prisma.categoryWithClosureTable.create({
    data: {
      name: "Second Level Category1",
    },
  });
  const secondLevelCategory2 = await prisma.categoryWithClosureTable.create({
    data: {
      name: "Second Level Category2",
    },
  });
  const thirdLevelCategory1 = await prisma.categoryWithClosureTable.create({
    data: {
      name: "Third Level Category1",
    },
  });
  // Create category relation
  await prisma.$transaction(async (tx) => {
    await tx.categoryTree.createMany({
      data: [
        // Top Category
        {
          ancestorCategoryId: topCategory.id,
          descendentCategoryId: topCategory.id,
          depth: 0,
        },
        // Second 1
        {
          ancestorCategoryId: secondLevelCategory1.id,
          descendentCategoryId: secondLevelCategory1.id,
          depth: 0,
        },
        {
          ancestorCategoryId: topCategory.id,
          descendentCategoryId: secondLevelCategory1.id,
          depth: 1,
        },
        // Second 2
        {
          ancestorCategoryId: secondLevelCategory2.id,
          descendentCategoryId: secondLevelCategory2.id,
          depth: 0,
        },
        {
          ancestorCategoryId: topCategory.id,
          descendentCategoryId: secondLevelCategory2.id,
          depth: 1,
        },
        // Third
        {
          ancestorCategoryId: thirdLevelCategory1.id,
          descendentCategoryId: thirdLevelCategory1.id,
          depth: 0,
        },
        {
          ancestorCategoryId: secondLevelCategory2.id,
          descendentCategoryId: thirdLevelCategory1.id,
          depth: 1,
        },
        {
          ancestorCategoryId: topCategory.id,
          descendentCategoryId: thirdLevelCategory1.id,
          depth: 2,
        },
      ],
    });
  });

  // Get data
  const topParentCategory = await getTopParentCategoryFromChildCategory(
    "Third Level Category1",
  );
  console.log(
    "Third Level Category1's top parent category is:",
    topParentCategory.name,
  );

  const categoriesDirectoryUnderTopCategory =
    await prisma.categoryTree.findMany({
      where: {
        ancestorCategoryId: topCategory.id,
        depth: 1,
      },
      include: {
        descendentCategory: true,
      },
    });
  console.log(
    "Top Category's directory under children are:",
    categoriesDirectoryUnderTopCategory.map(
      (category) => category.descendentCategory.name,
    ),
  );
};

/**
 * 子カテゴリから一番上のカテゴリを取得する
 * 一番深さの大きい（一番離れた=一番上）リレーションから親カテゴリを取得する
 */
const getTopParentCategoryFromChildCategory = async (
  childCategoryName: string,
) => {
  const furthestRelation = await prisma.categoryTree.findFirst({
    where: {
      descendentCategory: {
        name: childCategoryName,
      },
    },
    orderBy: {
      depth: "desc",
    },
  });

  if (!furthestRelation) {
    throw new Error("Category not found");
  }

  return await prisma.categoryWithClosureTable.findUniqueOrThrow({
    where: {
      id: furthestRelation.ancestorCategoryId,
    },
  });
};
