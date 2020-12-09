class _Programmer{
  code(){
    print('I am a programmer, i like coding.');
  }
}

class _Singer{
  singing(){
    print('I am a singer, i like singing.');
  }
}

//既爱编码，也爱唱歌
class Mixin with _Programmer, _Singer{

}

// 定义_Test类,要求只有实现了_Programmer的类型才能被混入
mixin _Test on _Programmer{
  say(){
    print('this use mixin on');
  }
}

class A extends _Programmer with _Test{
  String country;
  String name;
  // 普通构造函数和在构造函数体前,初始化成员变量
  A(this.country): assert(country != null), name = "xiaoming";

  // 命名构造函数和在构造函数体前,初始化成员变量
  A.origin(): name = "xiaohong"{
    country = "aaaaa";
  }

  sayCountry(){
    print(this.country);
  }
}