import 'package:flutter_ex/models/user.dart';
import 'package:flutter_ex/services/users_api_provider.dart';

class UsersRepository {
  UserProvider _usersProvider = UserProvider();

  Future<List<User>> getAllUsers() => _usersProvider.getUser();
}
