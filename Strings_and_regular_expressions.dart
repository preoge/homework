void main(List<String> args) {
  Strings_and_regular_expressions();
  print('ok');
}

void Strings_and_regular_expressions() {
  //提取子串
  assert('Never odd or even'.substring(6, 9) == 'odd');
  //以字符串模式拆解字符串
  var parts = 'progtrssive web apps'.split(" ");
  assert(parts.length == 3);
  assert(parts[0] == 'progressive');
//字符串可以像数组一样使用字符串元素
  assert('Never odd or even'[0] == 'N');

  for (final char in 'hello'.split('')) {
    print(char);
  }
//获取字符串的所有的字符的utf-16码，并且转为列表
  var codeUnitList = 'Never odd or even'.codeUnits.toList();
  assert(codeUnitList[0] == 78);
//变大写
  assert('web apps'.toUpperCase()=='WEB APPS');
assert('WEB APPS'.toLowerCase()=='web apps');



}
