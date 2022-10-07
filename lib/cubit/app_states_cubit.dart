import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'app_states_state.dart';

class AppStatesCubit extends Cubit<AppStatesState> {
  AppStatesCubit() : super(AppStatesInitial());
}
