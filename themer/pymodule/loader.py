import json
import os

def getTheme():
    theme = {}

    # os.environ['DATA_DIR']
    #themefile = "~/current_theme.json"
    themefile = os.environ['DATA_DIR'] + "/theme/current_theme.json"

    if os.path.exists(themefile):
        with open(themefile) as theme_json:
            theme = json.load(theme_json)
    else:
        return None

    return theme
