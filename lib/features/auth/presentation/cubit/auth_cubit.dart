import 'package:black_market/features/auth/data/models/email.dart';
import 'package:black_market/features/auth/data/models/forget_pass_model.dart';
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
}
