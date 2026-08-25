param(
    [string]$ImageDir = "C:\Users\leald\OneDrive\Desktop\Material video Leal academy",
    [string]$Audio01 = "C:\Users\leald\OneDrive\Desktop\audionovo01.mp3",
    [string]$Audio02 = "C:\Users\leald\OneDrive\Desktop\audionovo02.mp3",
    [string]$FinalImage = "C:\Users\leald\OneDrive\Desktop\imagem Final.png",
    [string]$Output = "C:\Users\leald\OneDrive\Desktop\leal-academy-video-final.mp4"
)

$ErrorActionPreference = "Stop"

if(-not (Get-Command ffmpeg -ErrorAction SilentlyContinue)){
    throw "ffmpeg nao encontrado. Instale o ffmpeg ou adicione-o ao PATH antes de renderizar o video."
}

$items = @(
    @{ File = "imagem01.png"; Duration = "7.000" },
    @{ File = "imagem02.png"; Duration = "7.000" },
    @{ File = "imagem03.png"; Duration = "10.000" },
    @{ File = "imagem04.png"; Duration = "6.000" },
    @{ File = "imagem05.png"; Duration = "10.000" },
    @{ File = "imagem06.png"; Duration = "12.000" },
    @{ File = "imagem07.png"; Duration = "6.000" },
    @{ File = "imagem08.png"; Duration = "8.000" },
    @{ File = "imagem09.png"; Duration = "12.000" },
    @{ File = "imagem10.png"; Duration = "10.000" },
    @{ File = "imagem11.png"; Duration = "10.000" },
    @{ File = "imagem12.png"; Duration = "10.000" },
    @{ File = "imagem13.png"; Duration = "9.000" },
    @{ File = "imagem14.png"; Duration = "8.000" },
    @{ File = "imagem15.png"; Duration = "10.000" },
    @{ File = "imagem16.png"; Duration = "9.000" },
    @{ File = "imagem17.png"; Duration = "11.000" },
    @{ File = "imagem18.png"; Duration = "8.000" },
    @{ File = "imagem19.png"; Duration = "8.000" },
    @{ File = "imagem20.png"; Duration = "12.000" },
    @{ File = "imagem21.png"; Duration = "10.000" },
    @{ File = "imagem22.png"; Duration = "10.000" },
    @{ File = "imagem23.png"; Duration = "11.000" },
    @{ File = "imagem24.png"; Duration = "12.000" },
    @{ File = "imagem25.png"; Duration = "8.000" },
    @{ File = "imagem26.png"; Duration = "8.000" },
    @{ File = "imagem27.png"; Duration = "11.000" },
    @{ File = "imagem28.png"; Duration = "9.000" },
    @{ File = "imagem29.png"; Duration = "10.000" },
    @{ File = "imagem30.png"; Duration = "10.000" },
    @{ File = "imagem31.png"; Duration = "11.000" },
    @{ File = "imagem32.png"; Duration = "12.000" },
    @{ File = "imagem33.png"; Duration = "8.000" },
    @{ File = "imagem34.png"; Duration = "9.000" },
    @{ File = "imagem35.png"; Duration = "8.600" },
    @{ File = "imagem36.png"; Duration = "8.000" },
    @{ File = "imagem37.png"; Duration = "10.000" },
    @{ File = "imagem38.png"; Duration = "6.000" },
    @{ File = "imagem39.png"; Duration = "12.000" },
    @{ File = "imagem40.png"; Duration = "8.000" },
    @{ File = "imagem41.png"; Duration = "8.000" },
    @{ File = "imagem42.png"; Duration = "8.000" },
    @{ File = "imagem43.png"; Duration = "8.000" },
    @{ Path = $FinalImage; Duration = "12.592" }
)

$tempDir = Join-Path $env:TEMP ("leal-academy-video-" + [guid]::NewGuid().ToString("N"))
New-Item -ItemType Directory -Force -Path $tempDir | Out-Null
$concatFile = Join-Path $tempDir "images.txt"

function Format-FfmpegPath([string]$Path){
    return $Path.Replace("\", "/").Replace("'", "'\''")
}

try{
    $lines = New-Object System.Collections.Generic.List[string]

    foreach($item in $items){
        $path = if($item.ContainsKey("Path")){ $item.Path } else { Join-Path $ImageDir $item.File }

        if(-not (Test-Path -LiteralPath $path)){
            throw "Imagem nao encontrada: $path"
        }

        $lines.Add("file '" + (Format-FfmpegPath $path) + "'")
        $lines.Add("duration " + $item.Duration)
    }

    $lastPath = $items[-1].Path
    $lines.Add("file '" + (Format-FfmpegPath $lastPath) + "'")
    Set-Content -LiteralPath $concatFile -Value $lines -Encoding UTF8

    ffmpeg `
        -y `
        -f concat -safe 0 -i $concatFile `
        -i $Audio01 `
        -i $Audio02 `
        -filter_complex "[1:a][2:a]concat=n=2:v=0:a=1[a]" `
        -map 0:v -map "[a]" `
        -vf "scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2,setsar=1,format=yuv420p" `
        -r 30 `
        -t 411.192 `
        -c:v libx264 -preset slow -crf 18 `
        -c:a aac -b:a 192k `
        -movflags +faststart `
        $Output

    Write-Host "Video gerado em: $Output"
}finally{
    Remove-Item -LiteralPath $tempDir -Recurse -Force -ErrorAction SilentlyContinue
}
