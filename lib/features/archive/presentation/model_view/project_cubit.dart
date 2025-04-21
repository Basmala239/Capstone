import 'package:bloc/bloc.dart';
import '../../data/model/project_model.dart';

part 'project_state.dart';

class ProjectCubit extends Cubit<ProjectState> {
  ProjectCubit() : super(ProjectInitialState(ProjectModel.allProject));

  void filterProject(String name){
    if(name.isEmpty){
      emit(ProjectInitialState(ProjectModel.allProject));
    }else{
      final filteredProject= ProjectModel.allProject.where((project)=> project.name.toString().toLowerCase().contains(name.toLowerCase())).toList();
      emit(ProjectFilterState(filteredProject));
    }
  }
}
