#!/usr/bin/env python3
#
# Author: Brian Tomlinson <darthlukan@gmail.com>
# License: GPL2

import os
import psutil


def load():
    a = os.getloadavg()
    avg = "LOAD: {0}, {1}, {2}".format(a[0], a[1], a[2])
    return avg


def mem():
    m = psutil.virtual_memory()
    total = "{0:.2f}".format(float(m.total/1024/1024/1024))
    used = "{0:.2f}".format(
        float((m.total/1024/1024/1024) * (m.percent/100)))
    return "RAM: {0}/{1}GB".format(used, total)


def cpu():
    psutil.cpu_percent(interval=1, percpu=False)
    percentage = "CPU: {0}%".format(
        psutil.cpu_percent(interval=None, percpu=False))
    return percentage


def main():
    return "{0} | {1} | {2}".format(load(), cpu(), mem())


if __name__ == '__main__':
    print(main())
