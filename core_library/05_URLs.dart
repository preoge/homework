//在使用 URI（可能你会称它为 URLs）时，Uri 类 提供对字符串的编解码操作。
//这些函数用来处理 URI 特有的字符，例如 ＆ 和 = 。
//Uri 类还可以解析和处理 URI—host，port，scheme等组件。

void main() {
  var uri = 'https://example.org/api?foo=some message';
  //使用 encodeFull() 和 decodeFull() 方法，对 URI 中
  //除了特殊字符（例如 /， :， &， #）以外的字符进行编解码，这些方法非常适合编解码完整合法的 URI，
  //并保留 URI 中的特殊字符
  var encoded = Uri.encodeFull(uri);
  assert(encoded == 'https://example.org/api?foo=some%20message');
  //注意上面代码只编码了 some 和 message 之间的空格。
  var decoded = Uri.decodeFull(encoded);
  assert(uri == decoded);

  var encoded2 = Uri.encodeComponent(uri);
  //编码了所有的字符
  assert(encoded2 == 'https%3A%2F%2Fexample.org%2Fapi%3Ffoo%3Dsome%20message');
  var decoded2 = Uri.decodeComponent(encoded2);

  assert(uri == decoded2);
  //使用 Uri 对象的字段（例如 path），
  //来获取一个 Uri 对象或者 URI 字符串的一部分。使用 parse() 静态方法，可以使用字符串创建 Uri 对象。
  var uri2 = Uri.parse('https://example.org:8080/foo/bar#frag');
  assert(uri2.scheme == 'https');
  assert(uri2.host == 'example.org');
  assert(uri2.path == '/foo/bar');
  assert(uri2.fragment == 'frag');
  assert(uri2.origin == 'https://example.org:8080');

  //构建 URI 使用 Uri() 构造函数，可以将各组件部分构建成 URI 。
  var uri3 = Uri(
      scheme: 'https',
      host: 'example.org',
      path: '/foo/bar',
      fragment: 'frag',
      queryParameters: {'lang': 'dart'});
  assert(uri3.toString() == 'https://example.org/foo/bar?lang=dart#frag');

  //fragment不需要特别声明
  var httpUri = Uri.http('example.org', '/foo/bar', {'lang': 'dart'});
  var httpsUri = Uri.https('example.org', '/foo/bar', {'lang': 'dart'});
  assert(httpUri.toString() == 'http://example.org/foo/bar?lang=dart');
  assert(httpsUri.toString() == 'https://example.org/foo/bar?lang=dart');
}
