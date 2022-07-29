# Dart-SortMapByValue


## Original Data


```dart=
Map monthSpend = {
  '交通':210, '晚餐':100, 
  '早午餐':200, '午餐':100, 
  '咖啡豆':450, '飲料':35, 
  '電費':670, '書籍':320, 
  'Netflix':396, 'Disney+':274};
```


## Method 1


```dart=
List test = [];
  monthSpend.forEach((key, value){
    test.add(
      {'name':key, 'price':value}
    );
  });
  test.sort((a, b) => b['price']!.compareTo(a['price']!));
  
  monthSpend = {};
  for(var i in test){
    monthSpend[i['name']] = i['price'];
  }
  print('方法一');
  print('排序後:$monthSpend');
  print('長度:${monthSpend.length}\n');
```


### Result


```bash=
方法一
排序後:{電費: 670, 咖啡豆: 450, Netflix: 396, 書籍: 320, Disney+: 274, 交通: 210, 早午餐: 200, 晚餐: 100, 午餐: 100, 飲料: 35}
長度:10
```

## Method 2


```dart=
var sorted = SplayTreeMap<String, int>.from(
    monthSpend,(a, b){
      var k = monthSpend[b].compareTo(monthSpend[a]);
      
      return k;
    }
  );
  print('方法二');
  print('排序後:$sorted');
  print('長度:${sorted.length}');
```


### Result


```bash=
方法二
排序後:{電費: 670, 咖啡豆: 450, Netflix: 396, 書籍: 320, Disney+: 274, 交通: 210, 早午餐: 200, 晚餐: 100, 飲料: 35}
長度:9
```

## Conclusion


若是Map中的剛好有相同的值，使用一般常見的SplayTreeMap排序的話，相同值的其中一個會消失
因此若是要將Map中的值做排序，還是建議先將Map轉為List，排序完後再轉回Map