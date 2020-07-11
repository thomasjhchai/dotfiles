1) Ensure VM is set to using UEFI instead of BIOS
2) Installation guide source : https://wiki.archlinux.org/index.php/Installation_guide#Pre-installation
3) Installation of boot loader (* very important )
	- Partioning (use command cfdisk instead of fdisk for easier partioning)
	- using systemd_boot instead of grub
		- bootctl --path=/boot install
		- edit /boot/loader/loader.conf 
			- timeout 3 (to show boot option during booting)
			- default arch-*
		- edit /boot/loader/entries/arch.conf
			- title 	arch-vm (or any name you desire)
			- linux i	/vmlinuz-linux
			- initrd 	/initramfs-linux.img
			- option	root=/dev/sda3 rw (or any partion pointing to Linux partition)
4) After reboot
	- Post Installation source : https://wiki.archlinux.org/index.php/General_recommendations
	- install tools
		pacman -S efibootmgr networkmanager network-manager-applet wireless_tools wpa_supplicant dialog os-prober mtools dosfstools base-devel linux-headers
		pacman -S zsh openssh tmux git
	- install Xserver (draft - to be research)
		alsa-utils (for sound)
			- run alsamixer to set volume
			- run speaker-test -c2
		xorg-server xorg-xinit
			xinit / startx to test (will create a .xinitrc file)
		sddm / gdm (display manager)
			- to enable 	- systemctl enable sddm.service 
					- systemctl start sddm.service
		xf86-video-qxl (for VM) / xf86-video-intel / xf86-video-amdgpu / xf86-video-nvidia nvidia-utils
		Desktops - KDE, GNOME, i3, etc
			For i3 windows manager
				pacman -S i3-gaps i3-status dmenu nm-applet
				Fonts - pacman -S noto-fonts (check fonts config @ ~/.config/fontconfig/font.conf)
				.xinitrc add the line "exec i3"
		
	
