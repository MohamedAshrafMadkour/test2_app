import 'package:equatable/equatable.dart';

class RegisterModel extends Equatable {
  final String? name;
  final String? email;
  final String? phone;
  final String? nationalId;
  final String? gender;
  final String? image;
  final String? password;

  const RegisterModel({
    this.name,
    this.email,
    this.phone,
    this.nationalId,
    this.gender,
    this.image,
    this.password,
  });

  // factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
  //   image: json['image'] as String?,
  //   name: json['name'] as String?,
  //   email: json['email'] as String?,
  //   phone: json['phone'] as String?,
  //   nationalId: json['nationalId'] as String?,
  //   gender: json['gender'] as String?,
  // );

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'phone': phone,
    'nationalId': nationalId,
    'gender': gender,
    'profileImage': image,
    'password': password,
  };

  @override
  List<Object?> get props {
    return [name, email, phone, nationalId, gender, image];
  }
}
