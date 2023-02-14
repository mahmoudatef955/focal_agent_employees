import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/employee.dart';
import '../../data/repositories/employee_repository.dart';

part 'employees_event.dart';
part 'employees_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  final EmployeeRepository employeeRepository;
  final List<Employee> _employees = [];

  EmployeeBloc(this.employeeRepository) : super(const EmployeeInitial()) {
    on<EmployeeFetched>(_onEmployeeFetched);

    on<EmployeeRefreshed>(_onEmployeeRefreshed);

    on<EmployeeDeleted>(_onEmployeeDeleted);
  }

  List<Employee> _itEmployees() => _employees
      .where((element) => element.department == Department.it)
      .toList();
  List<Employee> _hrEmployees() => _employees
      .where((element) => element.department == Department.hr)
      .toList();

  List<Employee> filteredEmployees(Department department) {
    if (department == Department.hr) {
      return _itEmployees();
    }

    return _hrEmployees();
  }

  Future<void> _onEmployeeFetched(
      EmployeeFetched event, Emitter<EmployeeState> emit) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      final employeesResult = await employeeRepository.getAllEmployees();
      _employees.addAll(employeesResult);

      return emit(SuccessFetchDataState(_employees));
    } on Exception {
      return emit(const ErrorFetchDataState(''));
    }
  }

  Future<void> _onEmployeeRefreshed(
      EmployeeRefreshed event, Emitter<EmployeeState> emit) async {
    emit(const EmployeeInitial());
    try {
      await Future.delayed(const Duration(seconds: 2));
      final employeesResult = await employeeRepository.getAllEmployees();
      _employees.clear();
      _employees.addAll(employeesResult);

      return emit(SuccessFetchDataState(_employees));
    } on Exception {
      return emit(const ErrorFetchDataState(''));
    }
  }

  Future<void> _onEmployeeDeleted(
      EmployeeDeleted event, Emitter<EmployeeState> emit) async {
    emit(DeletingLoadingState(
        '${event.employee.firstName} ${event.employee.lastName}'));
    try {
      await Future.delayed(const Duration(seconds: 3));
      _employees.removeWhere((element) => element.id == event.employee.id);

      return emit(const DeletingSuccessState());
    } on Exception {
      return emit(const DeletingErrorState(''));
    }
  }
}
