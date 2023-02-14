import 'package:equatable/equatable.dart';

enum Department {
  it,
  hr;

  static Department fromJson(String json) => values.byName(json);
}

List<Employee> employeesFromJson(List<dynamic> str) =>
    List<Employee>.from(str.map((x) => Employee.fromJson(x)));

class Employee extends Equatable {
  const Employee({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.department,
  });

  final int id;
  final String firstName;
  final String lastName;
  final Department department;

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      department: Department.fromJson(json['department']),
    );
  }

  @override
  List<Object> get props => [id, firstName, lastName, department];
}
