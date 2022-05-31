import { murmur3 } from "murmurhash-js";

/**
 * https://postd.cc/how-to-write-a-bloom-filter-cpp/
 */
class HashSet {
  public hashSet: ArrayBuffer;
  private dataView: DataView;

  constructor(size: number) {
    this.hashSet = new ArrayBuffer(size);
    this.dataView = new DataView(this.hashSet);
  }

  public set(v: boolean, pos: number) {
    this.dataView.setUint8(pos, v ? 1 : 0);
  }

  public get(pos: number) {
    return this.dataView.getUint8(pos);
  }
}

export class BloomFilter {
  public hashSet: HashSet;
  private size: number;
  private numOfHashFn: number;

  constructor(size: number = 2 ** 32, numOfHashFn: number = 3) {
    this.size = size;
    this.numOfHashFn = numOfHashFn;
    this.hashSet = new HashSet(size);
  }

  public add = (v: string): void => {
    const hash = this.hashFn(v);
    for (let n = 0; n < this.numOfHashFn; n++) {
      this.hashSet.set(true, this.nthHash(n, hash[0], hash[1]));
    }
  };
  public has = (v: string): boolean => {
    const hash = this.hashFn(v);
    for (let n = 0; n < this.numOfHashFn; n++) {
      if (!this.hashSet.get(this.nthHash(n, hash[0], hash[1]))) {
        return false;
      }
    }
    return true;
  };

  private hashFn = (v: string): [number, number] => {
    const hash = murmur3(v, this.size).toString().padStart(10, "0");
    // @ts-ignore
    const [a, b] = hash.match(/.{5}/g)?.map((v) => parseInt(v));
    return [a, b];
  };

  private nthHash = (n: number, hashA: number, hashB: number): number => {
    return (hashA + n * hashB) % this.size;
  };
}
