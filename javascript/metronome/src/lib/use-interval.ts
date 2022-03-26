import { useEffect, useState } from "react";

export const useInterval = (
  handler: () => unknown,
  intervalMs: number
): void => {
  useEffect(() => {
    const timerId = setInterval(handler, intervalMs);
    return () => clearInterval(timerId);
  }, [handler]);
};
