import 'package:equatable/equatable.dart';

class ProfileModel extends Equatable {
	final String? name;
	final String? email;
	final String? phone;
	final String? nationalId;
	final String? gender;
	final String? profileImage;
	final String? token;

	const ProfileModel({
		this.name, 
		this.email, 
		this.phone, 
		this.nationalId, 
		this.gender, 
		this.profileImage, 
		this.token, 
	});

	factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
				name: json['name'] as String?,
				email: json['email'] as String?,
				phone: json['phone'] as String?,
				nationalId: json['nationalId'] as String?,
				gender: json['gender'] as String?,
				profileImage: json['profileImage'] as String?,
				token: json['token'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'name': name,
				'email': email,
				'phone': phone,
				'nationalId': nationalId,
				'gender': gender,
				'profileImage': profileImage,
				'token': token,
			};

	@override
	List<Object?> get props {
		return [
				name,
				email,
				phone,
				nationalId,
				gender,
				profileImage,
				token,
		];
	}
}
