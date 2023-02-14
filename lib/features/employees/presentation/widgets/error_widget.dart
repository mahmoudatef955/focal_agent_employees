import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/employees_bloc.dart';

class ErrorContent extends StatelessWidget {
  const ErrorContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () async {
              context.read<EmployeeBloc>().add(EmployeeRefreshed());
            },
            icon: const Icon(
              Icons.replay_circle_filled_outlined,
              size: 35,
            ),
          ),
          const SizedBox(height: 8),
          const Text('Error happened please try again'),
        ],
      ),
    );
  }
}
