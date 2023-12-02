// import 'dart:math';

// import 'package:black_market/features/auth/data/models/login_data.dart';
// import 'package:black_market/features/auth/data/models/register_data.dart';
// import 'package:black_market/features/auth/data/repositories/base_auth_repo.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// part 'auth_state.dart';

// class AuthCubit extends Cubit<AuthState> {
//   AuthCubit(
//     this.baseAuthRepo,
//   ) : super(AuthInitial());

//   static AuthCubit get(context) => BlocProvider.of(context);
//   var emailController = TextEditingController();
//   var passwordController = TextEditingController();

//   BaseAuthRepo baseAuthRepo;
//   Icon suffixIcon = const Icon(Icons.lock, color: Color(0xffFFFFFF));

  

//   Future<void> register(
   
//   ) async {
//     emit(AuthRegisterLoading());
//     RegisterData registerData = RegisterData(
//       name: nameController.text,
//       email: emailController.text,
//       password: passwordController.text,
//       passwordConfirmation: confirmPasswordController.text,
//     );
//     final result = await baseAuthRepo.register(
     
//     );
//     result.fold((l) {
//       emit(AuthRegisterError(l.toString()));
//     }, (r) {
//       emit(AuthRegisterSuccess());
//     });
//   }
// }
