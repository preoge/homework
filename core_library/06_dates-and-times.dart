//DateTime 对象代表某个时刻，时区可以是 UTC 或者本地时区。
//DateTime 对象可以通过若干构造函数和方法创建：

void main() {
  var now = DateTime.now();
  var y2k = DateTime(2000); //2000.1.1
  y2k = DateTime(200, 1, 2);
  y2k = DateTime.utc(2000); //2000.1.1 utc
  //utc即协调世界时是以原子时秒长为基础，在时刻上尽量接近于世界时的一种时间计量系统
  y2k = DateTime.fromMicrosecondsSinceEpoch(1,
      isUtc: true); //frome 1970-01-01T00:00:00Z add 0.000001second

  y2k = DateTime.parse('2000-01-01T00:00:00Z');
  var sameTimeLastYear = now.copyWith(year: now.year - 1);
  print(sameTimeLastYear);
  /*Example:
     final now = DateTime.now();
     final sameTimeOnMoonLandingDay =
     now.copyWith(year: 1969, month: 07, day: 20); */
  //日期中 millisecondsSinceEpoch 属性返回自 “Unix 纪元（January 1, 1970, UTC）”以来的毫秒数：
  y2k = DateTime.utc(2000);
  assert(y2k.millisecondsSinceEpoch == 946684800000);
  var unixEpoch = DateTime.utc(1970);
  assert(unixEpoch.microsecondsSinceEpoch == 0);

  y2k = DateTime.utc(2000);

  var y2001 = y2k.add(const Duration(days: 366));
  assert(y2001.year == 2001);
  //由于时钟转换（例如，夏令时）的原因，使用 Duration 对 DateTime 按天移动可能会有问题。
  //如果要按照天数来位移时间，请使用 UTC 日期。
  var december2000 = y2001.subtract(const Duration(days: 30)); //减去时间
  assert(december2000.year == 2000);
  assert(december2000.month == 12);

  var duration = y2001.difference(y2k); //2001-1-1与2000-1-1之间的时间差
  assert(duration.inDays == 366); //判断 一个时间内有多少天
}
