part of 'date_bloc.dart';

abstract class DateEvent extends Equatable {
  const DateEvent();

  @override
  List<Object> get props => [];
}

class ChangeMonth extends DateEvent {
  final int month;
  const ChangeMonth(this.month);
}

class ChangeYear extends DateEvent {
  final int year;
  const ChangeYear(this.year);
}
