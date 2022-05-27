import subprocess
import os
import glob

home = os.environ['HOME']

def install_prog(pm):
    if pm == "apt":
        packages = "git build-essential htop tree tmux wget curl xsel lxpolkit openbox plank xorg x11-xserver-utils spice-vdagent"
        subprocess.run(f"sudo {pm} update", shell=True)
        subprocess.run(f"sudo {pm} upgrade", shell=True)
        subprocess.run(f"sudo {pm} install {packages}", shell=True)
        subprocess.run(f"mkdir -p {home}/.local/bin", shell=True)
        subprocess.run(f"wget https://github.com/neovim/neovim/releases/download/v0.7.0/nvim.appimage -O {home}/.local/bin/nvim", shell=True)
        subprocess.run(f"cd /tmp", shell=True)
        subprocess.run(f"git clone https://github.com/Earnestly/sx.git", shell=True)
        subprocess.run(f"cd /tmp/sx/", shell=True)
        subprocess.run(f"make PREFIX=/usr install", shell=True)
    
    elif pm == "pacman":
        packages = "git build-essential htop tree tmux neovim wget curl xsel lxsession-gtk3 openbox plank xorg-xsetroot xf86-video-amdgpu mesa lib32-mesa xorg-xserver sx spice-vdagent"
        subprocess.run(f"sudo {pm} -Syu packages", shell=True)

def install_config():
    # make config dir
    subprocess.run(f"mkdir -p {home}/.config/", shell=True)
    subprocess.run(f"mkdir -p {home}/.local/share/themes", shell=True)
    subprocess.run(f"mkdir -p {home}/.local/share/plank/themes", shell=True)

    # copy stuff
    for x in glob.glob('./.config/*'):
        subprocess.run(f"cp -r {x} {home}/.config", shell=True)

    subprocess.run(f"cp -a ./.local/share/themes/* {home}/.local/share/themes/", shell=True)
    subprocess.run(f"cp -a ./.local/share/plank/themes/* {home}/.local/share/plank/themes/", shell=True)

    #copy bashrc
    subprocess.run(f"cp ./.bashrc {home}/", shell=True)

    #copy Xresources
    subprocess.run(f"cp ./.Xresources {home}/", shell=True)

print("What is your package manager: ")
print("[1]  apt")
print("[2]  pacman")
pm = input()

if pm == "1":
    install_prog("apt")
else:
    install_prog("pacman")

install_config()
