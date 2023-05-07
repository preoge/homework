//dart:convert 库（API reference）提供 JSON 和 UTF-8 转换器，以及创建其他转换器。 
//JSON 是一种用于表示结构化对象和集合的简单文本格式。 UTF-8 是一种常见的可变宽度编码，可以表示Unicode字符集中的每个字符。
//使用时，通过 import dart:convert 引入。

import 'dart:convert';
void main(){
//  在 JSON string.一定要用双引号("),
// 单引号不行('),
// 因为是JSON里的stringT， 而非 Dart.

//使用 jsonDecode() 解码 JSON 编码的字符串为 Dart 对象：
var jsonString = '''
  [
    {"score": 40},
    {"score": 80}
  ]
''';

var scores1 = jsonDecode(jsonString);
assert(scores1 is List);

var firstScore = scores1[0];
assert(firstScore is Map);
assert(firstScore['score1'] == 40);


//使用 jsonEncode() 编码 Dart 对象为 JSON 格式的字符串：
//只有 int， double， String， bool, null, List, 或者 Map 类型对象可以直接编码成 JSON。 List 和 Map 对象进行递归编码。

//不能直接编码的对象有两种方式对其编码。第一种方式是调用 jsonEncode() 时赋值第二个参数，这个参数是一个函数，
//该函数返回一个能够直接编码的对象第二种方式是省略第二个参数，着这种情况下编码器调用对象的 toJson() 方法。
var scores = [
  {'score': 40},
  {'score': 80},
  {'score': 100, 'overtime': true, 'special_guest': null}
];

var jsonText = jsonEncode(scores);
assert(jsonText ==
    '[{"score":40},{"score":80},'
        '{"score":100,"overtime":true,'
        '"special_guest":null}]');


//编解码 UTF-8 字符
//使用 utf8.decode() 解码 UTF8 编码的字符创为 Dart 字符串：

List<int> utf8Bytes = [
  0xc3, 0x8e, 0xc3, 0xb1, 0xc5, 0xa3, 0xc3, 0xa9,
  0x72, 0xc3, 0xb1, 0xc3, 0xa5, 0xc5, 0xa3, 0xc3,
  0xae, 0xc3, 0xb6, 0xc3, 0xb1, 0xc3, 0xa5, 0xc4,
  0xbc, 0xc3, 0xae, 0xc5, 0xbe, 0xc3, 0xa5, 0xc5,
  0xa3, 0xc3, 0xae, 0xe1, 0xbb, 0x9d, 0xc3, 0xb1
];

var funnyWord = utf8.decode(utf8Bytes);

assert(funnyWord == 'Îñţérñåţîöñåļîžåţîờñ');


//使用 utf8.encode() 将 Dart 字符串编码为一个 UTF8 编码的字节流：

List<int> encoded = utf8.encode('Îñţérñåţîöñåļîžåţîờñ');

assert(encoded.length == utf8Bytes.length);
for (int i = 0; i < encoded.length; i++) {
  assert(encoded[i] == utf8Bytes[i]);
}


// 将 UTF-8 字符串流转换为 Dart 字符串，为 Stream 的 transform() 方法上指定 utf8.decoder：
Stream list<int>
var lines = utf8.decoder.bind(inputStream).transform(const LineSplitter());
try {
  await for (final line in lines) {
    print('Got ${line.length} characters from stream');
  }
  print('file is now closed');
} catch (e) {
  print(e);
}

}