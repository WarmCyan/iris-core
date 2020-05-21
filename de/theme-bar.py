try:
    import themer as t
except:
    exit()

theme = t.getTheme()

if theme != None:
    if "de" in theme:
        #hostnameColor = theme["de"]["hostname_color"]
        defaultColor = theme["de"]["bar_default_color"]
        highlight = theme["de"]["bar_highlight"]
        #t.replaceInFile(t.HOME + "/.i3blocks.conf", "\#::hostname_color\ncolor=\#[0-9A-Za-z]*", "color=" + str(hostnameColor))
        #t.replaceInFile(t.HOME + "/.i3blocks.conf", "\#::hostname_color\ncolor=\#[0-9A-Za-z]*", "color=" + str(hostnameColor))
        t.replaceInFile(t.HOME + "/.i3blocks.conf", "\#::default_color\ncolor=\#[0-9A-Za-z]*", "color=" + str(defaultColor))
        t.replaceInFile(t.HOME + "/.i3blocks.conf", "\#HIGHLIGHT", str(highlight))

        #t.replaceInFile(t.HOME + "/.i3blocks.conf", "battery.sh \"#51bd5d\"", "battery.sh \"" + str(defaultColor) + "\"")
        #t.replaceInFile(t.HOME + "/.i3blocks.conf", "temperature.sh \"#51bc5d\"", "temperature.sh \"" + str(defaultColor) + "\"")
