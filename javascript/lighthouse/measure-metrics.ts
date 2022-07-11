// @ts-expect-error
import lighthouse from "lighthouse";
import { launch } from "chrome-launcher";

type LighthouseOptions = {
  categories: Array<
    "performance" | "accessibility" | "best-practices" | "seo" | "pwa"
  >;
  output: "html" | "json" | "csv";
};

export const measureMetrics = async (
  url: string,
  options?: Partial<LighthouseOptions>
) => {
  const chrome = await launch({ chromeFlags: ["--headless"] });
  const mergedOptions = {
    logLevel: "info",
    output: "html",
    // default excludes PWA
    onlyCategories: ["performance", "accessibility", "best-practices", "seo"],
    port: chrome.port,
    ...options,
  };
  const runnerResult = await lighthouse(url, mergedOptions);

  const reportHtml = runnerResult.report;
  await chrome.kill();

  return reportHtml;
};
