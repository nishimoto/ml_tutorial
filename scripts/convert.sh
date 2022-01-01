#!/bin/bash

path_out_folder="md"

# ipynbからmdへ変換する用のスクリプト
# "${array_nb[@]}"
for i in nb/*.ipynb; do
jupyter nbconvert --to markdown $i
done

# mdの微修正
for i in nb/*.md; do
  python scripts/md_modify.py $i > $i.temp
  python scripts/md_modify2.py $i.temp > $i.temp2
  mv $i.temp2 $i
  rm $i.temp
done

# mdをフォルダ移動
mkdir -p $path_out_folder
mv nb/*.md $path_out_folder

# md内画像のコピー
for folder in nb/*_files; do
  mkdir -p $path_out_folder/`basename $folder`/
  cp -r $folder/* $path_out_folder/`basename $folder`/
  rm -r $folder
done

# nb内にあった画像の変換
mkdir -p $path_out_folder/assets/pic
cp nb/assets/pic/* $path_out_folder/assets/pic
