import 'dart:html';

void runUsingFuture() {
  var flushThenExit;
  findEntryPoint().then((entryPoint) {
    var args;
    return runExecutable(entryPoint, args);
  }).then(flushThenExit);
}

Future<void> runExecutable(entryPoint, args) {
  // 执行一些操作...
  return Future.value(); // 返回一个完成的 Future 对象
}

Future<dynamic> findEntryPoint() {
  // 执行一些操作...
  return Future.value(); // 返回一个完成的 Future 对象
}

Future<void> runUsingAsyncAwait() async {
  var entryPoint = await findEntryPoint();
  await flushThenExit(0);
}

Future<void> flushThenExit(dynamic exitCode) {
  // 执行一些操作...
  return Future.value(); // 返回一个完成的 Future 对象
}

Future<void> main() async {
  var url = 'https://example.org/api?foo=some message';
  await HttpRequest.getString(url).then((String result) {
    print(result);
  });

  // async 函数能够捕获来自 Future 的异常
  var entryPoint = await findEntryPoint();
  try {
    await flushThenExit(0);
  } catch (e) {
    // 处理错误...
  }
}
