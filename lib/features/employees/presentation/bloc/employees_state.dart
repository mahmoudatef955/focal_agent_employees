part of 'employees_bloc.dart';

abstract class EmployeesState extends Equatable {
  const EmployeesState();  

  @override
  List<Object> get props => [];
}
class EmployeesInitial extends EmployeesState {}
