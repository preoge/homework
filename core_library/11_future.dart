//在 Dart 库中随处可见 Future 对象，通常异步函数返回的对象就是一个 Future。
//当一个 future 完成执行后，future 中的值就已经可以使用了。

import 'dart:';


//在直接使用 Future API 前，首先应该考虑 await 来替代
void runUsingFuture() {
  // ...
  findEntryPoint().then((entryPoint) {
    return runExecutable(entryPoint, args);
  }).then(flushThenExit);
}
//通过 await 表达式实现等价的代码
Future<void> runUsingAsyncAwait() async {
  // ...
  var entryPoint = await findEntryPoint();
  var exitCode = await runExecutable(entryPoint, args);
  await flushThenExit(exitCode);
}


void main(){
var uri = 'https://example.org/api?foo=some message';
HttpRequest.getString(url).then((String result) {
  print(result);
});

/*Future的基本用法
当 future 执行完成后，then() 中的代码会被执行。 then() 中的代码会在 future 完成后被执行。
例如，HttpRequest.getString() 返回一个 future 对象，因为 HTTP 请求可能需要一段时间。
当 Future 完成并且保证字符串值有效后，使用 then() 来执行你需要的代码：
*/
HttpRequest.getString(url).then((String result) {
  print(result);
});

//async 函数能够捕获来自 Future 的异常
var entryPoint = await findEntryPoint();
try {
  var exitCode = await runExecutable(entryPoint, args);
  await flushThenExit(exitCode);
} catch (e) {
  // Handle the error...
}

}