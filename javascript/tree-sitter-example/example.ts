export const f = (a: number, b: number) => a + b;

function f2() {
  console.log("f2");
}

const main = () => {
  console.log(f(1, 2));
};

main();
