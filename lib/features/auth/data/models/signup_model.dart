class SignupModel {
  final int id;

  SignupModel({required this.id});

  factory SignupModel.fromJson(Map<String, dynamic> json) {
    return SignupModel(id: json['id']);
  }
}