import 'package:floor_annotation/floor_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@Entity(tableName: "users", withoutRowid: true)
@JsonSerializable(anyMap: true)
class User {
  @PrimaryKey(autoGenerate: false)
  final String? uuid;
  final String? email;
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final DateTime? birthday;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? role;
  final String? phone;

  User({this.updatedAt, 
      this.uuid,
      this.email,
      this.firstName,
      this.middleName,
      this.lastName,
      this.birthday,
      this.createdAt,
      this.role,
      this.phone});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uuid: map['uuid'],
      email: map['email'],
      firstName: map['firstName'],
      middleName: map['middleName'],
      lastName: map['lastName'],
      birthday: DateTime.fromMillisecondsSinceEpoch(map['birthday']),
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['created_at']),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updated_at']),
      role: map['role'],
      phone: map['phone'],
    );
  }

  @override
  int get hashCode {
    return uuid.hashCode ^
        email.hashCode ^
        firstName.hashCode ^
        middleName.hashCode ^
        createdAt.hashCode^
        updatedAt.hashCode^
        lastName.hashCode ^
        birthday.hashCode ^
        role.hashCode ^
        phone.hashCode;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is User &&
        other.uuid == uuid &&
        other.email == email &&
        other.firstName == firstName &&
        other.middleName == middleName &&
        other.lastName == lastName &&
        other.birthday == birthday &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.role == role &&
        other.phone == phone;
  }

  User copyWith({
    String? uuid,
    String? email,
    String? firstName,
    String? middleName,
    String? lastName,
    DateTime? birthday,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? role,
    String? phone,
  }) {
    return User(
      uuid: uuid ?? this.uuid,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      middleName: middleName ?? this.middleName,
      lastName: lastName ?? this.lastName,
      birthday: birthday ?? this.birthday,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      role: role ?? this.role,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toJson() => _$UserToJson(this);

  Map<String, dynamic> toMap() {
    return {
      'uuid': uuid,
      'email': email,
      'firstName': firstName,
      'middleName': middleName,
      'lastName': lastName,
      'birthday': birthday?.millisecondsSinceEpoch,
      'create_at': createdAt?.millisecondsSinceEpoch,
      'updated_at': updatedAt?.millisecondsSinceEpoch,
      'role': role,
      'phone': phone,
    };
  }

  @override
  String toString() {
    return 'User(uuid: $uuid, email: $email, firstName: $firstName, middleName: $middleName, lastName: $lastName, birthday: $birthday, role: $role, phone: $phone, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}
