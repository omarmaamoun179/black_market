// import 'package:black_market/config/router/routes.dart';
// import 'package:black_market/core/widget/custom_app_bar.dart';
// import 'package:black_market/core/widget/custom_text_field.dart';
// import 'package:black_market/features/auth/data/repositories/auth_repo_impl.dart';
// import 'package:black_market/features/auth/presentation/cubit/auth_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class ConfirmPassword extends StatelessWidget {
//   const ConfirmPassword({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => AuthCubit(
//         AuthRepoImpl(),
//       ),
//       child: BlocConsumer<AuthCubit, AuthState>(
//         listener: (context, state) {
//           if (state is UpdatePassSuccess) {
//             Navigator.pushNamed(context, Routes.finish);
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(
//                 content: Text('success'),
//               ),
//             );
//           } else if (state is UpdatePassError) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                 content: Text(state.error),
//               ),
//             );
//           }
//         },
//         builder: (context, state) {
//           return Scaffold(
//             backgroundColor: const Color(0xff0D0D0D),
//             body: SafeArea(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: 25.h,
//                     ),
//                     CustomAppBar(
//                       title: 'إسترجاع كلمة المرور',
//                       icon: IconButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         icon: Icon(
//                           Icons.arrow_forward,
//                           color: Colors.white,
//                           size: 24.sp,
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       flex: 1,
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Column(
//                           children: [
//                             SizedBox(
//                               height: 92.h,
//                             ),
//                             CustomTextFormField(
//                               textInputAction: TextInputAction.next,
//                               controller:
//                                   AuthCubit.get(context).passwordController,
//                               lableText: 'أدخل كلمة المرور الجديدة',
//                               suffixIcon: const Icon(
//                                 Icons.lock_outlined,
//                                 color: Color(
//                                   0xffFFFFFF,
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               height: 55.h,
//                             ),
//                             CustomTextFormField(
//                               textInputAction: TextInputAction.next,
//                               controller: AuthCubit.get(context)
//                                   .confirmPasswordController,
//                               lableText: 'أعد إدخال كلمة المرور الجديدة',
//                               suffixIcon: const Icon(
//                                 Icons.lock_outlined,
//                                 color: Color(
//                                   0xffFFFFFF,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 24.w),
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           fixedSize: Size(327.w, 52.h),
//                           backgroundColor: const Color(0xffFEDC00),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10.r),
//                           ),
//                         ),
//                         onPressed: () {
//                           AuthCubit.get(context).updatePassword();
//                         },
//                         child: Text(
//                           ' إرسال ',
//                           style: TextStyle(
//                             fontSize: 16.sp,
//                             fontWeight: FontWeight.w700,
//                             color: const Color(0xff0D0D0D),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
