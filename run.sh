make clean && make
rm -r docs
mv build docs
git add .
git commit -m 'new'
git push origin master