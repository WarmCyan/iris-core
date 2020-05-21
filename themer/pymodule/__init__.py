from themer.loader import getTheme
from themer.filewriter import replaceInFile
from themer.filewriter import uncomment

import os

# file paths stored in environment vars
HOME = os.environ["HOME"]
BIN = os.environ["BIN_DIR"]
CONF = os.environ["CONF_DIR"]
