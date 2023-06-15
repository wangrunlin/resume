yaml2json --save yaml

for name in `ls yaml/*.json`
do
  resume export ${name%.json}.html --resume $name --theme latte
done

rm yaml/*.json

mv yaml/*.html out/