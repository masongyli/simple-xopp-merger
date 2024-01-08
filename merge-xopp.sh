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

# Add the common header to the output file
sed -n '/<page/q;p' "${first_xopp_file%.xopp}.xml" >> "$output_file"

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
