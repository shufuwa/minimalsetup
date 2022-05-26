import subprocess
import os
import glob

home = os.environ['HOME']

def install_prog(pm):
    if pm == "apt":
        packages = "git build-essential htop tree tmux wget curl"
        subprocess.run(f"sudo {pm} update", shell=True)
        subprocess.run(f"sudo {pm} upgrade", shell=True)
        subprocess.run(f"sudo {pm} install {packages}", shell=True)
        subprocess.run(f"mkdir -p {home}/.local/bin", shell=True)
        subprocess.run(f"wget https://github.com/neovim/neovim/releases/download/v0.7.0/nvim.appimage -O {home}/.local/bin/nvim", shell=True)
    
    elif pm == "pacman":
        packages = "git build-essential htop tree tmux neovim wget curl"
        subprocess.run(f"sudo {pm} -Syu packages", shell=True)

def install_config():
    # make config dir
    subprocess.run([f"mkdir -p {home}/.config/", shell=True])

    # copy stuff
    for x in glob.glob('./.config/*'):
        subprocess.run(f"cp -r {x} {home}/.config", shell=True)

    #copy bashrc
    subprocess.run(f"cp ./.bashrc {home}/", shell=True)

print("What is your package manager: ")
print("[1]  apt")
print("[2]  pacman")
pm = input()

if pm == "1":
    install_prog("apt")
else:
    install_prog("pacman")

install_config()
