pushd $PSScriptRoot

md build -ea ig
typst c ./template/main.typ ./build/main.pdf
typst c -f png --pages 1 --ppi 250 ./template/main.typ ./thumbnail.png
oxipng -o max ./thumbnail.png
typst c ./template/frontpages/coverbridge.typ ./build/coverbridge.pdf

popd