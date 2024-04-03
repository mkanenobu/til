const std = @import("std");
const debug = std.debug;
const time = std.time;

const Thread = std.Thread;
const Mutex = Thread.Mutex;

var tick: usize = 0;

fn ticker(step: u8) void {
    time.sleep(1 * time.ns_per_s);
    tick += @as(usize, step);
}

pub fn main() !void {
    try spawnExample();
    try mutexExample();
}

// zigのasync APIはまだ仕様が固まっておらず、コメント時点の最新である 0.11 のzigコンパイラには入っていない
// そのため、非同期処理のためにはThreadを使う方法が最も簡単
fn spawnExample() !void {
    const thread = try Thread.spawn(.{}, ticker, .{@as(u8, 1)});

    debug.print("tick before wait: {}\n", .{tick});
    time.sleep(3 * std.time.ns_per_s / 2);
    debug.print("tick after 1.5s wait: {}\n", .{tick});
    // スレッドの完了を待って、spawnによってアロケートされたリソースを解放する
    Thread.join(thread);
}

fn lockThreeSeconds(mtx: *Mutex) void {
    mtx.lock();
    time.sleep(1 * time.ns_per_s);
    mtx.unlock();
}

fn tryToGetLock(mtx: *Mutex) void {
    if (mtx.tryLock()) {
        debug.print("Got lock\n", .{});
    } else {
        debug.print("Failed to get lock\n", .{});
    }
}

fn mutexExample() !void {
    var mtx = Mutex{};

    const lockAndWaitThread = try Thread.spawn(.{}, lockThreeSeconds, .{&mtx});
    _ = try Thread.spawn(.{}, tryToGetLock, .{&mtx});
    Thread.join(lockAndWaitThread);
}
