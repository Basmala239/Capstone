import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../data/model/project_model.dart';

part 'project_state.dart';

class ProjectCubit extends Cubit<ProjectState> {
  ProjectCubit() : super(ProjectInitial());

  List<Project> _allProjects = [];

  Future<void> fetchProjects(String token) async {
    emit(ProjectLoading());
    try {
      final res = await http.get(
        Uri.parse('https://dev.3bhady.com/api/v1/projects'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      final data = jsonDecode(res.body);
      _allProjects = (data['projects'] as List)
          .map((e) => Project.fromJson(e))
          .toList();
      emit(ProjectLoaded(projects: _allProjects));
    } catch (e) {
      emit(ProjectError(message: e.toString()));
    }
  }

  void search(String query) {
    if (query.isEmpty) {
      emit(ProjectLoaded(projects: _allProjects));
    } else {
      final filtered = _allProjects
          .where((p) => p.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
      emit(ProjectLoaded(projects: filtered));
    }
  }
}
