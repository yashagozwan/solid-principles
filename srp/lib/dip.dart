// class User {
//   String name;

//   User(this.name);
// }

// class MySQLDatabase {
//   void saveUser(User user) {
//     print('Saving ${user.name} to MySQL database...');
//   }
// }

// class UserService {
//   MySQLDatabase database;

//   UserService(this.database);

//   void saveUser(User user) => database.saveUser(user);
// }

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
