import React from "react";
import { kea, useActions, useValues } from "kea";
import "./App.css";

const keaLogic = kea({
  actions: {
    increment: true,
    decrement: true,
    incrementN: (value: number) => ({ value }),
    decrementN: (value: number) => ({ value }),
  },
  reducers: {
    counter: [
      0,
      {
        increment: (state: number) => state + 1,
        decrement: (state: number) => state - 1,
        incrementN: (state: number, { value }: { value: number }) =>
          state + value,
        decrementN: (state: number, { value }: { value: number }) =>
          state - value,
      },
    ],
  },
});

const parseInput = (s: string): string => parseInt(s, 10).toString();

const App = () => {
  const { counter } = useValues(keaLogic);
  const { increment, decrement, incrementN, decrementN } = useActions(keaLogic);
  const [inputValue, setInputValue] = React.useState<string>("");
  const [inputNumber, setInputNumber] = React.useState<number | null>(null);

  React.useEffect(() => {
    setInputNumber(Number(inputValue));
  }, [inputValue]);

  return (
    <div className="App">
      <div>
        <button onClick={() => increment()}>+1</button>
        <button onClick={() => decrement()}>-1</button>
      </div>
      <div>
        <input
          type={"number"}
          value={inputValue}
          onChange={(e) => setInputValue(parseInput(e.target.value))}
        />
        <button onClick={() => inputNumber && incrementN(inputNumber)}>
          +
        </button>
        <button onClick={() => inputNumber && decrementN(inputNumber)}>
          -
        </button>
      </div>

      <p>{counter}</p>
    </div>
  );
};

export default App;
