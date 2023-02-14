import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:focal_agent_employees/features/employees/data/models/employee.dart';

abstract class IEmployeeApiMock {
  Future<List<Employee>> getAllEmployees();
  Future<List<Employee>> deleteEmployee(
      int employeeId, List<Employee> employees);
}

class EmployeeApiMock implements IEmployeeApiMock {
  @override
  Future<List<Employee>> getAllEmployees() async {
    try {
      final data = await rootBundle.load('assets/json/employees.json');
      final map = json.decode(
        utf8.decode(
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
        ),
      );

      return employeesFromJson(map);
    } on Exception catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<List<Employee>> deleteEmployee(
      int employeeId, List<Employee> employees) {
    try {
      employees.removeWhere((element) => element.id == employeeId);

      return Future.value(employees);
    } on Exception catch (e) {
      return Future.error(e);
    }
  }
}
