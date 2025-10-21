// هنا هتلاقي الاعتمادية صغيرة علشان car بيعتمد علي engine

void main() {
  final Engine engine = Engine();
  final Car car = Car(engine);
  car.startCar();
}

class Engine {
  void start() {
    print('Engine started');
  }
}

class Car {
  final Engine engine;
  Car(this.engine);
  void startCar() {
    engine.start();
  }
}
