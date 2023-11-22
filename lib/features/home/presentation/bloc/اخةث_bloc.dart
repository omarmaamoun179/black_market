import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'اخةث_event.dart';
part 'اخةث_state.dart';

class اخةثBloc extends Bloc<اخةثEvent, اخةثState> {
  اخةثBloc() : super(اخةثInitial()) {
    on<اخةثEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
