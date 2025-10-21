// هنا هتلاقي الاعتمادية كبية علشان car بيعتمد علي engine
void main() {
  final Car car = Car();
  car.startCar();
}

class Engine {
  void start() {
    print('Engine started');
  }
}

class Car {
  Engine engine = Engine();
  void startCar() {
    engine.start();
  }
}
