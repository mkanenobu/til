import { createWorker, OEM } from "tesseract.js";

const recognizeImageFile = async (lang: string, filepath: string) => {
  const worker = await createWorker(lang, OEM.DEFAULT);
  const res = await worker.recognize(filepath);
  await worker.terminate();
  return res;
}

const main = async () => {
  const res = await recognizeImageFile("eng", "./hello_world.png");
  console.log(res.data.text);

  const res2 = await recognizeImageFile("eng+jpn", "./hello_world.png");
  console.log(res2.data.text);

  const res3 = await recognizeImageFile("jpn", "./japanese.png");
  console.log(res3.data.text.replaceAll(" ", ""));
}

main();