pushd $PSScriptRoot

# Modify main.typ to compile with logo
$logoUrl = 'https://www.secretariat.ntust.edu.tw/app/index.php?Action=downloadfile&file=WVhSMFlXTm9Mekl3TDNCMFlWOHpPRE13TkY4M09UTXhPVFUzWHpNMU16YzJMbkJ1Wnc9PQ==&fname=LOGGYSOKRKDCOOYXEDLKIG24FC30TWLK50FGXSMKGG25WWRKDCMKYSTWSSOKCDFCNOWWUT0520FGNK24KOOKQL00'
iwr $logoUrl -OutFile ./template/logo.png
cp ./template/main.typ ./template/main.typ.bak
(cat .\template\main.typ -Raw) -replace '// logo: image\("logo.png"\)', 'logo: image("logo.png")' | Set-Content .\template\main.typ -NoNewline

md build -ea ig
typst c ./template/main.typ ./build/main.pdf
typst c -f png --pages 1 --ppi 250 ./template/main.typ ./thumbnail.png
oxipng -o max ./thumbnail.png
typst c ./template/frontpages/coverbridge.typ ./build/coverbridge.pdf

mv .\template\main.typ.bak .\template\main.typ -Force

popd