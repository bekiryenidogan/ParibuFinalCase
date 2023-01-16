# Paribu Final Case

Topluluk yönetimi için kullanılabilecek bir akıllı sözleşme örneği

Kullanıcıların whitelist ve blacklist edilebildiği, yeni topluluklar oluşturulup
whitelist edilmiş kullanıcıların bu topluluklara katılabildiği bir akıllı kontrattır.

# Fonksiyonlar
## CommunityManagement.sol
### createCommunity
    
>Yeni topluluğu sadece kontrat sahibi oluşturabilir.
  
Topluluk adı, topluluğa katılabilecek maksimum katılımcı sayısı, topluluğa katılmak için ödenmesi istenen miktar ve
topluluğun içerisindeki oyuncuların yer alacağı bir array tanımlanacaktır. 

Örnek Girdi Taslağı :
```sh
paribu,4,10,[]
```
> İsminin paribu olduğu, maksimum 4 kullanıcı barındırabilecek, katılma bedelinin 10 ether olduğu bir topluluk oluşturur.


### getCommunity 
>Topluluk bilgilerine sadece kontrat sahibi ulaşabilir.
```sh
0
```

Topluluk id'si ile topluluğun bilgilerine erişebilirsiniz.

### joinCommunity
Whitelistte bulunan bir adres topluluk idsini ve topluluğa katılmak için istenen ücreti ödeyerek topluluğa katılabilir.
```sh
0
```
> Katılmak istenen topluluğun ücreti de eklenmelidir.

### isUser
Bu fonksiyon bir kullanıcıyı uzaklaştırmak için kullanılan kickPlayer fonksiyonu için çalışmaktadır. Kullanıcının topluluk içerisinde yer aldığı dizinde hangi indexte olduğunu geri döner.

### remove 

isUser fonksiyonundan gelen index bilgisini kullanarak belirlenen adresi dizinin sonuncu elemanı olarak ayarlar ve ardından pop fonksiyonu ile kullanıcı bilgisini dizinden siler.

### kickPlayer

isUser ve remove fonksiyonları kickPlayer fonksiyonu için çalışmaktadır. Topluluk id'si ve uzaklaştırılmak istenen kullanıcının adres bilgisi ile çalışır. 
```sh
0,0xxxxxxxxxxxxxxxxxxxxxxx
```

## WhiteBlackList.sol

### addToBlacklist // addToWhiteList

>Listelere sadece kontrat sahibi ekleme yapabilir.

 Adres bilgisi ile çalışır.
 
 ```sh
0xxxxxxxxxxxxxxxxxxxxxxx
```

### removeFromWhitelist  // removeFromBlacklist 
>Listelerden sadece kontrat sahibi çıkarma yapabilir.

Adres bilgisi ile çalışır.

 ```sh
0xxxxxxxxxxxxxxxxxxxxxxx
```


### numAddressesWhitelisted // numAddressesBlacklisted

Listelere eklenen toplam kullanıcı sayısı bilgisi için kullanılır.


### whitelistedAddresses // blacklistedAddresses

Adres bilgisi girildiğinde adresin whitelistte yada blacklistte olup olmadığını kontrol edilir.
 ```sh
0xxxxxxxxxxxxxxxxxxxxxxx
```
