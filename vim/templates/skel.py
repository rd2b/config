#!/usr/bin/env python3
# -*- coding: utf-8 -*-

""" <file_name> : Description """

# TODO: complete:
__author__ = "<author>"
__date__ = "<date>"


import argparse


def main():
    """ Default main function """
    # parse command line options
    parser = argparse.ArgumentParser()
    parser.add_argument('--foo', help='foo help') #TODO: add arguments
    args = parser.parse_args()
    print(args.accumulate(args.integers))


if __name__ == "__main__":
    main()
