const { setTimeout } = require("timers/promises");
const {
  workerData,
  isMainThread,
  MessageChannel,
  parentPort,
} = require("worker_threads");

const worker = async () => {
  console.log("Worker Data is", workerData);
  console.log({ isMainThread });

  parentPort.on("message", (msg) => {
    console.log("Worker: Message from main thread", msg);
  });

  parentPort.postMessage("time consuming process start");
  await setTimeout(10 * 1000);
  parentPort.postMessage("time consuming process end");

  process.exit(0);
};

worker();
