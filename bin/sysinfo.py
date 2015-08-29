#!/usr/bin/env python3
import os
import psutil
from datetime import datetime


def convert_bytes(data):
    return float(data/1024/1024/1024)


def load():
    a = os.getloadavg()
    avg = "LOAD: {0}, {1}, {2}".format(a[0], a[1], a[2])
    return avg


def mem():
    m = psutil.virtual_memory()
    total = "{0:.2f}".format(convert_bytes(m.total))
    used = "{0:.2f}".format(
        convert_bytes(m.total) * (m.percent/100))

    return "RAM: {0}/{1}GB".format(used, total)


def cpu():
    psutil.cpu_percent(interval=1, percpu=False)
    percentage = "CPU: {0}%".format(
        psutil.cpu_percent(interval=None, percpu=False))

    return percentage


def disks():
    disks_string = "DISKS( "

    for part in psutil.disk_partitions(all=False):
        if part.device != '/dev/sda1':
            usage = psutil.disk_usage(part.mountpoint)

            if part.device == '/dev/sda2':
                disks_string += '/: '
            elif part.device == '/dev/sdb2':
                disks_string += '$HOME: '

            disks_string += "{0:.2f}/{1:.2f}GB ".format(
                convert_bytes(usage.used), convert_bytes(usage.total))

    disks_string += ")"
    return disks_string


def date_time():
    return datetime.today().strftime("%Y-%m-%d %H:%M:%S")


def main():
    return "{0} | {1} | {2} | {3} | {4}".format(
        disks(), cpu(), mem(), load(), date_time())


if __name__ == '__main__':
    print(main())
