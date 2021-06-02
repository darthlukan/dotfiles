#!/usr/bin/env python3

from os import getenv
from subprocess import run, CalledProcessError

USER = getenv('USER')
KEYTAB = "/home/{}/.{}.keytab".format(USER, USER)


def login():
    run(["kinit -kt {0} {1}@REDHAT.COM".format(KEYTAB, USER)], shell=False, capture_output=None)


def refresh():
    run(['kinit', '-R'], shell=False, capture_output=False)


def main():
    try:
        refresh()
    except CalledProcessError:
        try:
            login()
        except (Exception, CalledProcessError) as e:
            print(e.message)


if __name__ == '__main__':
    main()
