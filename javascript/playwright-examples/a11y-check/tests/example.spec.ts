import { expect, test } from "@playwright/test";
import { testA11y } from "./test-a11y";

test("Home", async ({ page }) => {
  await page.goto("./");
  await expect(page).toHaveTitle("A11y Check Example");

  await testA11y({ page });
});

test("Page A (from Home)", async ({ page }) => {
  await page.goto("./");

  await page.getByText("A Link").click();
  await expect(page).toHaveTitle("Page A");

  await testA11y({ page });
});

test("Page B (from Home)", async ({ page }) => {
  await page.goto("./");

  await page.getByText("B Link").click();
  await expect(page).toHaveTitle("Page B");

  // There is img without alt text in this page
  await testA11y({ page });
});
