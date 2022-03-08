import 'package:chatinho/adapters/user.dart' as user_adapter;
import 'package:chatinho/domain/user.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final eu = User(
  id: '34htns',
  firstName: 'Eu',
  lastName: 'Mesmo',
  avatar: 'assets/images/avatars/eu_mesmo.jpg',
);

final currentUserProvider = Provider(
  (_) => eu,
);

final currentUIUser = Provider((ref) {
  final user = ref.read(currentUserProvider);

  return user_adapter.fromDomain(user);
});
