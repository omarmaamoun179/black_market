import 'package:black_market/features/register/data/models/register_data.dart';
import 'package:black_market/features/register/data/repositories/register_base_repo.dart';
import 'package:black_market/features/register/presentation/cubit/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(
    this.registerBaseRepo,
  ) : super(RegisterInitial());
  RegisterBaseRepo registerBaseRepo;
  static RegisterCubit get(context) => BlocProvider.of(context);
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  bool isObsecure = true;
  Icon suffixIcon = const Icon(Icons.lock, color: Color(0xffFFFFFF));
  void changeVisibility() {
    emit(RegisterInitial());
    isObsecure = !isObsecure;
    suffixIcon = isObsecure
        ? const Icon(Icons.lock, color: Color(0xffFFFFFF))
        : const Icon(Icons.lock_open, color: Color(0xffFFFFFF));
    emit(ChangeVisibiltyState());
  }

  Future<void> register() async {
    emit(RegisterLoading());
    RegisterData registerData = RegisterData(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
      passwordConfirmation: confirmPasswordController.text,
    );
    final result = await registerBaseRepo.register(
      registerData,
    );
    result.fold((l) {
      emit(RegisterError(l));
    }, (r) {
      emit(RegisterSuccess(r));
    });
  }
}
