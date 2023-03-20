import { useState } from "react";
import { greet } from "../wasm/pkg";

const App = () => {
  const [name, setName] = useState("");

  return (
    <div>
      <div>
        <input
          type="text"
          onChange={(e) => {
            setName(e.target.value);
          }}
        />
        <button
          onClick={() => {
            greet(name || "World");
          }}
        >
          greet
        </button>
      </div>
    </div>
  );
};

export default App;
