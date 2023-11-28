import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bank_details_state.dart';

class BankDetailsCubit extends Cubit<BankDetailsState> {
  BankDetailsCubit() : super(BankDetailsInitial());
}
