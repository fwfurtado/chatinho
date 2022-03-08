import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String avatar;
  final String firstName;
  final String lastName;

  User({
    required this.id,
    required this.avatar,
    required this.firstName,
    required this.lastName,
  });

  @override
  List<Object?> get props => [id];
}
