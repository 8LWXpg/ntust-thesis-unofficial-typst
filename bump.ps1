param (
	[string]$newTag
)
$ErrorActionPreference='Stop'
Push-Location $PSScriptRoot

$newTag = $newTag.TrimStart('v')
$tag = (git describe --tags --abbrev=0).Substring(1)
$files = @(
	'.\README.md',
	'.\typst.toml',
	'.\template\main.typ'
)

foreach ($f in $files) {
	(Get-Content $f -Raw) -replace $tag, $newTag | Out-File $f -NoNewline
}

Pop-Location
