import type { Metadata } from "next";

export const metadata: Metadata = {
  title: "Page A",
};
const A = () => {
  return (
    <div>
      <h1>A</h1>
      <p>This is page A.</p>
    </div>
  );
};

export default A;
