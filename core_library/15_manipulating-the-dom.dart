import 'dart:html';

void main() {
  // 通过ID查找元素
  Element? idElement = querySelector('#an-id');

  // 通过类名查找元素
  Element? classElement = querySelector('.a-class');

  // 通过标签名查找所有元素
  List<Element> divElements = querySelectorAll('div');

  // 查找所有文本输入框
  List<Element> textInputElements = querySelectorAll('input[type="text"]');

  // 查找具有CSS类名的元素
  List<Element> specialParagraphElements = querySelectorAll('#id p.class');

  // 更改元素属性
  var anchor = querySelector('#example') as AnchorElement;
  anchor.href = 'https://dart.dev';

  // 设置元素的隐藏属性
  const osList = ['macos', 'windows', 'linux'];
  final userOs = determineUserOs();

  for (final os in osList) {
    bool shouldShow = (os == userOs);

    for (final elem in querySelectorAll('.$os')) {
      elem.hidden = !shouldShow;
    }
  }

  // 设置元素的自定义属性
  var elem = querySelector('#example2')!;
  elem.attributes['someAttribute'] = 'someValue';

  // 创建元素
  var pElem = ParagraphElement();
  pElem.text = 'Creating is easy!';

  var pElem2 = Element.html('<p>Creating <em>is</em> easy!</p>');

  // 将新创建的元素附加到文档中
  document.body!.children.add(pElem2);

  // 添加、替换和删除节点
  querySelector('#inputs')!.nodes.add(pElem);

  querySelector('#status')!.replaceWith(pElem);

  querySelector('#expendable')?.remove();

  // 操作CSS样式
  var elem2 = querySelector('#message')!;
  elem2.classes.add('warning');

  // var message = DivElement()
  //   ..id = 'message2'
  //   ..text = 'Please subscribe to the Dart mailing list.'
  //   ..style
  //     ..fontWeight = 'bold'
  //     ..fontSize = '3em';

  // 处理事件
  querySelector('#submitInfo')!.onClick.listen((e) {
    submitData();
  });

  document.body!.onClick.listen((e) {
    final clickedElem = e.target;
    // ...
  });
}

void submitData() {
  // 处理按钮点击事件的逻辑
}

String determineUserOs() {
  // 确定用户操作系统的逻辑
  return 'macos';
}
