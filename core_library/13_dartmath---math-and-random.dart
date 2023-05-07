import 'dart:math';//Math 库提供基本的三角函数
void main(){
  

  //P1  trigonometry 三角函数  
  //这些函数参数单位是弧度，不是角度
  // Cosine
assert(cos(pi) == -1.0);

// Sine
var degrees = 30;
var radians = degrees * (pi / 180);
// radians is now 0.52359.
var sinOf30degrees = sin(radians);
// sin 30° = 0.5
assert((sinOf30degrees - 0.5).abs() < 0.01);


//P2 最大值最小值

assert(max(1, 1000) == 1000);
assert(min(1, -1000) == -1000);

//P3 数学常数
// See the Math library for additional constants.
print(e); // 2.718281828459045
print(pi); // 3.141592653589793
print(sqrt2); // 1.4142135623730951

//P4 随机数 
//使用 Random 类产生随机数。可以为 Random 构造函数提供一个可选的种子参数。

var random = Random();
random.nextDouble(); // Between 0.0 and 1.0: [0, 1)
random.nextInt(10); // Between 0 and 9.
//也可以产生随机布尔值序列：

random.nextBool(); // true or false
}