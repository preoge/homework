void main() {
  collection();
  print('ok');
}

void collection() {
//创建一组空字符串。
var ingredients = <String>{};

//添加新项。
ingredients.addAll(['gold', 'titanium', 'xenon']);
assert(ingredients.length == 3);

//添加一个重复的项目没有影响。
ingredients.add('gold');
assert(ingredients.length == 3);

//从集合中删除项。
ingredients.remove('gold');
assert(ingredients.length == 2);

//您还可以使用
//其中一个构造函数。
var atomicNumbers = Set.from([79, 22, 54]);

var ingredients1 = Set<String>();
ingredients1.addAll(['gold', 'titanium', 'xenon']);

//检查是否一个项目设置。
assert(ingredients1.contains('titanium'));

//检查所有项目是否都在集合中。
assert(ingredients1.containsAll(['titanium', 'xenon']));
ingredients.addAll(['gold', 'titanium', 'xenon']);

// 创建两个集合的交集。
var nobleGases = Set.from(['xenon', 'argon']);
var intersection = ingredients.intersection(nobleGases);
assert(intersection.length == 1);
assert(intersection.contains('xenon'));





  
}



