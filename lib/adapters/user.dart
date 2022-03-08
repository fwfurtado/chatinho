import 'package:chatinho/domain/user.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

types.User fromDomain(User user) {
  return types.User(
    id: user.id,
    firstName: user.firstName,
    lastName: user.lastName,
    imageUrl: user.avatar,
  );
}
