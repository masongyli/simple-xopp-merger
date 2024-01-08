#!/bin/bash

first_xopp_file=$(ls *.xopp | head -n 1)

tmp_folder=".simple-xopp-merger_${first_xopp_file%.xopp}"
mkdir "$tmp_folder"
echo "Created temporary folder $tmp_folder"

# Create a xml.gz replica for each .xopp file of the current folder
for file in *.xopp; do
    if [ -e "$file" ]; then
        # Rename the file to have .gz extension
        cp "$file" "$tmp_folder/${file%.xopp}.xml.gz"
        echo "Copied $file to $tmp_folder/${file%.xopp}.xml.gz"
    fi
done

cd "$tmp_folder"

# Decompress all .gz files
for file in *.gz; do
    if [ -e "$file" ]; then
        gzip -d "$file"
        echo "Decompressed $file"
    fi
done

output_file="${first_xopp_file%.xopp}_merged"

# Create a new xournal file with the common head
echo '<?xml version="1.0" standalone="no"?>' >> "$output_file"
echo '<xournal creator="Xournal++ 1.2.2" fileversion="4">' >> "$output_file"
echo '<title>Xournal++ document - see https://github.com/xournalpp/xournalpp</title>' >> "$output_file"
echo '<preview></preview>' >> "$output_file"
# content in the <preview> tag is the base64 image encoding of the first page of the document
# Whenever we execute "save file" in Xournal++, the content of preview is updated
# so we don't need to worry about it

# Iterate over each .xml file
for file in *.xml; do
    if [ -e "$file" ]; then
        # Extract the content between the first <page> and the last </page>
        echo "<!-- content from $file -->" >> "$output_file" 
        sed -n '/<page/,/<\/page>/p' "$file" >> "$output_file"
        echo "Appended the page content of $file to $output_file"
    fi
done

echo '</xournal>' >> "$output_file"


gzip "$output_file"
mv --backup=numbered "$output_file.gz" "../${output_file}.xopp"
echo "Generated ${output_file%.xml}.xopp"

# remove tmp files
cd ..
rm -r "$tmp_folder"
echo "Removed $tmp_folder"

echo "Done"
