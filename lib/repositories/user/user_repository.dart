import 'package:chatinho/domain/user.dart';

abstract class UserRepository {
  Future<User?> getUserById(String id);
  User get currentUser;
}
