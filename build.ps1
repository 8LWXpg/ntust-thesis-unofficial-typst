pushd $PSScriptRoot

$logoUrl = 'https://www.secretariat.ntust.edu.tw/app/index.php?Action=downloadfile&file=WVhSMFlXTm9Mekl3TDNCMFlWOHpPRE13TkY4M09UTXhPVFUzWHpNMU16YzJMbkJ1Wnc9PQ==&fname=LOGGYSOKRKDCOOYXEDLKIG24FC30TWLK50FGXSMKGG25WWRKDCMKYSTWSSOKCDFCNOWWUT0520FGNK24KOOKQL00'
iwr $logoUrl -OutFile ./template/logo.png
md build -ea ig
typst c ./template/main.typ ./build/main.pdf
typst c -f png --pages 1 --ppi 250 ./template/main.typ ./thumbnail.png
oxipng -o max ./thumbnail.png
typst c ./template/frontpages/coverbridge.typ ./build/coverbridge.pdf

popd