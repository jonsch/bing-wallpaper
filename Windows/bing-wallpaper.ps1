# Directory to save the wallpaper
$wallpaperDir = "$HOME\Pictures\BingWallpapers"
if (-not (Test-Path -Path $wallpaperDir)) {
    New-Item -ItemType Directory -Path $wallpaperDir
}

# Get today's date
$date = Get-Date -Format "yyyy-MM-dd"

# Bing URL for the daily wallpaper
$bingUrl = "https://www.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1&mkt=en-US"

# Fetch the wallpaper URL
$json = Invoke-RestMethod -Uri $bingUrl
$imageUrl = "https://www.bing.com" + $json.images[0].url
$imageName = "$date-" + [System.IO.Path]::GetFileName($imageUrl)
$imagePath = Join-Path -Path $wallpaperDir -ChildPath $imageName

# Download the wallpaper if it doesn't already exist
if (-not (Test-Path -Path $imagePath)) {
    Invoke-WebRequest -Uri $imageUrl -OutFile $imagePath
}

# Set the wallpaper
$code = @"
[DllImport("user32.dll", CharSet = CharSet.Auto)]
public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
"@

Add-Type -MemberDefinition $code -Name "Win32" -Namespace "Wallpaper"
[Wallpaper.Win32]::SystemParametersInfo(0x0014, 0, $imagePath, 0x0001)

