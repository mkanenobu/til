import { expect } from "@playwright/test";
import { Page } from "@playwright/test";
import { AxeBuilder } from "@axe-core/playwright";

export const testA11y = async ({
  page,
  options,
}: {
  page: Page;
  options?: {
    tags?: string[];
    disableRules?: Array<{ rule: string; why: string }>;
  };
}) => {
  const axe = new AxeBuilder({ page })
    .withTags(options?.tags ?? ["wcag2a", "wcag2aa", "wcag21a", "wcag21aa"])
    .disableRules(options?.disableRules?.map((r) => r.rule) ?? []);

  const a11yRes = await axe.analyze();
  expect(a11yRes.violations).toEqual([]);
};
