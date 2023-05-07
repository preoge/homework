// 通过 id (an-id)查找元素。
   Element idElement = querySelector('#an-id')!;

/Find an element by class (a-class).
      Element classElement = querySelector('.a-class')!;

// 通过标记(< div >)查找所有元素。
        List<Element> divElements = querySelectorAll('div');


// 查找所有文本输入
List<Element> textInputElements = querySelectorAll(
 'input[type="text"]',
);


//查找具有 CSS 类“ class”的所有元素
//ID.
  List<Element> specialParagraphElements = querySelectorAll('#id p.class');

//可以使用属性更改元素的状态。节点及其子类型 Element 定义所有元素具有的属性。例如，所有元素都具有可用于设置状态的类、隐藏、 id、样式和标题属性。Element 的子类定义其他属性，例如 AnchorElement 的 href 属性。
//考虑一下在 HTML 中指定锚元素的例子:
<a id="example" href="/another/example">link text</a>

//这个 < a > 标记指定一个具有 href 属性的元素和一个包含字符串“ link text”的文本节点(可通过 text 属性访问)。要更改链接所指向的 URL，可以使用 AnchorElement 的 href 属性:
var anchor = querySelector('#example') as AnchorElement;
anchor.href = 'https://dart.dev';


//通常需要在多个元素上设置属性。例如，下面的代码设置具有“ mac”、“ win”或“ linux”类的所有元素的隐藏属性
//。将隐藏属性设置为 true 与将 display: none 添加到 CSS 具有相同的效果。
<p>
  <span class="linux">Words for Linux</span>
  <span class="macos">Words for Mac</span>
  <span class="windows">Words for Windows</span>
</p>
// In Dart:
const osList = ['macos', 'windows', 'linux'];
final userOs = determineUserOs();

// 对于每个可能的操作系统
for (final os in osList) {
  bool shouldShow = (os == userOs);

//查找所有具有 class = os 的元素
//os = = ‘ windows’，调用 querySelectorAll (’. windows’)
//查找具有类“ windows”的所有元素。
//请注意,’. $os’使用字符串插值。
  for (final elem in querySelectorAll('.$os')) {
    elem.hidden = !shouldShow; 
  }
}

//当正确的属性不可用或不方便时，可以使用 Element 的属性属性。
//这个属性是一个 Map < String，String > ，其中键是属性名。
//对于属性名称及其含义的列表,
//参见 MDN Attritribute 页面，下面是一个设置属性值的例子:
elem.attributes['someAttribute'] = 'someValue';


//创建元素
//您可以通过创建新元素并将它们附加到 DOM 来添加到现有的 HTML 页面。下面是一个创建段落(< p >)元素的例子:
var elem = ParagraphElement();
elem.text = 'Creating is easy!';

//您也可以通过解析 HTML 文本来创建一个元素。
var elem2 = Element.html(
  '<p>Creating <em>is</em> easy!</p>',
);


//通过为元素分配父元素，将新创建的元素附加到文档。

//可以向任何现有元素的子元素添加元素,

//body 是一个元素，可以从 children 属性访问它的子元素(作为 List < Element >)。
document.body!.children.add(elem2);

//添加、替换和删除节点
//回想一下，元素只是一种节点。您可以使用 Node 的节点属性找到一个节点的所有子节点，该属性返回 List < Node > 
//(与子节点相反，它省略了非 Element 节点)。有了这个列表之后，就可以使用通常的 List 方法和操作符来操作节点的子节点。
//若要将节点添加为其父节点的最后一个子节点，请使用 List add ()方法:
querySelector('#inputs')!.nodes.add(elem);

//要替换节点，请使用 Node replaceWith ()方法:
querySelector('#status')!.replaceWith(elem);

//若要删除节点，请使用 Node move ()方法:
querySelector('#expendable')?.remove();

//操作 CSS 样式
//CSS (层叠样式表)定义了 DOM 元素的表示样式。可以通过向元素附加 ID 和类属性来更改元素的外观。
//每个元素都有一个 class 字段，它是一个列表。只需在此集合中添加和删除字符串即可添加和删除 CSS 类。例如，下面的示例将警告类添加到元素中:
var elem = querySelector('#message')!;
elem.classes.add('warning');

//通过 ID 查找元素通常是非常有效的。可以使用 ID 属性动态设置元素 ID:
var message = DivElement();
message.id = 'message2';
message.text = 'Please subscribe to the Dart mailing list.';

//通过使用方法级联，您可以减少本例中的冗余文本:
var message = DivElement()
  ..id = 'message2'
  ..text = 'Please subscribe to the Dart mailing list.';

  //尽管使用 ID 和类将元素与一组样式关联是最佳实践，但有时您希望将特定样式直接附加到元素:
  message.style
  ..fontWeight = 'bold'
  ..fontSize = '3em';

  //处理事件
//若要响应外部事件，如单击、焦点更改和选择，请添加事件侦听器。您可以向页面上的任何元素添加事件侦听器。事件分发和传播是一个复杂的主题; 
//如果您是 Web 编程的新手，请研究详细信息。
//使用 element.onEvent.listen (function)添加事件处理程序，其中 Event 是事件名称，function 是事件处理程序。
//例如，如何处理按钮上的点击:
// Find a button by ID and add an event handler.
querySelector('#submitInfo')!.onClick.listen((e) {
  // When the button is clicked, it runs this code.
  submitData();
});

//事件可以在 DOM 树中向上和向下传播:
document.body!.onClick.listen((e) {
  final clickedElem = e.target;
  // ...
});
