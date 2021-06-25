#!/usr/bin/env python3

from os import getenv
from subprocess import run

USER = getenv('USER')
HOME = getenv('HOME')
KEYTAB = "{}/.{}.keytab".format(HOME, USER)


def login():
    state = False
    try:
        run(["/usr/bin/kinit", "-kt", "{0}".format(KEYTAB), "{1}@REDHAT.COM".format(USER)], shell=True)
        state = True
    except Exception as e:
        print(e.message)
        state = False

    return state


def refresh():
    state = False
    try:
        run(['kinit', '-R', "{}@REDHAT.COM".format(USER)], shell=False)
        state = True
    except Exception:
        state = False 

    return state


def main():
    refreshed = refresh()
    if not refreshed:
        return login()

    return refreshed


if __name__ == '__main__':
    main()
