void foo() {}
class A {
  static void bar() {} // static method
  void baz() {} // instance method
}

void main() {
  var x;

  // comparing top-level functions
  x = foo;
  assert(foo == x);

  // comparing static methods
  x = A.bar;
  assert(A.bar == x);

  // comparing instance methods
  var v = A(); // Instance #1 of A
  var w = A(); // Instance #2 of A
  var y = w;
  x = w.baz;

  // these closures refer to the same instance (#2)
  // so they are equal
  assert(y.baz == x);

  // these closures refer to different instances
  // so they are unequal
  assert(v.baz != w.baz);
}
