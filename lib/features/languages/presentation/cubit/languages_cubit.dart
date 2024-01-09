import 'package:black_market/features/languages/presentation/cubit/languages_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguagesCubit extends Cubit<LanguagesState> {
  LanguagesCubit() : super(LanguagesInitial());
  static LanguagesCubit get(context) => BlocProvider.of(context);

  String? language;
  void changeValue(
    String newValue,
  ) {

    language = newValue;
          

    emit(LanguagesArabic());
  }
}
