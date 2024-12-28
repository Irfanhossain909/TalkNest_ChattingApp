class UserModel {
   String? email;
   String? phone;
   String? password;
   String? profilePicture;
   String? name;
   String? dateOfBirth;

  UserModel({
    this.email,
    this.phone,
    this.password,
    this.profilePicture,
    this.name,
    this.dateOfBirth,
  });

  Map<String, dynamic> toRegister() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
      'date_of_birth': dateOfBirth,
      'profile_picture': profilePicture,
    };
  }Map<String, dynamic> toLogin() {
    return {
      'email': email,
      'password': password,
    };
  }


}

