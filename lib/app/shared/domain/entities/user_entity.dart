import '../enums/role_enum.dart';

class UserEntity {
  final String userId;
  final String name;
  final String email;
  final RoleEnum? role;
  final bool enabled;

  UserEntity({
    required this.userId,
    required this.name,
    required this.role,
    required this.email,
    required this.enabled,
  });
}
