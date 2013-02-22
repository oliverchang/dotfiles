#!/usr/bin/env python

import sys
import re
import fileinput

for line in fileinput.input(openhook=fileinput.hook_encoded("utf-8")):
   sys.stdout.write(re.sub(r'[^\x00-\x7F]', '', line))
