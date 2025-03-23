import Link from "next/link";
import type { Metadata } from "next";

export const metadata: Metadata = {
  title: "A11y Check Example",
};

const Home = () => {
  return (
    <div>
      <h1>A11y Check Example</h1>
      <div className="flex flex-col space-y-4 gap-2">
        <Link href="/a">A Link</Link>
        <Link href="/b">B Link</Link>
      </div>
    </div>
  );
};

export default Home;
