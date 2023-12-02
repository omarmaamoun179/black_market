import 'package:black_market/features/login/data/models/login_data.dart';
import 'package:black_market/features/login/data/repositories/login_impl.dart';
import 'package:black_market/features/login/presentation/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(
    this.loginBaseRepo,
  ) : super(LoginInitial());
  LoginRepoImpl loginBaseRepo;
  bool isVisible = false;
  Icon suffixIcon = const Icon(Icons.lock, color: Color(0xffFFFFFF));
  void changeVisibility() {
    suffixIcon = isVisible
        ? const Icon(
            Icons.lock_open,
            color: Color(0xffFFFFFF),
          )
        : const Icon(
            Icons.lock,
            color: Color(0xffFFFFFF),
          );
    emit(ChangeVisibilityState());
    isVisible = !isVisible;
    emit(ChangeVisibilityState());
  }

  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  static LoginCubit get(context) => BlocProvider.of(context);
  login() async {
    LoginData loginData = LoginData(
      email: emailController.text,
      password: passwordController.text,
    );

    final result = await loginBaseRepo.login(
      loginData,
    );
    result.fold((l) {
      emit(LoginError(l.toString()));
    }, (r) {
      emit(LoginSuccess(r));
    });
  }
}
