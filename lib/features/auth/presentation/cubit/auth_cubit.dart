import 'package:black_market/features/auth/data/models/email.dart';
import 'package:black_market/features/auth/data/models/forget_pass_model.dart';
import 'package:black_market/features/auth/data/models/update_pass/update_pass.dart';
import 'package:black_market/features/auth/data/models/update_pass_data.dart';
import 'package:black_market/features/auth/data/repositories/base_auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
    this.baseAuthRepo,
  ) : super(AuthInitial());
  BaseAuthRepo baseAuthRepo;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var otpController = TextEditingController();

  static AuthCubit get(context) => BlocProvider.of(context);
  Future<void> forgetPassword() async {
    emit(AuthLoading());
    EmailData email = EmailData(
      email: emailController.text,
    );
    final response = await baseAuthRepo.forgetPassword(email);
    response.fold(
      (l) {
        emit(AuthError(l.toString()));
      },
      (r) {
        emit(AuthSuccess(
          r,
        ));
      },
    );
  }

  // void updatePassword({
  //   required String email,
  //   required String otp,
  //   required String pass,
  //   required String confrimPass,
  // }) {
  //   emit(AuthLoading());
  //   Dio().post("https://voipsys.space/api/update_forgotten_password", data: {
  //     "password": pass,
  //     // "ahmedA0+",
  //     "password_confirmation": confrimPass,
  //     // "ahmedA0+",
  //     "otp": otp,
  //     // "7682",
  //     "email": email,
  //     // "0ahmed0fayez@gmail.com"
  //   }).then((value) {
  //     emit(UpdatePassSuccess(
  //       value.data,
  //     ));
  //   }).catchError((e) {
  //     emit(UpdatePassError(e.toString()));
  //   });
  // }
  updatePassword( 

   String email,
  ) async {
    emit(UpdatePassLoading());
    UpdatePassData updatePassData = UpdatePassData(
      password: passwordController.text,
      passwordConfirmation: confirmPasswordController.text,
      otp: otpController.text,
      email:email,
    );

    var result = await baseAuthRepo.updatePassword(
      updatePassData,

    );
    result.fold(
      (l) {
        emit(UpdatePassError(l.toString()));
      },
      (r) {
        emit(UpdatePassSuccess(r));
      },
    );
  }
}
