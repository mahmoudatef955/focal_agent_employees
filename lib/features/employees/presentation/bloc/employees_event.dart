part of 'employees_bloc.dart';

abstract class EmployeeEvent extends Equatable {
  const EmployeeEvent();

  @override
  List<Object> get props => [];
}

class EmployeeFetched extends EmployeeEvent {}

class EmployeeRefreshed extends EmployeeEvent {}

class EmployeeDeleted extends EmployeeEvent {
  final Employee employee;

  const EmployeeDeleted(this.employee);
}
