// SRP: Single Responsibility Principle
// Each class should have a single responsibility

/// Bad Implementation
///```dart
///class User {
///  String name;
///  String email;
///
///  User(
///    this.name,
///    this.email,
///  );
///
///  void saveUserToDatabase() {}
///
///  void showWelcomeMessage() {
///    print('Welcome, $name!');
///  }
///}
///```
/// Good Implementation
class User {
  String name;
  String email;

  User(
    this.name,
    this.email,
  );
}

class UserRepository {
  void saveUserToDatabase(User user) {
    /// save user to database
  }
}

class UserView {
  void showWelcomeMessage(User user) {
    print('Welcome, ${user.name}!');
  }
}
