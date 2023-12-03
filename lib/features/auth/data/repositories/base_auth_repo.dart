import 'package:black_market/core/error/failures.dart';
import 'package:black_market/features/auth/data/models/email.dart';
import 'package:black_market/features/auth/data/models/forget_pass_model.dart';
import 'package:black_market/features/auth/data/models/update_pass/update_pass.dart';
import 'package:black_market/features/auth/data/models/update_pass_data.dart';
import 'package:dartz/dartz.dart';

abstract class BaseAuthRepo {
  Future<Either<Failure, ForgetPassModel>> forgetPassword(EmailData email);
  Future<Either<Failure, UpdatePassModel>> updatePassword(
      UpdatePassData updatePassData, 
      
      );
}
