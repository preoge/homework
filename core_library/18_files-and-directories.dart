import 'dart:io';
import 'dart:convert';

void main() async {
  // 读取txt文件
  var config = File('config.txt');

  // 将整个文件读取为单个字符串
  var stringContents = await config.readAsString();
  print('The file is ${stringContents.length} characters long.');

  // 将每一行读取到单独的字符串中
  var lines = await config.readAsLines();
  print('The file is ${lines.length} lines long.');

  // 以二进制方式读取文件
  var contents = await config.readAsBytes();
  print('The file is ${contents.length} bytes long.');

  // 错误处理
  try {
    var contents = await config.readAsString();
    print(contents);
  } catch (e) {
    print(e);
  }

  // 使用 Stream 读取文件
  var inputStream = config.openRead();
  var linesStream = inputStream.transform(utf8.decoder).transform(LineSplitter());
  try {
    await for (final line in linesStream) {
      print('Got ${line.length} characters from stream');
    }
    print('File reading is complete');
  } catch (e) {
    print(e);
  }

  // 使用 IOSink 写入文件
  var logFile = File('log.txt');
  var sink = logFile.openWrite();
  sink.write('FILE ACCESSED ${DateTime.now()}\n');
  await sink.flush();
  await sink.close();

  // 查找目录的所有文件和子目录
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
