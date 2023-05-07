//WebSocket 允许您的 Web 应用程序与服务器交互式地交换数据ーー不需要轮询。
//服务器创建 WebSocket 并侦听以 ws://ー开头的 URL 上的请求，例如，ws://127.0.0.1:1337/ws。通过 WebSocket 传输的数据可以是字符串或 blob。
//通常，数据是 JSON 格式的字符串。
//要在 Web 应用程序中使用 WebSocket，首先创建一个 WebSocket 对象，将 WebSocket URL 作为参数传递:
var ws = WebSocket('ws://echo.websocket.org');

//发送数据
//若要在 WebSocket 上发送字符串数据，请使用以下方法：send()
ws.send('Hello from Dart!');

//接收数据
//若要在 WebSocket 上接收数据，请为消息注册侦听器 事件：
ws.onMessage.listen((MessageEvent e) {
  print('Received message: ${e.data}');
});
//消息事件处理程序接收消息事件对象。 此对象的字段包含来自服务器的数据。data

//处理 WebSocket 事件
//你的应用可以处理以下 WebSocket 事件：打开、关闭、错误、 和（如前所示）消息。下面是一个方法示例 创建一个 WebSocket 对象并注册用于打开、关闭、 错误和消息事件：
void initWebSocket([int retrySeconds = 1]) {
  var reconnectScheduled = false;

  print('Connecting to websocket');

  void scheduleReconnect() {
    if (!reconnectScheduled) {
      Timer(Duration(seconds: retrySeconds),
          () => initWebSocket(retrySeconds * 2));
    }
    reconnectScheduled = true;
  }

  ws.onOpen.listen((e) {
    print('Connected');
    ws.send('Hello from Dart!');
  });

  ws.onClose.listen((e) {
    print('Websocket closed, retrying in $retrySeconds seconds');
    scheduleReconnect();
  });

  ws.onError.listen((e) {
    print('Error connecting to ws');
    scheduleReconnect();
  });

  ws.onMessage.listen((MessageEvent e) {
    print('Received message: ${e.data}');
  });
}