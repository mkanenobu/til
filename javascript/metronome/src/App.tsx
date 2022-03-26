import React, { useState, useCallback, useMemo } from "react";
import { Icon, Slider } from "@blueprintjs/core";
import { css } from "@emotion/css";
import { useInterval } from "./lib/use-interval";
import { Spacer } from "./components/Spacer";
import ClickSound from "./click.mp3";

const useClickSound = () => {
  const audio = useMemo(() => new Audio(ClickSound), []);

  return {
    play: () => {
      audio.currentTime = 0;
      audio.play();
    },
  };
};

const Dot: React.VFC<{ show: boolean }> = ({ show }) => {
  return <Icon icon="dot" iconSize={32} color={show ? "black" : "white"} />;
};

const containerStyle = css`
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  height: 100vh;
`;

const sliderStyle = css`
  width: 80%;
  margin-top: 10px;
`;

const App: React.VFC = () => {
  const [bpm, setBpm] = useState(60);
  const beatPerSeconds = useMemo(() => 60 / bpm, [bpm]);
  const [status, setStatus] = useState<"play" | "pause">("pause");

  const [showDot, setShowDot] = useState(false);

  const { play } = useClickSound();

  const [frame, setFrame] = useState(0);

  const handler = useCallback(() => {
    setFrame((p) => {
      const next = p + 1;
      if (next / 100 >= beatPerSeconds) {
        if (status === "play") {
          play();
          setShowDot(true);
          setTimeout(() => setShowDot(false), (beatPerSeconds * 1000) / 2);
        }
        return 0;
      } else {
        return next;
      }
    });
  }, [setFrame, status, beatPerSeconds, setShowDot]);

  useInterval(handler, 10);

  return (
    <div className={containerStyle}>
      <Dot show={showDot} />

      <Slider
        className={sliderStyle}
        value={bpm}
        onChange={(v) => {
          setBpm(v);
        }}
        stepSize={1}
        min={30}
        max={300}
        labelStepSize={20}
        showTrackFill={false}
      />

      <Spacer height="8px" />
      <div>
        {status === "play" ? (
          <Icon icon="pause" onClick={() => setStatus("pause")} iconSize={24} />
        ) : (
          <Icon icon="play" onClick={() => setStatus("play")} iconSize={24} />
        )}
      </div>
    </div>
  );
};

export default App;
