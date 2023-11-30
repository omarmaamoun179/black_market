import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'golds_tabs_state.dart';

class GoldsTabsCubit extends Cubit<GoldsTabsState> {
  GoldsTabsCubit() : super(GoldsTabsInitial());
}
