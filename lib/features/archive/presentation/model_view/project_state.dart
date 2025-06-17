part of 'project_cubit.dart';

abstract class ProjectState {}

class ProjectInitial extends ProjectState {}

class ProjectLoading extends ProjectState {}

class ProjectLoaded extends ProjectState {
  final List<ProjectModel> projects;

  ProjectLoaded({required this.projects});
}

class ProjectError extends ProjectState {
  final String message;

  ProjectError({required this.message});
}
