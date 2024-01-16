import 'package:black_market/features/login/data/models/login_data.dart';
import 'package:black_market/features/login/data/models/login_model/login_model.dart';
import 'package:black_market/features/login/data/repositories/login_impl.dart';
import 'package:black_market/features/login/presentation/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(
    this.loginBaseRepo,
  ) : super(LoginInitial());
  LoginModel? loginModel;
  LoginRepoImpl loginBaseRepo;
  bool isVisible = true;
  void changeVisibility() {
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
      emit(LoginError(l.message));
    }, (r) {
      loginModel = r;
      emit(LoginSuccess(r));
    });
  }
  
}
