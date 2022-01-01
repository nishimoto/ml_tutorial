#!/bin/bash

# array_nb=(nb/00_はじめに.ipynb nb/01_Python入門.ipynb 02_Pandas入門.ipynb 03_Kaggleへ登録.ipynb 04_とりあえず機械学習してみる.ipynb 05_機械学習の精度を上げる（特徴量エンジニアリングのための準備）.ipynb 06_機械学習の精度を上げる（特徴量エンジニアリング）.ipynb 07_機械学習の精度を上げる（パラメーターチューニング）.ipynb 08_おわりに.ipynb 99_おまけ_Pandas応用.ipynb)
# array_md=(nb/00_はじめに.md)

# array_nb=(nb/01_Python入門.ipynb)
# array_md=(nb/01_Python入門.md)

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
mv nb/*.md curriculum/

# md内画像のコピー
for folder in nb/*_files; do
  mkdir -p curriculum/`basename $folder`/
  cp -r $folder/* curriculum/`basename $folder`/
  rm -r $folder
done

# nb内にあった画像の変換
mkdir -p curriculum/assets/pic
cp nb/assets/pic/* curriculum/assets/pic
