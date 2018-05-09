# Blind.sh

This script blinds files by copying and renaming them with a random set of characters. The script also saves a record in `key.txt` for the un-blinding of files.

## Usage
If the `blind.sh` script is executable and locatable by your `PATH` variable, you can call it by executing `blind.sh` at the prompt.
Otherwise, run the script at the prompt with `sh blind.sh`.

## Compatibility
This script was tested on macOS 10.13.4 with GNU bash 3.2.57.

## Notes
To make the script executable and locatable by your `PATH` variable. 
Grant execution privileges to the bash script.
```console
chmod +x blind.sh 
```

Then place the script under `~/Documents/Scripts`, and add the directory to the `PATH` variable.
```console
echo 'export PATH=$PATH:~/Documents/Scripts' >> ~/.profile 
```
> ***Note:*** The example shows how to modify the `PATH` variable in a bash environment.

## Development Notes
[http://mywiki.wooledge.org/BashGuide/Arrays](http://mywiki.wooledge.org/BashGuide/Arrays)
[https://stackoverflow.com/questions/965053/extract-filename-and-extension-in-bash](https://stackoverflow.com/questions/965053/extract-filename-and-extension-in-bash)
[https://peniwize.wordpress.com/2011/04/09/how-to-read-all-lines-of-a-file-into-a-bash-array/](https://peniwize.wordpress.com/2011/04/09/how-to-read-all-lines-of-a-file-into-a-bash-array/)
[https://www.gnu.org/software/bash/manual/bashref.html](https://www.gnu.org/software/bash/manual/bashref.html)