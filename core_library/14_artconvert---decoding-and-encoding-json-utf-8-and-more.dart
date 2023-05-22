import 'dart:convert';

Future<void> main() async {
  // 解码 JSON 编码的字符串为 Dart 对象
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
  assert(firstScore['score'] == 40); // 将 'score1' 修改为 'score'

  // 编码 Dart 对象为 JSON 格式的字符串
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

  // 解码 UTF8 编码的字符串为 Dart 字符串
  List<int> utf8Bytes = [
    0xc3, 0x8e, 0xc3, 0xb1, 0xc5, 0xa3, 0xc3, 0xa9,
    0x72, 0xc3, 0xb1, 0xc3, 0xa5, 0xc5, 0xa3, 0xc3,
    0xae, 0xc3, 0xb6, 0xc3, 0xb1, 0xc3, 0xa5, 0xc4,
    0xbc, 0xc3, 0xae, 0xc5, 0xbe, 0xc3, 0xa5, 0xc5,
    0xa3, 0xc3, 0xae, 0xe1, 0xbb, 0x9d, 0xc3, 0xb1
  ];

  var funnyWord = utf8.decode(utf8Bytes);

  assert(funnyWord == 'Îñţérñåţîöñåļîžåţîờñ');

  // 编码 Dart 字符串为 UTF8 编码的字节流
  List<int> encoded = utf8.encode('Îñţérñåţîöñåļîžåţîờñ');

  assert(encoded.length == utf8Bytes.length);
  for (int i = 0; i < encoded.length; i++) {
    assert(encoded[i] == utf8Bytes[i]);
  }

  // 将 UTF-8 字符串流转换为 Dart 字符串

  // Stream<List<int>> inputStream;
  // var lines = utf8.decoder.bind(inputStream).transform(const LineSplitter());
  // try {
  //   await for (final line in lines) {
  //     print('Got ${line.length} characters from stream');
  //   }
  //   print('file is now closed');
  // } catch (e) {
  //   print(e);
  // }


Future<void> fun02() async {
  var inputStream; // Input stream variable needs to be defined

  var lines = utf8.decoder.bind(inputStream).transform(const LineSplitter());
  try {
    await for (final line in lines) {
      print('Got ${line.length} characters from stream');
    }
    print('File is now closed');
  } catch (e) {
    print(e);
  }
}

void fun03() {
  List<int> encoded = utf8.encode('Îñţérñåţîöñåļîžåţîờñ');

  List<int> utf8Bytes = [
    195, 140, 195, 177, 197, 163, 195, 169, 197, 161, 195, 182, 195, 166,
    195, 175, 197, 157, 195, 169, 195, 184, 197, 177
  ];

  assert(encoded.length == utf8Bytes.length);
  for (int i = 0; i < encoded.length; i++) {
    assert(encoded[i] == utf8Bytes[i]);
  }
}

}
