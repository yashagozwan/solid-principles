// LSP: Liskov Substitution Principle
// The behavior of a program should remain consistent and predictable when substituting objects of different classes

// abstract class Vehicle {
//   void refuel();
//   void move();
// }

// class ElectricCar extends Vehicle {
//   @override
//   void move() {
//     print('Moving...');
//   }

//   @override
//   void refuel() {
//     print('Charging the battery...');
//   }
// }

// class PetrolCar extends Vehicle {
//   @override
//   void move() {
//     print('Moving...');
//   }

//   @override
//   void refuel() {
//     print('Refilling the petrol...');
//   }
// }

// void serviceVehicle(Vehicle vehicle) {
//   vehicle.refuel();
//   // some more servicing activities
// }

abstract class Vehicle {
  void move();
}

abstract class FuelVehicle extends Vehicle {
  void refuel();
}

abstract class ElectricVehicle extends Vehicle {
  void charge();
}

class ElectricCar extends ElectricVehicle {
  @override
  void charge() {
    print('Charging the battery...');
  }

  @override
  void move() {
    print('Moving...');
  }
}

class PetrolCar extends FuelVehicle {
  @override
  void move() {
    print('Moving...');
  }

  @override
  void refuel() {
    print('Refilling the petrol...');
  }
}

void serviceFuelVehicle(FuelVehicle vehicle) {
  vehicle.refuel();
}

void serviceElectricVehicle(ElectricVehicle vehicle) {
  vehicle.charge();
}
