import 'package:chatinho/domain/user.dart';
import 'package:chatinho/repositories/user/user_repository.dart';

final _homer = User(
  id: '1s23tnh',
  firstName: 'Homer',
  lastName: 'Simpson',
  avatar: 'assets/images/avatars/homer.jpg',
);

final _dasNeves = User(
  id: '67nsth',
  firstName: 'João',
  lastName: 'Neves',
  avatar: 'assets/images/avatars/joao_das_neves.jpg',
);

final _darthVader = User(
  id: '90e87u',
  firstName: 'Darth',
  lastName: 'Vader',
  avatar: 'assets/images/avatars/darth_vader.jpg',
);

final _eu = User(
  id: '34htns',
  firstName: 'Eu',
  lastName: 'Mesmo',
  avatar: 'assets/images/avatars/eu_mesmo.jpg',
);

class InMemoryUserRepository implements UserRepository {
  final Map<String, User> _users = {
    _eu.id: _eu,
    _homer.id: _homer,
    _dasNeves.id: _dasNeves,
    _darthVader.id: _darthVader,
  };

  @override
  Future<User?> getUserById(String id) async {
    return _users[id];
  }

  @override
  User get currentUser => _eu;
}
