cd /root

wget -O bios64.bin "https://github.com/BlankOn/ovmf-blobs/raw/master/bios64.bin" 

wget -O win.iso "https://go.microsoft.com/fwlink/p/?LinkID=2195167&clcid=0x409&culture=en-us&country=US" 

wget -O ngrok.tgz "https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz" 

tar -xf ngrok.tgz 

./ngrok config add-authtoken 2hw2qcFisyQHN5js4b0Luy6SaPL_JZd9EBYVYog8zwxzqyVs

nohup ./ngrok tcp 5900 > /dev/null 2>&1 &

mkdir tes && cd tes && wget -O ngrok.tgz "https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz" && tar -xf ngrok.tgz && ./ngrok config add-authtoken 22G2Pd4rURud2rTWDk4jtva8WX5_73D2vf71zciBDX1M4cJyG && nohup ./ngrok tcp 3389 > /dev/null 2>&1 &

sudo apt update 

sudo apt install qemu-kvm -y 

qemu-img create -f raw memek 50G 

qemu-system-x86_64 \
  -m 12G \
  -smp cores=3 \
  -boot order=c \
  -drive file=win.iso,media=cdrom \
  -drive file=memek,format=raw \
  -device usb-ehci,id=usb,bus=pci.0,addr=0x4 \
  -device usb-tablet \
  -vnc :0 \
  -device e1000,netdev=n0 \
  -netdev user,id=n0,hostfwd=tcp::3389-:3389 \
  -vga qxl
