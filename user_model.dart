// ignore_for_file: public_member_api_docs, sort_constructors_first

class UserModel {
  final String uid;
  String name;
  String password;
  String number;
  String email;
  UserModel( {
    required this.uid,
    required this.name,
    required this.password,
    required this.number,
    required this.email,
  });



  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid':uid,
      'name': name,
      'password': password,
      'number': number,
      'email': email,
    };
  }



 

 
}
