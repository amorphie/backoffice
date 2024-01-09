# Backoffice UI JSON

## Menu
### Left Sidebar Menu

## Dashboard Settings
### Item Model
**type (Zorunlu):** Enum aşağıda tanımlandı.

:::spoiler Item Tipleri
* counters
* chart
* tab
* list
:::
**entity:** Liste gösterimlerinde sütun isimleri ve özelliklerini getirmek için entityler kullanılır. Sadece type = 'list' durumunda zorunludur.
**dataUrl:** Listenin getirileceği url verilir. Sadece type = 'list' durumunda zorunludur.
**data:**  Sadece type = 'chart|counters' durumunda zorunludur.
**items:** Anasayfada tab gibi çoklu itemler kullanacak widgetlar için eklendi. Sadece type = 'tab' durumunda zorunludur. İçeriği bu modelden oluşuyor.
**count (Default = 5):** int 
**title:** Zorunlu değil. Başlık eklenmesi istenen durumlarda kullanılacak. 
:::spoiler Örnek
```json=
{
    "en-EN": "Users",
    "tr-TR": "Kullanıcılar"
}
```
:::
### Data Model

**url :** list içerisindeki datayı dışarıdan alabilmek için eklenir. Aşağıdaki list datası şeklinde data dönmesi ile çalışabilir
**chartType :** içeriği dolu olması durumunda tipinin chart olduğu anlaşılır ve data içeriği bu şekilde istenen chart ile gösterilir.
:::spoiler Chart Tipleri
* pie
* line
* bar
:::

**list :** title ve value içeren bir listeden oluşur. Sadece type = 'chart|counters' durumunda kullanılır.
:::spoiler Örnek Json
```json
"list": [
    {
        "title": "Kullanıcı Sayısı",
        "value": 10
    }
]
```
:::
### Örnek Jsonlar


:::spoiler Counters Örnek Json
```json=
{
    "data": {
        "list": [
            {
                "title": "Kullanıcı Sayısı",
                "value": 10
            }
        ],
        "url": "counter-api"
    },
    "type": "counters"
}
```
:::
:::spoiler Chart Örnek Json
```json=
{
    "data": {
        "chartType": "pie",
        "list": [
            {
                "title": "Test",
                "value": 10
            },
            {
                "title": "Test Data",
                "value": 20
            }
        ],
        "url": "chart-data-api"
    },
    "title": {
        "en-EN": "Users",
        "tr-TR": "Kullanıcılar"
    },
    "type": "chart"
}
```
:::
:::spoiler List Örnek Json
```json=
{
    "items": [
        {
            "count": 5,
            "data-url": "data-url",
            "entity": "client",
            "title": {
                "en-EN": "Last Clients",
                "tr-TR": "Son İstemciler"
            },
            "type": "list"
        }
    ],
    "title": {
        "en-EN": "Last Added",
        "tr-TR": "Son Eklenenler"
    },
    "type": "tab"
}

```
:::
