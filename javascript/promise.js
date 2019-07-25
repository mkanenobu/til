const withTimeout = (ms, promise) => {
  return new Promise((resolve, reject) => {
    window.setTimeout(() => {
      reject('Timeout');
    }, ms);
    promise.then(resolve, reject);
  });
};

withTimeout(10, fetch('./aaa')).catch((e) => console.log(typeof e))
