# Installation Guide

Simple Installation guide for Arch Linux.

**Overwriting disk with random data**

This is an optional step and is usualy done before encryption.

```bash
dd if=/dev/urandom of=/dev/nvme0n1 status=progress bs=4096
```
