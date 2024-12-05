import { useState, useMemo } from "react";
import {
  BarChart,
  Bar,
  Rectangle,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  Legend,
  ResponsiveContainer,
} from "recharts";

const orders = [
  {
    label: "O(1)",
    value: (_n) => 1,
  },
  {
    label: "O(log N)",
    value: (n) => Math.log(n),
  },
  {
    label: "O(N)",
    value: (n) => n,
  },
  {
    label: "O(N log N)",
    value: (n) => n * Math.log(n),
  },
  {
    label: "O(N^2)",
    value: (n) => n ** 2,
  },
  {
    label: "O(N^3)",
    value: (n) => n ** 3,
  },
  {
    label: "O(2^N)",
    value: (n) => 2 ** n,
  },
  // 大きすぎてグラフが読めなくなる
  // {
  //   label: "O(3^N)",
  //   value: (n) => 3 ** n,
  // },
] satisfies Array<{ label: string; value: (n: number) => number }>;

export const App = () => {
  const [n, setN] = useState(1);

  const data = useMemo(() => {
    return orders.map((order) => ({
      name: order.label,
      uv: Number(order.value(n)),
    }));
  }, [n]);

  return (
    <div style={{ height: "100vh", width: "100vw" }}>
      <div style={{ display: "inline-flex", gap: "4px" }}>
        <label htmlFor="n">N: </label>
        <input
          id="n"
          type="number"
          value={n}
          onChange={(e) => {
            const n = Number(e.target.value);
            if (!Number.isNaN(n) && n > 0) {
              setN(n);
            } else {
              setN(1);
            }
          }}
        />
      </div>

      <div style={{ marginTop: "2rem", height: "500px", width: "800px" }}>
        <ResponsiveContainer width="100%" height="100%">
          <BarChart
            width={500}
            height={300}
            data={data}
            margin={{
              top: 5,
              right: 30,
              left: 20,
              bottom: 5,
            }}
          >
            <CartesianGrid strokeDasharray="3 3" />
            <XAxis dataKey="name" />
            <YAxis />
            <Tooltip />
            <Legend />
            <Bar
              dataKey="uv"
              fill="#82ca9d"
              activeBar={<Rectangle fill="gold" stroke="purple" />}
            />
          </BarChart>
        </ResponsiveContainer>
      </div>
    </div>
  );
};
