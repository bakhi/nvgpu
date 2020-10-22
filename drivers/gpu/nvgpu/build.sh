#!/bin/bash

make all CONFIG_GK20A_TRACE_PRINTK=y -j4

echo "original"
md5sum /lib/modules/$(uname -r)/kernel/drivers/gpu/nvgpu/nvgpu.ko
sudo cp nvgpu.ko /lib/modules/$(uname -r)/kernel/drivers/gpu/nvgpu/
sudo depmod -a
sudo modprobe -f nvgpu

echo "updated"
md5sum /lib/modules/$(uname -r)/kernel/drivers/gpu/nvgpu/nvgpu.ko
