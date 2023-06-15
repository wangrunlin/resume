cp patch/*.patch yaml/

for name in `ls yaml/*.patch`
do
  patch ${name%.patch}.yaml < $name
done

yaml2json --save yaml

for name in `ls yaml/*.json`
do
  resume export ${name%.json}.html --resume $name --theme latte
done

mv yaml/*.html out/

rm yaml/*.json
rm yaml/*.patch