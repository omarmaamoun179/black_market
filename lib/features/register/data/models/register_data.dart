class RegisterData {
  String name;
  String email;
  String password;
  String passwordConfirmation;
  String? phone;

  RegisterData(
      {required this.name,
      required this.email,
      required this.password,
      required this.passwordConfirmation,
      this.phone});
}
