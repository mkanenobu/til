export const isPrimeNumber = (v: number): boolean => {
  if (v === 1) {
    return false;
  }

  for (let i = 2; i < Math.sqrt(v); i++) {
    if (v % i === 0) {
      return false;
    }
  }
  return true;
}
