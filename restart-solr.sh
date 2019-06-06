#!/bin/bash
# 
# DESCRIPTION:
# 
#   Basic script to restart solr with more memory
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

echo "Stop Solr..."
java -DSTOP.PORT=34343 -DSTOP.KEY=jjk#09s -jar start.jar --stop
echo "Done."
echo "Wait 20 seconds for the port to be freed..."
sleep 20
echo "Solr will start now with 4GB of RAM..."
java -Xmx4G -DSTOP.PORT=34343 -DSTOP.KEY=jjk#09s -jar start.jar 2>`date -Iseconds`.log &
echo "Done."
echo "You can now use Autopsy."
