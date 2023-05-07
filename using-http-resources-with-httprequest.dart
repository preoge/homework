//从服务器获取数据
//HttpRequest 静态方法 getString ()是从 Web 服务器获取数据的一种简单方法。在 getString ()调用中使用 wait 来确保在继续执行之前拥有数据。
void main() async {
  String pageHtml = await HttpRequest.getString(url);
  // Do something with pageHtml...
}
//使用 try-catch 指定错误处理程序:
try {
  var data = await HttpRequest.getString(jsonUri);
  // Process data...
} catch (e) {
  // Handle exception...
}

//如果需要访问 HttpRequest，而不仅仅是它检索的文本数据，那么可以使用 request ()静态方法而不是 getString ()。下面是一个读取 XML 数据的例子:
void main() async {
  HttpRequest req = await HttpRequest.request(
    url,
    method: 'HEAD',
  );
  if (req.status == 200) {
    // Successful URL access...
  }
  // ···
}

//您还可以使用完整的 API 来处理更有趣的情况。
//使用 HttpRequest 完整 API 的一般流程如下:
//创建 HttpRequest 对象。
//用 GET 或 POST 打开 URL。
//附加事件处理程序。
//发送请求
//例如:
var request = HttpRequest();
request
  ..open('POST', url)
  ..onLoadEnd.listen((e) => requestComplete(request))
  ..send(encodedData);

  //向服务器发送数据

//HttpRequest 可以使用 HTTP 方法 POST 将数据发送到服务器。
//例如，您可能希望将数据动态提交给表单处理程序。将 JSON 数据发送到 RESTful Web 服务是另一个常见的例子。
//向表单处理程序提交数据需要提供名称-值对作为 URI 编码的字符串。(有关 URI 类的信息在 Dart Library Tour 的 URI 部分。)
//如果希望将数据发送到表单处理程序，还必须将 Content-type 头设置为 application/x-www-form-urlencode。
String encodeMap(Map<String, String> data) => data.entries
    .map((e) =>
        '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
    .join('&');

void main() async {
  const data = {'dart': 'fun', 'angular': 'productive'};

  var request = HttpRequest();
  request
    ..open('POST', url)
    ..setRequestHeader(
      'Content-type',
      'application/x-www-form-urlencoded',
    )
    ..send(encodeMap(data));

  await request.onLoadEnd.first;

  if (request.status == 200) {
    // Successful URL access...
  }
  // ···
}