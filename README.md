# camping
[AppStore](<[https://www.meteoblue.com](https://apps.apple.com/tw/app/id6738307193)>)
 
查詢露營場地資訊，7天天氣狀況，觀星條件評估

露營場地資料來源: https://data.gov.tw/dataset/132066 目前資料的最後更新時間為2024-08-26

天氣資料、圖案來源: https://www.meteoblue.com

觀星條件評估算法 (僅供參考)

    月光影響分數 = min(100, max(0, 100 − (moonlightActual − moonlightClearsky)))
  
    雲層影響分數 = min(200, max(0, 200 − (totalcloudcover + fogProbability)))
  
    夜空亮度影響
    delta = nightskybrightnessActual - nightskybrightnessClearsky

    夜空亮度影響分數 = 100,  if delta <= 0
    
    夜空亮度影響分數 = ((2 - delta) / 2) * 100, if 0 < delta < 2
    
    夜空亮度影響分數 = 0, if delta >= 2

    觀星條件總分 = 月光影響分數 + 雲層影響分數 + 夜空亮度影響分數 / 400
  


## Getting Started

1. 到[meteoblue](<https://www.meteoblue.com>) 註冊並取的API key
2. assets 下創建key.json (assets/key.json)，並將步驟1 取得的API key 填入
```
  {
    "forecastApiKey": <your api key>
  }
```

