import React from "react";

interface SpacerProps {
  height?: string;
  width?: string;
}

export const Spacer: React.VFC<SpacerProps> = ({ width, height }) => (
  <div style={{ width, height }} />
);
