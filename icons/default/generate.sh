#!/bin/sh

# color="#00008b"
color="#001586"
gen_file="generate.png"

for i in $(find . -maxdepth 1 -type f -exec file --mime-type {} \+ | awk -F: '{if ($2 ~/image\//) print $1}'  | sed 's/^\.\///g' | sort | tr "\n" " ")
do
    # echo $i
    convert "$i" -fuzz 80%  -transparent white   "${gen_file}"
    convert "${gen_file}" +level-colors "#ffffff","#000000" "${gen_file}"
    convert "${gen_file}" +level-colors "#000000","${color}" "${gen_file}"
    convert "${gen_file}" -fuzz 20% -transparent black -resize 48x48 ../$i
    # convert "${gen_file}" -fuzz 20% -transparent black "${gen_file}"
    # convert "${gen_file}" -resize 48x48 test/$i
done

# clean
rm "${gen_file}"

