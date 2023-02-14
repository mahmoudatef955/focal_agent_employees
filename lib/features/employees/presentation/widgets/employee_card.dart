import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/assets.dart';
import '../../data/models/employee.dart';
import '../bloc/employees_bloc.dart';

class EmployeeCard extends StatelessWidget {
  final Employee employee;
  const EmployeeCard({
    super.key,
    required this.employee,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          children: [
            Image.asset(
              ImagePaths.profileImage,
              height: 50,
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${employee.firstName} ${employee.lastName}'),
                const SizedBox(height: 2),
                Text('Id: ${employee.id}'),
              ],
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: () =>
                  context.read<EmployeeBloc>().add(EmployeeDeleted(employee)),
            ),
          ],
        ),
      ),
    );
  }
}
