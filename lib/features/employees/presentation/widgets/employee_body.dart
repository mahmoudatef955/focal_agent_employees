import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focal_agent_employees/features/employees/data/models/employee.dart';
import 'package:focal_agent_employees/features/employees/presentation/widgets/loading_dialog.dart';

import '../../../../core/service/message_provider/message_provider.dart';
import '../bloc/employees_bloc.dart';
import 'employee_list.dart';
import 'error_widget.dart';
import 'loading_indicator.dart';

class EmployeesContent extends StatelessWidget {
  final Department department;
  const EmployeesContent({super.key, required this.department});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EmployeeBloc, EmployeeState>(
      builder: (context, state) {
        if (state is EmployeeInitial) {
          return const LoadingIndicator();
        } else if (state is ErrorFetchDataState) {
          return const ErrorContent();
        }

        return EmployeesList(department: department);
      },
      listener: (context, state) {
        if (state is ErrorFetchDataState) {
          MessageProvider.showErrorSnackBar("${state.errorMessage} ");
        } else if (state is DeletingLoadingState) {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return DialogBody(
                    dialogContent: 'Deleting ${state.employeeName} ....');
              });
        } else if (state is DeletingSuccessState) {
          Navigator.of(context).pop();
          MessageProvider.showSuccessSnackBar('Employee deleted Successfully');
        }
      },
    );
  }
}
