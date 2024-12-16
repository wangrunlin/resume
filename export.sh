# copy simple yaml
cp yaml/en.yaml yaml/simple-en.yaml
cp yaml/zh.yaml yaml/simple-zh.yaml

cp patch/*.patch yaml/

for name in `ls yaml/*.patch`
do
  patch ${name%.patch}.yaml < $name
done

yaml2json --save yaml

for name in `ls yaml/*.json`
do
  resume export ${name%.json}.html --resume $name --theme onepage-plus
done

mv yaml/*.html out/

# router
cp out/en.html out/index.html
cp out/simple-en.html out/simple.html

rm yaml/*.json
rm yaml/*.patch
rm yaml/simple*