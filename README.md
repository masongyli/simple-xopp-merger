# Description
A simple shell script that merges all Xoural++ files (with `.xopp` file extension) in the current folder into a single Xournal++ file.

# Usage
1. Make sure `merge_xopp.sh` is executable. If not, run `chmod +x merge_xopp.sh`.
2. Run `./merge_xopp.sh` in the folder containing the `.xopp` files to merge them into a single `.xopp` file.

# limitation
The order of the merged files is based on the order of the files in the folder. 
If you want to change the order, you need to rename the files to change the order.

# Notes
This is a helper script for the note taking app [Xournal++](https://github.com/xournalpp/xournalpp)

This script works on Xournal++ 1.2.2 (Oct 14, 2023), but may break if the file format of Xournal++ changes in the future.

The merging process is based on https://github.com/xournalpp/xournalpp/issues/2816