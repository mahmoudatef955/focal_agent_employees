import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focal_agent_employees/features/employees/data/models/employee.dart';

import '../../data/repositories/employee_repository.dart';
import '../bloc/employees_bloc.dart';
import '../widgets/employee_body.dart';

class Employees extends StatelessWidget {
  const Employees({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => EmployeeBloc(EmployeeRepository())..add(EmployeeFetched()),
      child: const _Body(),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: const Text('Team'),
              centerTitle: true,
              pinned: true,
              floating: true,
              actions: [
                IconButton(
                  onPressed: () async {
                    context.read<EmployeeBloc>().add(EmployeeRefreshed());
                  },
                  icon: const Icon(
                    Icons.replay,
                  ),
                ),
              ],
              bottom: TabBar(controller: _tabController, tabs: const [
                Tab(icon: Text('Hr')),
                Tab(icon: Text('IT')),
              ]),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: const [
            EmployeesContent(department: Department.hr),
            EmployeesContent(department: Department.it),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
