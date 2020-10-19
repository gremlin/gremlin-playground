# Gremlin Playground

This repo will help you build a minimal Linux virtual machine image that will allow anyone to easily play with Gremlin.

The project currently supports:

- VirtualBox: Generates a .tar.gz file that contains a VirtualBox OVF (machine config file) and VMDK (disk image)
- AWS AMI: not yet supported
- Azure AMI: not yet supported
- GCP AMI: not yet supported

## Requirements

This project uses [Packer](https://www.packer.io/) and [VirtualBox](https://www.virtualbox.org/) to build the images.

### Mac

The easiest way to install both tools on a mac is to use [Homebrew](https://brew.sh/) and run the commands:
```bash
# Install Packer.
brew install packer

# Install VirtualBox
brew cask install virtualbox
```

### Other
Both tools support other operating systems, including Linux and Windows. See their respective websites for installers:

- [Packer downloads](https://www.packer.io/downloads)
- [VirtualBox downloads](https://www.virtualbox.org/wiki/Downloads)


## Building a new image

To build a new VM image:

```bash
# Validate any changes made to the Packer file.
# If the file is valid, the command will not return any messages.
packer validate playground.json

# Run the build process.
packer build playground.json
```

When complete, packer will create a `gremlin_playground.tar.gz` file that is ready for distribution.

## Todo

- We probably need versioning on the VM images. This can likely be accomplished by creating a `CHANGELOG.md` file in the root directory and just copying it into the VM.
- We need to add a simple web app to demonstrate network attacks.
- It's currently not possible to cut & paste into the VM. This makes entering the team ID and secret user unfriendly. There is no paste buffer/clipboard in the Centos 8 minimal shell (so this cannot be solved with the VirtualBox guest tools), so we'll likely need to enable ssh and have users ssh into the VM.
- Add support to build cloud AMIs.
