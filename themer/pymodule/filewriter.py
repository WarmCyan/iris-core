import os
import re

def replaceInFile(filename, pattern, replacement):
    with open(filename, "r+") as f:
        text = f.read()
        text = re.sub(pattern, replacement, text)
        f.seek(0)
        f.write(text)
        f.truncate()

# line should NOT include the "# "
def uncomment(filename, line):
    replaceInFile(filename, "\# " + str(line), line)
