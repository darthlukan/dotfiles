#!/usr/bin/env python3
import os
import sys
import psutil
import argparse
import subprocess
from datetime import datetime


def convert_bytes(data):
    return float(data/1024/1024/1024)


def load():
    a = os.getloadavg()
    avg = 'LOAD: {0}, {1}, {2}'.format(a[0], a[1], a[2])
    return avg


def mem():
    m = psutil.virtual_memory()
    total = '{0:.2f}'.format(convert_bytes(m.total))
    used = '{0:.2f}'.format(
        convert_bytes(m.total) * (m.percent/100))

    return 'RAM: {0}/{1}GB'.format(used, total)


def cpu():
    psutil.cpu_percent(interval=1, percpu=False)
    percentage = 'CPU: {0}%'.format(
        psutil.cpu_percent(interval=None, percpu=False))

    return percentage


def disks(data):
    disks_string = ''

    for mountpoint in data:
        usage = psutil.disk_usage(mountpoint)
        disks_string += ' | {0}: '.format(mountpoint)
        disks_string += '{0:.2f}/{1:.2f}GB '.format(
            convert_bytes(usage.used), convert_bytes(usage.total))

    return disks_string


def date_time(format_str):
    if isinstance(format_str, str) and format_str != '' and '%' in format_str:
        return datetime.today().strftime(format_str)

    return datetime.today().strftime('%Y-%m-%d %H:%M:%S')


def music():
    mpc = subprocess.Popen(['mpc current'], stdout=subprocess.PIPE, shell=True)
    stdout, stderr = mpc.communicate()
    return 'SONG: {0}'.format(stdout.decode('utf-8').strip())


def main():
    parser = argparse.ArgumentParser(
        description='Available argument information.')
    parser.add_argument('-d', '--disks', nargs='*', type=str, action='store',
                        dest='disks', help='The disks to lookup.')
    parser.add_argument('-c', '--cpu', type=bool, action='store', dest='cpu',
                        help='Whether or not to show CPU usage.')
    parser.add_argument('-m', '--mem', type=bool, action='store', dest='mem',
                        help='Whether or not to show Memory usage.')
    parser.add_argument('-l', '--load', type=bool, action='store', dest='load',
                        help='Whether or not to show Load averages.')
    parser.add_argument('-dt', '--date-time', type=str, action='store',
                        dest='date_time', default='%Y-%m-%d %H:%M:%S',
                        help='Show the datetime using the following format.')
    parser.add_argument('-mpc', '--music', type=bool, action='store', dest='music',
                        help='Show the current music track.')
    args = parser.parse_args()

    info_str = ''

    if len(sys.argv) > 1:
        if args.music:
            info_str += '| {0} '.format(music())

        if args.disks:
            info_str += '{0} | '.format(disks(args.disks))

        if args.cpu:
            info_str += '{0} | '.format(cpu())

        if args.mem:
            info_str += '{0} | '.format(mem())

        if args.load:
            info_str += '{0} | '.format(load())

        # Since we're supplying a default, we should always inject date_time
        info_str += '{0} |'.format(date_time(args.date_time))
    else:
        parser.print_help()

    return info_str


if __name__ == '__main__':
    print(main())
