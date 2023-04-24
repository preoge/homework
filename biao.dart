void main() {
  collection();
  print('ok');
}

void collection() {
//造一个字符串空列表
  var grains = <String>[];
  assert(grains.isEmpty);
  //使用列表文字创建列表
  var fruits = ['apples', 'oranges'];
  fruits.add('kiwis');
  //向列表中添加多个项。
  fruits.addAll(['grapes', 'bananas']);
  assert(fruits.length == 5);
//删除单个项目。
  var appleIndex = fruits.indexOf('apples');
  fruits.removeAt(appleIndex);
  assert(fruits.length == 4);

//从列表中删除所有元素。
  fruits.clear();
  assert(fruits.isEmpty);

//您还可以使用其中一个构造函数创建 List。
  var vegetables = List.filled(99, 'broccoli');
  assert(vegetables.every((v) => v == 'broccoli'));

  var fruits1 = ['bananas', 'apples', 'oranges'];
// 排序
  fruits1.sort((a, b) => a.compareTo(b));
  assert(fruits1[0] == 'apples');



  //此列表应该只包含字符串。
var fruits2 = <String>[];
fruits2.add('apples');
var fruit3 = fruits2[0];
assert(fruit3 is String);


}
