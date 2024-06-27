import 'package:recape_sp_front/app/shared/domain/entities/user_entity.dart';
import 'package:recape_sp_front/app/shared/domain/enums/role_enum.dart';

class UserAdapter {
  static List<UserEntity> fromJsonList(List<dynamic> json) {
    return json.map((e) => fromJson(e)).toList();
  }

  static UserEntity fromJson(Map<String, dynamic> json) {
    return UserEntity(
      userId: json['user_id'],
      name: json['name'],
      email: json['email'],
      enabled: json['enabled'],
      role: json['role_recape'] == null
          ? null
          : RoleEnum.values.firstWhere((e) => e.name == json['role_recape']),
    );
  }

  static Map<String, dynamic> toJson(UserEntity user) {
    return {
      'userId': user.userId,
      'name': user.name,
      'email': user.email,
      'enabled': user.enabled,
      'role_recape': user.role?.name,
    };
  }
}
