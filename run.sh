make clean && make
rm -r docs
mv build docs
git add .
git commit -m 'add info'
git push -u origin master