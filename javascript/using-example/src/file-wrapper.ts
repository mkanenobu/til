import * as fs from "node:fs/promises";
import type { Mode, PathLike } from "node:fs";
import type { FileHandle } from "node:fs/promises";

export class FileWrapper implements Disposable {
  public handle: FileHandle;

  constructor(handle: FileHandle) {
    this.handle = handle;
  }

  public static async new({
    path,
    flags,
    mode,
  }: {
    path: PathLike;
    flags?: string | number;
    mode?: Mode;
  }): Promise<FileWrapper> {
    const r = await fs.open(path, flags, mode);
    return new FileWrapper(r);
  }

  async [Symbol.dispose]() {
    console.debug("Disposing file handle");
    await this.handle.close();
  }
}
