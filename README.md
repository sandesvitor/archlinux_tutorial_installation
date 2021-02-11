# Arch Linux Installation - EFI

## **1. Creating bootable USB flash drive**:

All devices are mounted in the /dev folder. In Linux, if we want to make a USB flash drive bootable, we can use the **dd** command:

```shell
[~]$ dd if=archlinux-2021.02.01-x86_64.iso of=/dev/usb bs=4M status=progress && sync
```

The **if** block is where you pass the .iso path, and the **to** block is where you pass the **flash driver device location**. The second command **sync** write any buffered data in memory to the disk, and in this case will boot the computer from the USB.


## **2. Starting the installation process**:

After the booting process, our system will boot from the **bootable USB driver**, letting us start the system in **Arch Linux Live Environment**.

![](images/arch_1.png)


![](images/arch_2.png)



## **3. Finishing installation & first boot**:


## **4. Setting up hostname, time,locale & swap file**:


## **5. Setting up custom environment variables (.bashrc basic settings)**:


## **6. Creating a standard user account**:


## **7. Installing Xorg, fonts, drivers & desktop environment**:


## **8. Customizing the Gnome desktop (gnome tweaks & shell extensions)**:


## **9. Installing software / AUR (pacman, aur helpers & unofficial repositories)**:


## **10. Managing disk mounts & setting basic permissions (fstab & udisks policy)**:


## **11. Performing basic system maintenance tasks (cleanup, logs, ssd trim, etc...)**: