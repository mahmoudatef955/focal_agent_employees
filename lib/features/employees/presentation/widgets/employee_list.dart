import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/employee.dart';
import '../bloc/employees_bloc.dart';
import 'employee_card.dart';

class EmployeesList extends StatelessWidget {
  final Department department;
  const EmployeesList({super.key, required this.department});

  @override
  Widget build(BuildContext context) {
    var employees = context.watch<EmployeeBloc>().filteredEmployees(department);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: RefreshIndicator(
        onRefresh: () async {
          context.read<EmployeeBloc>().add(EmployeeRefreshed());
        },
        child: ListView.builder(
          itemBuilder: (context, index) => EmployeeCard(
            employee: employees[index],
          ),
          itemCount: employees.length,
        ),
      ),
    );
  }
}
