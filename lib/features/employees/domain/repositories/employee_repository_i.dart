import '../../data/models/employee.dart';

abstract class IEmployeeRepository {
  Future<List<Employee>> getAllEmployees();
  Future<List<Employee>> deleteEmployee(
      int employeeId, List<Employee> employees);
}
