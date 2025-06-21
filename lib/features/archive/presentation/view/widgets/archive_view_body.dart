import 'package:capstone/features/archive/presentation/model_view/project_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'build_project_card.dart';

class ArchiveViewBody extends StatelessWidget {
  ArchiveViewBody({super.key});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                context.read<ProjectCubit>().searchProjects(value);
              },
              decoration: InputDecoration(
                hintText: 'Search by project title',
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
          Expanded(
              child: BlocBuilder<ProjectCubit, ProjectState>(
                builder: (context, state) {
                  if (state is ProjectLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is ProjectLoaded) {
                    return ListView.builder(
                      itemCount: state.projects.length,
                      itemBuilder: (context, index) {
                        final project = state.projects[index];
                        return projectCard(project, context);
                      },
                    );
                  } else if (state is ProjectError) {
                    return Center(child: Text('Error: ${state.message}'));
                  }

                  return Center(child: Text("Welcome"));
                },
              )
          )
        ]
    );
  }
}
