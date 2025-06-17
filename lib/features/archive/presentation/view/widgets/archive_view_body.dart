import 'package:capstone/features/archive/presentation/model_view/project_cubit.dart';
import 'package:capstone/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'build_project_list.dart';

class ArchiveViewBody extends StatelessWidget {
  const ArchiveViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
          margin: EdgeInsets.all(10),

          decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(100)
          ),
          child:TextField(
            onChanged:  (query) => context.read<ProjectCubit>().search(query),
            decoration: const InputDecoration(
              border: InputBorder.none,
              labelText: 'Search',
              suffixIcon: Icon(Icons.search),
            ),
          ),
        ),

        Expanded(
          child: BlocBuilder<ProjectCubit, ProjectState>(
            builder: (context, state) {
              if (state is ProjectLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is ProjectLoaded) {
                return ListView.separated(
                  itemCount: state.projects.length,
                  separatorBuilder: (_, __) => Divider(),
                  itemBuilder: (context, i) {
                    return projectCard(state.projects[i],context);
                  },
                );
              } else if (state is ProjectError) {
                return Center(child: Text('Error: ${state.message}'));
              }
              return Center(child: Text('Enter a search keyword'));
            },
          ),
        ),
      ],
    );
  }
}
