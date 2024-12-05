export const fold = <T>(arr: T[]) => {
  return (z: T) => {
    return (f: (acc: T, cur: T) => T) => {
      return arr.reduce<T>(f, z);
    };
  }
}


const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9];
const sum = fold(numbers)(0)((acc, cur) => acc + cur);
console.log(sum);