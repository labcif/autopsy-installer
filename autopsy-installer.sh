#!/bin/bash
# 
# DESCRIPTION:
# 
#   Basic script to automate the installation of Autopsy and other tools on Ubuntu.
#   Requests sudo permissions.
#
# 
# Copyright (C) 2019, Miguel Frade
#
#
# LICENSE:
# 
#   This program is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
# 
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
# 
#   You should have received a copy of the GNU General Public License
#   along with this program.  If not, see <https://www.gnu.org/licenses/>.
#

# set up some variables
JAVA_FILE="jdk-8u212-linux-x64.tar.gz"
SLEUTHKIT_FILE="sleuthkit-java_4.6.5-1_amd64.deb"
AUTOPSY_VERSION="4.10.0"
AUTOPSY_FILE="autopsy-$AUTOPSY_VERSION.zip"
AUTOPSY_DIR="autopsy-$AUTOPSY_VERSION"

echo "#####################################"
echo "# Updating the APT database ..."
echo "#####################################"
    sudo apt update  2>&1
echo "Done."
echo ""

OLD_DIR=`pwd`

echo "#####################################"
echo "# Installing dependencies..."
echo "#####################################"
    
    echo "[INFO.] Installing some tools..."
    sudo apt install -y git testdisk ewf-tools xmount fdupes 2>&1
    echo "Done."
    echo ""
    
    mkdir -p /tmp/github
    cd /tmp/github
    
    if [ -e /usr/local/bin/oracle-java-installer ]; then
        echo "[INFO.] The file \"oracle-java-installer\" already exists."
    else
        echo "[INFO.] Installing \"oracle-java-installer\"..."
        git clone https://github.com/labcif/oracle-java-installer.git
        cd /tmp/github/oracle-java-installer
        sudo ./install.sh
        echo "Done."
        echo ""
    fi
    
    # optional, but cool :)
    if [ -e /usr/local/bin/b64sha ]; then
        echo "[INFO.] The file \"b64sha\" already exists."
    else
        echo "[INFO.] Installing \"b64sha\"..."
        git clone https://github.com/labcif/Base64SHA.git
        cd /tmp/github/Base64SHA
        sudo ./install.sh
        echo "Done."
        echo ""
    fi
    
    cd $OLD_DIR
    
    echo "[INFO.] Installing \"$JAVA_FILE\"..."
    if [ -e ./$JAVA_FILE ] ; then
        sudo /usr/local/bin/oracle-java-installer -i $JAVA_FILE 2>&1
        echo "Done."
        echo ""
        /usr/local/bin/oracle-java-installer -s
        echo ""
    else
        echo "[ERROR] The file \"$JAVA_FILE\" is missing."
        exit
    fi
    
    echo "[INFO.] Installing \"$SLEUTHKIT_FILE\"..."
    if [ -e ./$SLEUTHKIT_FILE ] ; then
        sudo apt install -y ./$SLEUTHKIT_FILE 2>&1
        echo "Done."
        echo ""
    else
        echo "[ERROR] The file \"$SLEUTHKIT_FILE\" is missing."
        exit
    fi
    
echo "Done."
echo ""

echo "#####################################"
echo "# Installing AUTOPSY..."
echo "#####################################"

    echo "[INFO.] Installing \"$AUTOPSY_FILE\"..."
    if [ -e ./$AUTOPSY_FILE ] ; then
        unzip -f $AUTOPSY_FILE 2>&1
        
        if [ ! -d $HOME/$AUTOPSY_DIR ]; then
            mv $AUTOPSY_DIR $HOME 2>&1
        fi
        
        
        if [ -e ./restart-solr.sh ] ; then
            echo "[INFO.] Installing \"restart-solr.sh\" script..."
            cp ./restart-solr.sh $HOME/$AUTOPSY_DIR/autopsy/solr/
            chmod +x $HOME/$AUTOPSY_DIR/autopsy/solr/restart-solr.sh
            echo "Done."
            echo ""
        else
            echo "[WARN.] The script \"restart-solr.sh\" is missing!"
        fi
        
        echo "[INFO.] Last checks..."
        cd $HOME/$AUTOPSY_DIR
        chmod +x unix_setup.sh
        ./unix_setup.sh || exit
        
        echo "Done."
        echo ""
    else
        echo "[ERROR] The file \"$AUTOPSY_FILE\" is missing."
        exit
    fi

