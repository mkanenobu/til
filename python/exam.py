#!/usr/bin/env python3
# -*- coding: utf-8 -*-


# a割るb
def divmod_test(a, b: int):
    i = 1
    res: int = a

    if a < b:
        return 0, a
    elif b == 0:
        return False

    while True:
        res -= b
        if res < b:
            break
        i += 1

    return i, res


def closure(s: str):
    wav = 0
    arc = 0
    last = ""

    for i in s:
        if i == "(":
            arc += 1
            last = "("
        elif i == ")":
            if last != "(" or last == "":
                return False
            arc -= 1

        if i == "{":
            wav += 1
            last = "{"
        elif i == "}":
            if last != "{" or last == "":
                return False
            wav -= 1

    if arc != 0 or wav != 0:
        return False
    return True


