# autopsy-installer
Basic script to automate the installation of Autopsy and other tools on Ubuntu.

# Usage
Place the following files inside the same directory of this script:
- `jdk-8u212-linux-x64.tar.gz` [download link](https://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)
- `sleuthkit-java_4.6.5-1_amd64.deb` [download link](https://github.com/sleuthkit/sleuthkit/releases/download/sleuthkit-4.6.5/sleuthkit-java_4.6.5-1_amd64.deb)
- `autopsy-4.10.0.zip` [download link](https://github.com/sleuthkit/autopsy/releases/download/autopsy-4.10.0/autopsy-4.10.0.zip)

**Note:** if there are newer versions of the files you must edit the script first. Make sure that the autopsy version is correctly paired with the version of the sleuthkit.

Then run the script:
```bash
$ ./autopsy-installer
```



