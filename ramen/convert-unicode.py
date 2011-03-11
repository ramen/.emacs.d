#!/usr/bin/env python

import sys
import itertools
from tokenize import *

def token_line_number((num, token, spos, epos, line)):
    return spos[0]

def token_lines(tokens):
    return itertools.groupby(tokens, token_line_number)

def convert_strings(token_line):
    result = ''
    pad = 0
    for num, token, spos, epos, line in token_line:
        result += ' ' * (spos[1] + pad - len(result))
        if num == STRING and token[0] != 'u':
            result += 'u'
            pad += 1
        result += token
    return result

def convert_unicode(tokens):
    for line_number, token_line in token_lines(tokens):
        token_line = list(token_line)
        has_strings = False
        for num, _, _, _, _ in token_line:
            if num == STRING:
                has_strings = True
                break
        if has_strings:
            yield convert_strings(token_line)
        else:
            yield token_line[0][4]

tokens = generate_tokens(sys.stdin.readline)
for line in convert_unicode(tokens):
    sys.stdout.write(line.replace('__str__', '__unicode__'))
