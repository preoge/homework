import 'dart:html';

void main() async {
  // 从服务器获取数据
  // String url;
  // String pageHtml = await HttpRequest.getString(url);
  // // 处理 pageHtml 的逻辑...

  // try {
  //   var data = await HttpRequest.getString(jsonUri);
  //   // 处理 data 的逻辑...
  // } catch (e) {
  //   // 处理异常...
  // }

  // 使用完整的 HttpRequest API 获取数据
  HttpRequest req = await HttpRequest.request(
    'https://preoge-mydoct-pbrchj2ghd1.ws-us97.gitpod.io/',
    method: 'HEAD',
  );
  if (req.status == 200) {
    // 成功访问 URL 的逻辑...
  }
  // ···

  // 向服务器发送数据
  String encodeMap(Map<String, String> data) => data.entries
      .map((e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');

  const data = {'dart': 'fun', 'angular': 'productive'};

  var request = HttpRequest();
  request
    ..open('POST',' https://preoge-mydoct-pbrchj2ghd1.ws-us97.gitpod.io/')
    ..setRequestHeader(
      'Content-type',
      'application/x-www-form-urlencoded',
    )
    ..send(encodeMap(data));

  await request.onLoadEnd.first;

  if (request.status == 200) {
    // 成功访问 URL 的逻辑...
  }
  // ···
}
