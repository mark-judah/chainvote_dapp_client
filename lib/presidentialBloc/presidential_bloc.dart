import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'presidential_event.dart';
part 'presidential_state.dart';

class PresidentialBloc extends Bloc<PresidentialEvent, PresidentialState> {
  PresidentialBloc() : super(PresidentialInitial()) {
    on<PresidentialEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
