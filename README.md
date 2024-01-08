# Description
A simple shell script that merges all Xoural++ files (with `.xopp` file extension) in the current folder into a single Xournal++ file.

# Usage
## One time usage:
1. Make sure `merge-xopp.sh` is executable. 
If not, run the following command in the terminal to make it executable.
```
chmod +x merge-xopp.sh
```
2. Copy `merge-xopp.sh` to the folder containing the `.xopp` files to merge.
3. Run the following command in the folder containing the `.xopp` files to merge them into a single `.xopp` file.
```
./merge-xopp.sh
```

## Add the script to your PATH so that you can run it from anywhere.
1. Make sure `merge-xopp.sh` is executable. 
If not, run the following command in the terminal to make it executable.
```
chmod +x merge-xopp.sh
```
2. If you are using bash shell, paste the export syntax at the end of your `.bashrc` file located in the *Home* directory. If you are using other shells, paste the export syntax at the end of the corresponding file. (you should replace *the-directory-of-simple-xopp-merger* with your actual directory path, for example, */home/mason/simple-xopp-merger*)
```
export PATH="$PATH:the-directory-of-simple-xopp-merger"
```
3. Relaunch the terminal.
4. Then you can run the script from anywhere by executing the following command in the terminal.
```
merge-xopp.sh
```

# Limitation
- The order of the merged files is based on the order of the files in the folder. 
If you want to change the order, you need to rename the files to change the order.
- The script doesn't handle notes with pdf.

# Notes
This is a helper script for the note taking app [Xournal++](https://github.com/xournalpp/xournalpp)

This script works on Xournal++ 1.2.2 (Oct 14, 2023), but may break if the file format of Xournal++ changes in the future.

The merging process is based on https://github.com/xournalpp/xournalpp/issues/2816
