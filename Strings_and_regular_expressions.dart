void main(List<String> args) {
  Strings_and_regular_expressions();
  print('ok');
}

void Strings_and_regular_expressions() {
  //提取子串
  assert('Never odd or even'.substring(6, 9) == 'odd');
  //以字符串模式拆解字符串
  var parts = 'progressive web apps'.split(" ");
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

// 删除首尾多余空格，修剪.
assert('  hello  '.trim() == 'hello');

// 检查空的
assert(''.isEmpty);

// 空格也是元素
assert('  '.isNotEmpty);



var greetingTemplate = 'Hello, NAME!';
var greeting = greetingTemplate.replaceAll(RegExp('NAME'), 'Bob');
// 看看有没有改变
assert(greeting != greetingTemplate);

//若要以编程方式生成字符串，可以使用 StringBuffer。一个 StringBuffer 不会生成一个新的 String 对象，
//直到叫。该方法有一个可选的第二个参数，该参数 允许您指定分隔符，在本例中为空格。
var sb = StringBuffer();
sb
  ..write('Use a StringBuffer for ')
  //选择空格
  ..writeAll(['efficient', 'string', 'creation'], ' ')
  ..write('.');

var fullString = sb.toString();

assert(fullString == 'Use a StringBuffer for efficient string creation.');

//正则表达式
// 下面是一个或多个数字的正则表达式。
var numbers = RegExp(r'\d+');

var allCharacters = 'llamas live fifteen to twenty years';
var someDigits = 'llamas live 15 to 20 years';

// 可以使用正则表达式。
assert(!allCharacters.contains(numbers));
assert(someDigits.contains(numbers));

// 用另一个字符串替换每个匹配项。
var exedOut = someDigits.replaceAll(numbers, 'XX');
assert(exedOut == 'llamas live XX to XX years');


// 检查 reg exp 在字符串中是否有匹配项。
assert(numbers.hasMatch(someDigits));

// 检查 reg exp 在字符串中是否有匹配项。
for (final match in numbers.allMatches(someDigits)) {
  print(match.group(0)); // 15, then 20
}

}
