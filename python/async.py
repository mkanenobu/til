#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import asyncio


async def factorial(name, n):
    m = 1
    print("factorial %s start" % name)
    for i in range(1, n + 1):
        await asyncio.sleep(1)
        m *= i
    print("factorial %s complete: %s" % (name, m))


# parallel execution
loop = asyncio.get_event_loop()
result = loop.run_until_complete(asyncio.gather(
    factorial("A", 7),
    factorial("B", 2),
    factorial("C", 3),
))
