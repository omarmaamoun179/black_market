import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'saving_state.dart';

class SavingCubit extends Cubit<SavingState> {
  SavingCubit() : super(SavingInitial());
}
