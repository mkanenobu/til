import type { Metadata } from "next";

export const metadata: Metadata = {
  title: "Page B",
};

const B = () => {
  return (
    <div>
      <h1>B</h1>
      <p>This is page B.</p>
      {/* Image without alt text */}
      <img src="/images/test.png" />
    </div>
  );
};

export default B;
