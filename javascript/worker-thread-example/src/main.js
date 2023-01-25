const { Worker } = require("worker_threads");

const main = () => {
  const worker = new Worker("./worker.js", {
    workerData: {
      hello: "world!",
    },
  });

  worker.on("message", (msg) => {
    console.log("Main: Message from worker", msg);
  });

  setTimeout(() => {
    worker.postMessage({ msg: "hello from main thread" });
  }, 2 * 1000);

  console.log("main end");
};

main();
