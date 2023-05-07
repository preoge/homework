import 'dart:html';
import 'dart:io';
import 'dart:convert';

void main() async {
  //读txt
  var config = File('config.txt');

  // Put the whole file in a single string.
  var stringContents = await config.readAsString();
  print('The file is ${stringContents.length} characters long.');

  // Put each line of the file into its own string.
  var lines = await config.readAsLines();
  print('The file is ${lines.length} lines long.');
//以二进制文件读取文件

  var contents = await config.readAsBytes();
  print('The file is ${contents.length} bytes long.');
//错误处理,为了捕获错误，使它们不会导致未捕获的异常，您可以在 Future 上注册 catchError 处理程序，或者(在异步函数中)使用 try-catch:
  void main() async {
  var config = File('config.txt');
  try {
    var contents = await config.readAsString();
    print(contents);
  } catch (e) {
    print(e);
  }
}

//使用 Stream 读取文件，一次读取一点。您可以使用 StreamAPI，也可以等待，这是 Dart 的异步支持的一部分。
 var config = File('config.txt');
  Stream<List<int>> inputStream = config.openRead();

  var lines = utf8.decoder.bind(inputStream).transform(const LineSplitter());
  try {
    await for (final line in lines) {
      print('Got ${line.length} characters from stream');
    }
    print('file is now closed');
  } catch (e) {
    print(e);
  }


//您可以使用 IOSink 将数据写入文件。使用 File openWrite ()方法获得一个可以写入的 IOSink。默认模式 FileMode.write 完全覆盖文件中的现有数据。
  var logFile = File('log.txt');
var sink = logFile.openWrite();
sink.write('FILE ACCESSED ${DateTime.now()}\n');
await sink.flush();
await sink.close();

//查找一个目录的所有文件和子目录是一个异步操作。List ()方法返回当遇到文件或目录时发出对象的 Stream。
var dir = Directory('tmp');

  try {
    var dirList = dir.list();
    await for (final FileSystemEntity f in dirList) {
      if (f is File) {
        print('Found file ${f.path}');
      } else if (f is Directory) {
        print('Found dir ${f.path}');
      }
    }
  } catch (e) {
    print(e.toString());
  }
}