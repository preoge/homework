//

class Line implements Comparable<Line> {
  final int length;
  const Line(this.length);
  @override
  //元数据：主要是描述数据属性（property）的信息，用来支持如指示存储位置、历史数据、资源查找、文件记录等功能。
  //1、@deprecated被弃用的.含义：若某类或某方法加上该注解之后，表示此方法或类不再建议使用，调用时也会出现删除线，但并不代表不能用，
  //2、@override 重写父类方法（利用元数据override重写父类方法）3、@proxy 代理4、@required 来标记一个参数，表示这个参数必须要传值。*/

  int compareTo(Line other) => length - other.length;
}

class Person {
  //在 Dart 中每个对象会默认提供一个整数的哈希值，因此在 map 中可以作为 key 来使用，重写 hashCode 的 getter 方法来生成自定义哈希值。
  //如果重写 hashCode 的 getter 方法，那么可能还需要重写 == 运算符。
  //（通过 == ）对象必须拥有相同的哈希值。哈希值并不要求是唯一的，但是应该具有良好的分布形态。
  final String firstName, lastName;
  Person(this.firstName, this.lastName);
  @override
  int get hashCode => Object.hash(firstName, lastName);
  @override
  bool operator ==(Object other) {
    return other is Person &&
        other.firstName == firstName &&
        other.lastName == lastName;
  }
}
//Iterable 和 Iterator 类支持 for-in 循环。当创建一个类的时候，继承或者实现 Iterable，
//可以为该类提供用于 for-in 循环的 Iterators。实现 Iterator 来定义实际的遍历操作。
//如果你在 for-in 循环里要创建一个可以提供 Iterator 的类，如果可以，请选择 extend 或者 implement Iterable 的方式。 
//Implement Iterator 来定义一个实际的迭代能力。

/*class Process{

}
class ProcessIterator implements Iterator<Process>{
  @override
  Process get current => ();
}*/

void main() {
  var short = const Line(1);
  var long = const Line(100);
  assert(short.compareTo(long) < 0);

  var p1 = Person('Bob', 'Smith');
  var p2 = Person('Bob', 'Smith');
  var p3 = 'not a person';
  assert(p1.hashCode == p2.hashCode);
  assert(p1 == p2);
  assert(p1 != p3);
}
