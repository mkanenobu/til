import { useState } from "react";

export const App = () => {
  const [error, setError] = useState<GeolocationPositionError | null>(null);
  const [geolocation, setGeolocation] = useState<GeolocationPosition | null>(
    null,
  );

  return (
    <div>
      <button
        onClick={() => {
          navigator.geolocation.getCurrentPosition(
            (position) => {
              console.log(position);
              setGeolocation(position);
            },
            (positionError) => {
              console.log(error);
              setError(positionError);
            },
          );
        }}
      >
        Get geolocation
      </button>
      <div>timestamp: {geolocation?.timestamp}</div>
      <div>
        <p>Coords:</p>
        <div style={{ marginLeft: "1rem" }}>
          <p>accuracy: {geolocation?.coords.accuracy}</p>
          <p>altitude: {geolocation?.coords.altitude}</p>
          <p>altitudeAccuracy: {geolocation?.coords.altitudeAccuracy}</p>
          <p>heading: {geolocation?.coords.heading}</p>
          <p>latitude: {geolocation?.coords.latitude}</p>
          <p>longitude: {geolocation?.coords.longitude}</p>
          <p>speed: {geolocation?.coords.speed}</p>
        </div>
      </div>

      <div>
        <p>Errors:</p>
        <p>{error?.message}</p>
      </div>
    </div>
  );
};
