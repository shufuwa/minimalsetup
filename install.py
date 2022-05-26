import subprocess
import os
import glob

home = os.environ['HOME']

def install_prog(pm):
    if pm == "apt":
        packages = "git build-essential htop tree tmux wget curl"
        subprocess.run(["sudo", pm, "update"])
        subprocess.run(["sudo", pm, "upgrade"])
        subprocess.run(["sudo", pm, "install", packages])
        subprocess.run(["mkdir", "-p", f"{home}/.local/share/bin"])
        subprocess.run(["wget", "https://github.com/neovim/neovim/releases/download/v0.7.0/nvim.appimage", "-O", f"{home}/.local/share/bin/nvim"])
    
    elif pm == "pacman":
        packages = "git build-essential htop tree tmux neovim wget curl"
        subprocess.run(["sudo", pm, "-Syu", packages])

def install_config():
    # make config dir
    subprocess.run(["mkdir", "-p", f"{home}/.config/"])

    # copy stuff
    for x in glob.glob('./.config/*'):
        subprocess.run(["cp", "-r", x, f"{home}/.config"])

    #copy bashrc
    subprocess.run(["cp", "./bashrc", f"{home}/"])

print("What is your package manager: ")
print("[1]  apt")
print("[2]  pacman")
pm = input()

if pm == "1":
    install_prog("apt")
else:
    install_prog("pacman")

install_config()
