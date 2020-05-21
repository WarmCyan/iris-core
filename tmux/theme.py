try:
    import themer as t
except:
    print("Themer library not found")
    exit()

theme = t.getTheme()

if theme != None:
    if "tmux" in theme:
        border = theme["tmux"]["border_colors"]
        print("border:",border)
        #t.replaceInFile(t.HOME + "/.i3blocks.conf", "\#::hostname_color\ncolor=\#[0-9A-Za-z]*", "color=" + str(hostnameColor))
        t.replaceInFile(t.HOME + "/.tmux.conf", "\#::pane_border\nset\s\-g\spane\-active\-border\-style\sfg=[A-Za-z]*", "set -g pane-active-border-style fg=" + str(border))
        t.replaceInFile(t.HOME + "/.tmux.conf", "\#::status_bg\nset\s\-g\sstatus\-bg\s[A-Za-z]*", "set -g status-bg " + str(border))

