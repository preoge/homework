void main(List<String> args) {
  searching();
  print('ok');
}

void searching() {
  //assert 就是类似于exit（1/0），1则没问题，0则报错终止程序
  //.contains如下，是否包含
  assert('never inheg nfurfu fjig ifjef'.contains('fjig'));
  //num.parse会创建一个整数或者是浮点型，自动的
  assert(num.parse('23.32') is double);
  //自定义转换
  assert(int.parse('42') == 42);
  assert(int.parse('0x42') == 66);
  assert(double.parse('0.50') == 0.5);
  //如下
  assert(42.toString()=='42');
  assert(123.234.toString()=='123.234');
  //保留位数为2
  assert(123.234.toStringAsFixed(2)=='123.23');
  //确立有效数字位数为2
  assert(123.234.toStringAsPrecision(2)=='1.2e+2');
}
