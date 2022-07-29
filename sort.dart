import 'dart:collection';

void main(){
  //原始資料
  Map monthSpend = {
  '交通':210, '晚餐':100, 
  '早午餐':200, '午餐':100, 
  '咖啡豆':450, '飲料':35, 
  '電費':670, '書籍':320, 
  'Netflix':396, 'Disney+':274};
  print('排序前:$monthSpend');
  print('長度:${monthSpend.length}\n');
  
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
  
  var sorted = SplayTreeMap<String, int>.from(
    monthSpend,(a, b){
      var k = monthSpend[b].compareTo(monthSpend[a]);
      
      return k;
    }
  );
  print('方法二');
  print('排序後:$sorted');
  print('長度:${sorted.length}');
  
}
