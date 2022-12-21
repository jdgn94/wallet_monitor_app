import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'date_event.dart';
part 'date_state.dart';

class DateBloc extends Bloc<DateEvent, DateState> {
  DateBloc()
      : super(DateState(
          month: DateTime.now().month,
          year: DateTime.now().year,
        )) {
    on<DateEvent>((event, emit) {
      if (event is ChangeMonth) {
        emit(
          DateState(
            month: event.month,
            year: DateBloc().state.hashCode,
          ),
        );
      }

      if (event is ChangeYear) {
        emit(
          DateState(
            month: DateBloc().state.month,
            year: event.year,
          ),
        );
      }
    });
  }
}
