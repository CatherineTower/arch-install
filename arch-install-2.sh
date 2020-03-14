ln -sf /usr/share/zoneinfo/US/Pacific /etc/localtime

hwclock --systohc

sed -i 's/^#\(en_US\.UTF-8\)$/\1/' /etc/locale.gen
locale-gen

echo "127.0.0.1	localhost" >> /etc/hosts

mkdir /boot/grub
# This is specific to my VM setup, comment out the sed lines if you
# don't need them.
sed -i 's/^\(GRUB_CMDLINE_LINUX_DEFAULT=\)"\(.*\)"$/\1"\2 splash nomodeset"/' /etc/default/grub
sed -i 's/^\(GRUB_CMDLINE_LINUX=\)"\(.*\)"$/\1"\2 console=ttyS0 console=tty0"/' /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg
grub-install /dev/sda

echo "Updating mirrorlist..."
reflector -n 50 -p http --sort rate --save /etc/pacman.d/mirrorlist
echo "Mirrorlist updated"

passwd -d root
