try:
    import themer as t
except:
    print("Themer library not found")
    exit()

theme = t.getTheme()

if theme != None:
    if "dunst" in theme:
        frameColor = theme["dunst"]["frame_color"]
        #t.replaceInFile(t.HOME + "/.i3blocks.conf", "\#::hostname_color\ncolor=\#[0-9A-Za-z]*", "color=" + str(hostnameColor))
        t.replaceInFile(t.HOME + "/.config/dunst/dunstrc", "\#::frame_color\n\s*frame_color\s\=\s\"\#[0-9A-Za-z]*\"", "frame_color = \"" + str(frameColor) + "\"")

