import React, { useState, useCallback, useMemo } from "react";
import { Icon, Slider } from "@blueprintjs/core";
import { css } from "@emotion/css";
import { useInterval } from "./lib/use-interval";
import { Spacer } from "./components/Spacer";
import ClickSound from "./click.mp3";
import { Simulate } from "react-dom/test-utils";

// 10ms - 1 frame
const FRAME = 10;

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
  const [bpm, setBpm] = useState(88);
  const clickIntervalMs = useMemo(() => (60 / bpm) * 1000, [bpm]);
  const [status, setStatus] = useState<"play" | "pause">("pause");

  const [showDot, setShowDot] = useState(false);
  const visualClick = useCallback(() => {
    setShowDot(true);
    setTimeout(() => setShowDot(false), clickIntervalMs / 2);
  }, [setShowDot]);

  const { play } = useClickSound();

  const [_frameCount, setFrameCount] = useState(0);

  const handler = useCallback(() => {
    /*
     * Event fires every $FRAME ms
     * increment frame count everytime
     */
    setFrameCount((p) => {
      const nextFrameCount = p + 1;
      // frame count * $FRAME = spent time (ms)
      // if spent time is greater than click interval, action "click" and clear frame count
      if (nextFrameCount * FRAME >= clickIntervalMs) {
        if (status === "play") {
          play();
          visualClick();
        }
        return 0;
      } else {
        return nextFrameCount;
      }
    });
  }, [setFrameCount, status, clickIntervalMs, setShowDot]);

  useInterval(handler, FRAME);

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
