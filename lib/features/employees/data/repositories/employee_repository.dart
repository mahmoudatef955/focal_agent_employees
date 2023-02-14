import 'package:focal_agent_employees/features/employees/data/data_provider/employee_data_source.dart';
import 'package:focal_agent_employees/features/employees/data/models/employee.dart';

import '../../domain/repositories/employee_repository_i.dart';

class EmployeeRepository implements IEmployeeRepository {
  final EmployeeApiMock employeeProvider = EmployeeApiMock();

  EmployeeRepository();

  @override
  Future<List<Employee>> deleteEmployee(
      int employeeId, List<Employee> employees) async {
    var result = await employeeProvider.deleteEmployee(employeeId, employees);
    return result;
  }

  @override
  Future<List<Employee>> getAllEmployees() async {
    var result = await employeeProvider.getAllEmployees();
    return result;
  }
}
