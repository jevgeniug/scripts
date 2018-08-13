/etc/powermt display dev=all | egrep "Pseudo name=|Logical device ID=" | sed 'h;s/.*//;G;N;s/\n/ /g' | sort
