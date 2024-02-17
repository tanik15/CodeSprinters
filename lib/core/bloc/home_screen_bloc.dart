import 'package:bloc/bloc.dart';
import 'package:portfolio/api/api.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(HomeScreenInitial()) {
      on<HomeScreenEvent>((event, emit) async {
      emit(HomeScreenLoadingState());
      final apiDetails = await getTopGainers();
      final topLosers = await getTopLosers();
      // final feeUpdatestatus = await feeUpdateStatus(name);
      emit(HomeScreenLoadedState(
      ));
    });
  }
}
