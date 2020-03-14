#!/bin/sh

timedatectl set-ntp true

echo "g
n


+1M
t
4
n


+2G
t
2
19
n



w" | fdisk /dev/sda

mkswap /dev/sda2
swapon /dev/sda2
mkfs.ext4 /dev/sda3

mount /dev/sda3 /mnt

pacstrap /mnt base linux linux-firmware zile sudo reflector grub intel-ucode

genfstab -U /mnt >> /mnt/etc/fstab
cp arch-install-2.sh /mnt/root
arch-chroot /mnt /root/arch-install-2.sh
rm /mnt/root/arch-install-2.sh

umount -R /mnt
poweroff
