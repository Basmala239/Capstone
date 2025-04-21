part of 'project_cubit.dart';


sealed class ProjectState {}

final class ProjectInitialState extends ProjectState {
  final List<ProjectModel>projects;
  ProjectInitialState(this.projects);
}

final class ProjectFilterState extends ProjectState {
  final List<ProjectModel>filterProjects;
  ProjectFilterState(this.filterProjects);
}
