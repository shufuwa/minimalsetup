import subprocess
import glob

def install_prog(pm):
    if pm == "apt":
        packages = "git build-essential htop tree tmux wget curl"
        subprocess.run(["sudo", pm, "update"])
        subprocess.run(["sudo", pm, "upgrade"])
        subprocess.run(["sudo", pm, "install", packages])
        subprocess.run(["mkdir", "-p", "~/.local/share/bin"])
        subprocess.run(["wget", "https://github.com/neovim/neovim/releases/download/v0.7.0/nvim.appimage", "-O", "~/.local/share/bin/nvim"])
    
    elif pm == "pacman":
        packages = "git build-essential htop tree tmux neovim wget curl"
        subprocess.run(["sudo", pm, "-Syu", packages])

def install_config():
    # make config dir
    subprocess.run(["mkdir -p ~/.config/"])

    # copy stuff
    for x in glob.glob('./.config/*'):
        subprocess.run(["cp", "-r", x, "~/.config"])

    #copy bashrc
    subprocess.run(["cp", "./bashrc", "~/"])

print("What is your package manager: ")
print("[1]  apt")
print("[2]  pacman")
pm = input()

if pm == 1:
    install_prog("apt")
else:
    install_prog("pacman")

install_config()
