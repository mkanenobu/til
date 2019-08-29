class Car {
  final String maker;
  final String model;
  final int manufactureYear;
  String color;
  int carAge;
  Car(String this.maker, String this.model, int this.manufactureYear,
      String this.color);

  // setter
  void set age(int currentYear) => carAge = currentYear - manufactureYear;

  void set repaint(String color) => this.color = color;

  // getter
  int get age => DateTime.now().year - manufactureYear;

  Map<String, dynamic> get map {
    return {
      'maker': maker,
      'model': model,
      'manufactureYear': manufactureYear,
      'color': color,
      'age': carAge,
    };
  }
}

var carolla = Car('TOYOTA', 'Carolla', 2005, 'White');

main() {
  // setter
  carolla.age = 2019;
  print(carolla.carAge);
  // getter
  print(carolla.age);
  var carollaInformation = carolla.map;
  print(carollaInformation['maker']);

  // setter short hand
  var leaf = Car('NISSAN', 'LEAF', 1999, 'red')
    ..age = 2019
    ..repaint = 'white';
  print(leaf.map['age']);
  print(leaf.map['maker']);
  print(leaf.map['color']);
}
