pushd $PSScriptRoot

md build -ea ig
typst c ./template/main.typ ./build/main.pdf
typst c ./template/frontpages/coverbridge.typ ./build/coverbridge.pdf

popd