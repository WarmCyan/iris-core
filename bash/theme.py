try:
    import themer as t
except:
    exit()

theme = t.getTheme()

if theme != None:
    if "bash" in theme:
        
        color = theme["bash"]["primary_color"]
        
        t.replaceInFile(t.HOME + "/.bashrc", "# primary_color=\$" + color, "primary_color=$" + color)
        
        #with open(os.environ["HOME"] + "/.bashrc", 'r+') as f:
            #text = f.read()
            ###text = re.sub("# primary_color=$" + color, "primary_color=$" + color, text)
            #text = re.sub("\# primary_color=\$" + color, "primary_color=$" + color, text)
            #f.seek(0)
            ##f.write(text)
            ##f.truncate()
