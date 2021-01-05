# Gremlin Playground

This repo provides the Gremlin Playground virtual machine binaries and also contains the files necessary to create the virtual machine binaries.

## Using the Gremlin Playground

### VirtualBox

To run the Gremlin Playground on [VirtualBox](https://www.virtualbox.org/):

1. Download the latest release from the [Releases page](https://github.com/gremlin/gremlin-playground/releases).
1. Extract the virtual machine files.
   - MacOS: Double-click the Gremlin Playground .tar.gz file.
   - Linux: Use the tar command. e.g. `tar xzf gremlin_playground.tar.gz`
   - Windows: Use a tool such as [7-zip](https://www.7-zip.org/).
1. In VirtualBox, select "Import Appliance" from the "File" menu.
1. In the "Source" panel, choose "Local File System" and select the `GremlinPlayground.ovf` file you extracted in the previous steps. Then, click "Import".
1. After the Gremlin Playground VM has been imported, click the "Start" button.

### Logging in

To log in, use the credentials:
- username: `gremlin`
- password: `gremlin`

The `gremlin` user has been added to the `sudoers` file and there is no password required to run `sudo`.

Note that logging in directly to the VM using VirtualBox does *not* support copy & paste from the host computer. This can make entering commands and credentials more difficult. You can SSH to the VM and port forwarding has been pre-configured on port 2222.

```bash
ssh -p 2222 gremlin@localhost
```

### Initializing Gremlin

The Gremlin client has been pre-installed on the VM, however you need to provide your credentials to associate it to your Gremlin account. If you do not have a Gremlin account, you can create one free at [https://gremlin.com/free](https://gremlin.com/free).

After you log into the VM, run the command `gremlin-playground` and follow the instructions to authenticate the Gremlin client. For more information, see the [authentication documentation](https://www.gremlin.com/docs/infrastructure-layer/authentication/).

Once your VM has been authenticated, it will appear in the [clients page](https://app.gremlin.com/clients/hosts) in your Gremlin account.


---
# Development information

## Requirements

This project uses [Packer](https://www.packer.io/) and [VirtualBox](https://www.virtualbox.org/) to build the images.

### Mac

The easiest way to install both tools on a mac is to use [Homebrew](https://brew.sh/) and run the commands:
```bash
# Install Packer.
brew install packer

# Install VirtualBox.
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

# Remove any existing builds.
make clean

# Run the build process.
make build

# Or if you're doing continued development, use the rebuild command.
# This will perform a clean, build, and import the new build into
# VirtualBox and run it.
make rebuild
```

When complete, packer will create a `gremlin_playground.tar.gz` file that is ready for distribution.

## Creating releases

To create a new release:

1. Update the `CHANGELOG.md` file. Note that the format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) and uses [Semantic Versioning](https://semver.org/spec/v2.0.0.html).
1. Tag the main branch with your new version number. e.g. `git tag v0.7.0` and push the tag
1. Run `make clean` and `make build` to build a new release.
1. Go to https://github.com/gremlin/gremlin-playground/releases/new and select your tag. The title of your release should be the version name (e.e. `v.0.7.0`) and the release description should be the notes from the `CHANGELOG.md` file.
1. Attach the `gremlin_playground.tar.gz` file to your new release, then rename the file to add the release version number. e.g. `gremlin_playground-0.7.0.tar.gz`
1. Double check your work!
1. Click the "Publish release" button & celebrate!

## Troubleshooting

## Todo

- Add development tips to the "Troubleshooting" section.
- Add support to build an AWS AMI
- Add support to build an Azure AMI
- Add support to build a GCP AMI
