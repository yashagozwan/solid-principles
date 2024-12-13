# Single Responsibility

## LSP: Liskov Substitution Principle

The behavior of a program should remain consistent and predictable when substituting objects of different classes

Bad Implementation

```dart

abstract class Vehicle {
  void refuel();
  void move();
}

class ElectricCar extends Vehicle {
  @override
  void move() {
    print('Moving...');
  }

  @override
  void refuel() {
    print('Charging the battery...');
  }
}

class PetrolCar extends Vehicle {
  @override
  void move() {
    print('Moving...');
  }

  @override
  void refuel() {
    print('Refilling the petrol...');
  }
}

void serviceVehicle(Vehicle vehicle) {
  vehicle.refuel();
  // some more servicing activities
}

```

Good Implementation

```dart
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
```

## ISP: Interface Segregation Principle

Bad Implementation

```dart
abstract interface class SmartDevice {
  void makeCall();
  void sendEmail();
  void browseInternet();
  void takePicture();
}

class Smartphone implements SmartDevice {
  @override
  void browseInternet() {
    print('Browsing the Internet..');
  }

  @override
  void makeCall() {
    print('Making a call...');
  }

  @override
  void sendEmail() {
    print('Sending an email...');
  }

  @override
  void takePicture() {
    print('Taking a picture');
  }
}

class SmartWatch extends SmartDevice {
  @override
  void browseInternet() {
    throw UnimplementedError();
  }

  @override
  void makeCall() {
    print('Making a call...');
  }

  @override
  void sendEmail() {
    throw UnimplementedError();
  }

  @override
  void takePicture() {
    throw UnimplementedError();
  }
}
```

Good Implementation

```dart
abstract interface class Phone {
  void makeCall();
}

abstract interface class EmailDevice {
  void sendEmail();
}

abstract interface class WebBrowser {
  void browserInternet();
}

abstract interface class Camera {
  void takePicture();
}

class SmartWatch implements Phone {
  @override
  void makeCall() {
    print('Making a call...');
  }
}

class Smartphone implements Phone, EmailDevice, WebBrowser, Camera {
  @override
  void browserInternet() {
    print('browser');
  }

  @override
  void makeCall() {
    print('call');
  }

  @override
  void sendEmail() {
    print('email');
  }

  @override
  void takePicture() {
    print('picture');
  }
}
```

## DIP: Dependency Inversion Principle

Bad Implementation

```dart
class User {
  String name;

  User(this.name);
}

class MySQLDatabase {
  void saveUser(User user) {
    print('Saving ${user.name} to MySQL database...');
  }
}

class UserService {
  MySQLDatabase database;

  UserService(this.database);

  void saveUser(User user) => database.saveUser(user);
}
```

Good Implementation

```dart
class User {
  String name;

  User(this.name);
}

abstract interface class Database {
  void saveUser(User user);
}

class MySQLDatabase implements Database {
  @override
  void saveUser(User user) {
    print('saving ${user.name} to MySQL database...');
  }
}

class PostgreSQLDatabase implements Database {
  @override
  void saveUser(User user) {
    print('saving ${user.name} to PostgreSQL database...');
  }
}

class UserService {
  Database database;

  UserService(this.database);

  void saveUser(User user) {
    database.saveUser(user);
  }
}
```
