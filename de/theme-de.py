try:
    import themer as t
except:
    print("Themer library not found")
    exit()

theme = t.getTheme()

if theme != None:
    if "de" in theme:

        if theme["de"]["transparency"]:
            t.replaceInFile(t.HOME + "/.Xresources", "\! URxvt\*depth: 32", "URxvt*depth: 32")
            t.replaceInFile(t.HOME + "/.Xresources", "\! URxvt\*background: rgba:", "URxvt*background: rgba:")
            t.replaceInFile(t.HOME + "/.i3/config", "\# background \#111111AA", "background #111111AA")

        if theme["de"]["compositor"]:
            t.replaceInFile(t.HOME + "/.xinitrc", "\# compton", "compton")
            
            red = theme["de"]["shadow_red"]
            green = theme["de"]["shadow_green"]
            blue = theme["de"]["shadow_blue"]
            fade = theme["de"]["fade_time"]
            opacity = theme["de"]["shadow_opacity"]

            t.replaceInFile(t.HOME + "/.xinitrc", "shadow_red=0", "shadow_red=" + str(red))
            t.replaceInFile(t.HOME + "/.xinitrc", "shadow_green=0", "shadow_green=" + str(green))
            t.replaceInFile(t.HOME + "/.xinitrc", "shadow_blue=0", "shadow_blue=" + str(blue))
            t.replaceInFile(t.HOME + "/.xinitrc", "shadow_opacity=0", "shadow_opacity=" + str(opacity))
            
            t.replaceInFile(t.HOME + "/.xinitrc", "fade_time=0", "fade_time=" + str(fade))

        padding = theme["de"]["console_padding"]
        
        t.replaceInFile(t.HOME + "/.Xresources", "URxvt\.internalBorder: 10", "URxvt.internalBorder: " + str(padding))
    
        focusedback = theme["de"]["border_color_focused"]
        unfocusedback = theme["de"]["border_color_unfocused"]
        focusedfore = theme["de"]["fore_focused"]
        unfocusedfore = theme["de"]["fore_unfocused"]
        
        t.replaceInFile(t.HOME + "/.i3/config", "set \$focusedback \#00000000", "set $focusedback " + str(focusedback))
        t.replaceInFile(t.HOME + "/.i3/config", "set \$unfocusedback \#00000000", "set $unfocusedback " + str(unfocusedback))
        t.replaceInFile(t.HOME + "/.i3/config", "set \$focusedfore \#00000000", "set $focusedfore " + str(focusedfore))
        t.replaceInFile(t.HOME + "/.i3/config", "set \$unfocusedfore \#00000000", "set $unfocusedfore " + str(unfocusedfore))

        workspaceColor = theme["de"]["active_workspace_color"]
        t.replaceInFile(t.HOME + "/.i3/config", "set \$focusedws \#[0-9A-Za-z]*", "set $focusedws " + str(workspaceColor))

        if theme["lock"]:
            insidevercolor = theme["lock"]["inside_verifying_color"]
            ringcolor = theme["lock"]["ring_color"]
            ringvercolor = theme["lock"]["ring_verifying_color"]
            linecolor = theme["lock"]["line_color"]
            keyhlcolor = theme["lock"]["key_hl_color"]
            
            t.replaceInFile(t.HOME + "/.i3/config", "--insidevercolor=00000000", "--insidevercolor=" + str(insidevercolor))
            t.replaceInFile(t.HOME + "/.i3/config", "--ringcolor=00000000", "--ringcolor=" + str(ringcolor))
            t.replaceInFile(t.HOME + "/.i3/config", "--ringvercolor=00000000", "--ringvercolor=" + str(ringcolor))
            t.replaceInFile(t.HOME + "/.i3/config", "--linecolor=00000000", "--linecolor=" + str(linecolor))
            t.replaceInFile(t.HOME + "/.i3/config", "--keyhlcolor=00000000", "--keyhlcolor=" + str(keyhlcolor))

        if theme["customcolors"]:
            foreground = theme["customcolors"]["foreground"]
            background = theme["customcolors"]["background"]
            cursorColor = theme["customcolors"]["cursorColor"]
            color0 = theme["customcolors"]["color0"]
            color1 = theme["customcolors"]["color1"]
            color2 = theme["customcolors"]["color2"]
            color3 = theme["customcolors"]["color3"]
            color4 = theme["customcolors"]["color4"]
            color5 = theme["customcolors"]["color5"]
            color6 = theme["customcolors"]["color6"]
            color7 = theme["customcolors"]["color7"]
            color8 = theme["customcolors"]["color8"]
            color9 = theme["customcolors"]["color9"]
            color10 = theme["customcolors"]["color10"]
            color11 = theme["customcolors"]["color11"]
            color12 = theme["customcolors"]["color12"]
            color13 = theme["customcolors"]["color13"]
            color14 = theme["customcolors"]["color14"]
            color15 = theme["customcolors"]["color15"]

            t.replaceInFile(t.HOME + "/.Xresources", "\*\.foreground: \#c8c8c8", "*.foreground: " + str(foreground))
            t.replaceInFile(t.HOME + "/.Xresources", "\*\.background: \#191919", "*.background: " + str(background))
            t.replaceInFile(t.HOME + "/.Xresources", "\*\.cursorColor: \#c8c8c8", "*.cursorColor: " + str(cursorColor))
            
            t.replaceInFile(t.HOME + "/.Xresources", "\*\.color0: \#191919", "*.color0: " + str(color0))
            t.replaceInFile(t.HOME + "/.Xresources", "\*\.color1: \#a52727", "*.color1: " + str(color1))
            t.replaceInFile(t.HOME + "/.Xresources", "\*\.color2: \#409449", "*.color2: " + str(color2))
            t.replaceInFile(t.HOME + "/.Xresources", "\*\.color3: \#d78f5e", "*.color3: " + str(color3))
            t.replaceInFile(t.HOME + "/.Xresources", "\*\.color4: \#518bb6", "*.color4: " + str(color4))
            t.replaceInFile(t.HOME + "/.Xresources", "\*\.color5: \#7b3f8f", "*.color5: " + str(color5))
            t.replaceInFile(t.HOME + "/.Xresources", "\*\.color6: \#388e83", "*.color6: " + str(color6))
            t.replaceInFile(t.HOME + "/.Xresources", "\*\.color7: \#707070", "*.color7: " + str(color7))
            
            t.replaceInFile(t.HOME + "/.Xresources", "\*\.color8: \#464646", "*.color8: " + str(color8))
            t.replaceInFile(t.HOME + "/.Xresources", "\*\.color9: \#e33636", "*.color9: " + str(color9))
            t.replaceInFile(t.HOME + "/.Xresources", "\*\.color10: \#51bc5d", "*.color10: " + str(color10))
            t.replaceInFile(t.HOME + "/.Xresources", "\*\.color11: \#f0c674", "*.color11: " + str(color11))
            t.replaceInFile(t.HOME + "/.Xresources", "\*\.color12: \#71c1fd", "*.color12: " + str(color12))
            t.replaceInFile(t.HOME + "/.Xresources", "\*\.color13: \#a555c0", "*.color13: " + str(color13))
            t.replaceInFile(t.HOME + "/.Xresources", "\*\.color14: \#4cc0b1", "*.color14: " + str(color14))
            t.replaceInFile(t.HOME + "/.Xresources", "\*\.color15: \#e6e6e6", "*.color15: " + str(color15))

        if theme["rofi"]:
            background = theme["rofi"]["background"]
            foreground = theme["rofi"]["highlight"]

            t.replaceInFile(t.HOME + "/.Xresources", "rofi.color-normal: #444444, #FFFFFF, #444444, #EEEEEE, #444444", "rofi.color-normal: " + str(background) + ", " + str(foreground) + ", " + str(background) + ", " + str(foreground) + ", " + str(background))
            t.replaceInFile(t.HOME + "/.Xresources", "rofi\.color-window: \#444444, \#000000, \#000000", "rofi.color-window: " + str(background) + ", #000000, #000000")
