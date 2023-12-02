import 'package:black_market/features/bank_details/presentation/cubit/bank_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BankDetailsCubit extends Cubit<BankDetailsState> {
  BankDetailsCubit() : super(BankDetailsInitial());
}
