#!/usr/bin/env python

""" <file_name> : Description """

__author__ = "<author>"
__date__ = "<date>"


import argparse


def main():
    """ Default main function """
    # parse command line options
    parser = argparse.ArgumentParser()
    parser.add_argument('--foo', help='foo help')
    args = parser.parse_args()
    print args.accumulate(args.integers)


if __name__ == "__main__":
    main()
