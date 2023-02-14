part of 'employees_bloc.dart';

enum PostStatus { initial, success, failure }

abstract class EmployeeState extends Equatable {
  const EmployeeState();

  @override
  List<Object> get props => [];
}

class EmployeeInitial extends EmployeeState {
  const EmployeeInitial();
}

class SuccessFetchDataState extends EmployeeState {
  final List<Employee> employees;

  const SuccessFetchDataState(this.employees);
}

class DeletingLoadingState extends EmployeeState {
  final String employeeName;

  const DeletingLoadingState(this.employeeName);
}

class DeletingSuccessState extends EmployeeState {
  const DeletingSuccessState();
}

class DeletingErrorState extends EmployeeState {
  final String errorMessage;

  const DeletingErrorState(this.errorMessage);
}

class ErrorFetchDataState extends EmployeeState {
  final String errorMessage;

  const ErrorFetchDataState(this.errorMessage);
}
