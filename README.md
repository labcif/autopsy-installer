# autopsy-installer
Basic script to automate the installation of Autopsy and other tools on Ubuntu.

# Usage
First, place the following file **inside the same directory** of the `autopsy-installer.sh` script:
- `jdk-8u212-linux-x64.tar.gz` (requires login, since 2019-04-16, to [download](https://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html))

Optionally, you may also include these files, but if they aren't present the script will download them:
- `sleuthkit-java_4.6.5-1_amd64.deb` ([download](https://github.com/sleuthkit/sleuthkit/releases/download/sleuthkit-4.6.5/sleuthkit-java_4.6.5-1_amd64.deb))
- `autopsy-4.10.0.zip` ([download](https://github.com/sleuthkit/autopsy/releases/download/autopsy-4.10.0/autopsy-4.10.0.zip))

**Note:** if there are newer versions of the files you must edit the script first and change the corresponding variables. Make sure that the autopsy version is correctly paired with the version of the sleuthkit.

Then run the script:
```bash
$ ./autopsy-installer.sh
```



