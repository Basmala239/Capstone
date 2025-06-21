import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/project_model.dart';
import '../../data/repository/get_project_repository.dart';

part 'project_state.dart';

class ProjectCubit extends Cubit<ProjectState> {
  List<Project> _allProjects = [];

  ProjectCubit() : super(ProjectInitial());

  Future<void> fetchProjects() async {
    try {
      emit(ProjectLoading());
      _allProjects = await ApiService.fetchProjects();
      emit(ProjectLoaded(_allProjects));
    } catch (e) {
      emit(ProjectError(e.toString()));
    }
  }

  void searchProjects(String query) {
    if (query.isEmpty) {
      emit(ProjectLoaded(_allProjects));
    } else {
      final filtered = _allProjects
          .where((project) => project.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
      emit(ProjectLoaded(filtered));
    }
  }
}
