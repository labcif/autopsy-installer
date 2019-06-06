# autopsy-installer
Basic script to automate the installation of Autopsy 4.10, Oracle JDK 8 and other utilities on Ubuntu.

# Usage
First, place the following file **inside the same directory** of the `autopsy-installer.sh` script:
- the latest version of JDK 8, at the time of this writing was `jdk-8u212-linux-x64.tar.gz` (requires a login to [download](https://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html) since 2019-04-16)

Optionally, you may also include these files (if they aren't present the script will download them for you):
- `sleuthkit-java_4.6.5-1_amd64.deb` ([download](https://github.com/sleuthkit/sleuthkit/releases/download/sleuthkit-4.6.5/sleuthkit-java_4.6.5-1_amd64.deb))
- `autopsy-4.10.0.zip` ([download](https://github.com/sleuthkit/autopsy/releases/download/autopsy-4.10.0/autopsy-4.10.0.zip))

**Note:** if there are newer versions of the files you must edit the script first and change the corresponding variables. Make sure that the autopsy version is correctly paired with the version of the sleuthkit.

Then run the script:
```bash
$ ls
autopsy-installer.sh  jdk-8u212-linux-x64.tar.gz  restart-solr.sh

$ ./autopsy-installer.sh
```

# Share

Cite as:

Miguel Frade. (2019, June 6). labcif/autopsy-installer. Zenodo. http://doi.org/10.5281/zenodo.3240670 ([BibTeX file](cite.bib))


