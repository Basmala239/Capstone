import 'dart:io';

import 'package:capstone/features/auth/presentation/model_view/user_provider/user_provider.dart';
import 'package:capstone/features/task/data/models/task.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../projects/data/repository/add_project_to_archive/archive_project.dart';
import '../projects/data/repository/create_project_repository/create_project_repository.dart';
import '../projects/data/repository/create_project_request_repository/create_project_requset_repository.dart';
import '../projects/data/repository/delete_project_repository/delete_project_repository.dart';
import '../projects/data/repository/get_all_project_repository/get_all_project_repository.dart';
import '../projects/data/repository/get_all_project_requests/get_all_project_requests.dart';
import '../projects/data/repository/get_one_project/get_one_project.dart';
import '../projects/data/repository/update_project_repository/update_project_repository.dart';
import '../task/data/repository/create_task_repository/create_task_repository.dart';
import '../task/data/repository/delete_task_repository/delete_task_repository.dart';
import '../task/data/repository/get_my_submissionss_repository/get_my_submissions_repository.dart';
import '../task/data/repository/get_task_submission_repository/get_task_submission_repository.dart';
import '../task/data/repository/review_submission_repository/review_submission_repository.dart';
import '../task/data/repository/submit_task_repository/submit_task_repository.dart';
import '../task/data/repository/update_task_repository/update_task_repository.dart';
import '../teams/data/repository/create_team_repository/create_team_repository.dart';
import '../teams/data/repository/delete_team_repository/delete_team_repository.dart';
import '../teams/data/repository/get_all_teams_repository/get_all_teams_repository.dart';
import '../teams/data/repository/get_single_team_repository/get_single_team_repository.dart';
import '../teams/data/repository/update_team_repository/update_team_repository.dart';

class TestView extends StatelessWidget {
  TestView({super.key});
  final File myFile = File('file:///C:/Users/Basmala/Downloads/Final_Doc.pdf');
  final Task task=Task(id: 9, title:"تصميم واجهة المستخدم", description: "مهمة تصميم واجهة المستخدم للتطبيق.", startDate:DateTime.parse("2025-06-15T00:00:00.000000Z"), assignedToUserId: 1, teamId: 1, projectId: 1, status: 'Pending',dueDate: DateTime.parse("2025-06-20T00:00:00.000000Z"));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: () async {
         //createTask(Provider.of<UserProvider>(context,listen: false).token?? '',task);
          //updateTask(Provider.of<UserProvider>(context,listen: false).token?? '',task);
          //deleteTask(Provider.of<UserProvider>(context,listen: false).token?? '',10);
        createTask(token:Provider.of<UserProvider>(context,listen: false).token?? '',task: task);
        //   submitTask(
        //     taskId: 1,
        //     description: 'هذا ملف خاص بالAPIs',
        //     file: myFile, token: Provider.of<UserProvider>(context,listen: false).token?? '',
        //   );
         // getTaskSubmissions(taskId: 1, token:  Provider.of<UserProvider>(context,listen: false).token?? '');
         // getMySubmissions(token:  Provider.of<UserProvider>(context,listen: false).token?? '');
          //getAllTeams(token:  Provider.of<UserProvider>(context,listen: false).token?? '');
          // await createTeam(
          // token: Provider.of<UserProvider>(context,listen: false).token?? '',
          // name: 'الفريق الذهبي',
          // description: 'وصف مشروع الفريق الذهبي',
          // supervisorId: 1,
          // );
          // await getTeamDetails(
          //   token: Provider.of<UserProvider>(context,listen: false).token?? '',
          //   teamId: 6,
          // );
          // await updateTeam(
          //   teamId: 6,
          //   newDescription: 'وصف جديد ومحدث للمشروع',
          //   token: Provider.of<UserProvider>(context,listen: false).token?? '',
          // );
          // await deleteTeam(
          //   teamId: 6,
          //   token: Provider.of<UserProvider>(context,listen: false).token?? '',
          // );
          // await archiveProject(
          //   projectId: 8,
          //   token: Provider.of<UserProvider>(context,listen: false).token?? '',
          // );
          //getAllProjects(token: Provider.of<UserProvider>(context,listen: false).token?? '');
          //getAllProjectRequests(token: Provider.of<UserProvider>(context,listen: false).token?? '');
          //getOneProject(token: Provider.of<UserProvider>(context,listen: false).token?? '', id: 1);
          // await createProject(
          //   token: Provider.of<UserProvider>(context,listen: false).token?? '',
          //   title: 'مشروع تخرج تجريبي جديد',
          //   description: 'وصف مفصل لمشروع التخرج هذا، بما في ذلك الأهداف والتقنيات المستخدمة.',
          //   category: 'cs',
          //   status: 'in_progress',
          //   teamId: 1,
          // );
          // await createProjectRequest(
          //   token: Provider.of<UserProvider>(context,listen: false).token?? '',
          //   title: 'طلب مشروع تخرج جديد من فريق الطالب',
          //   description: 'وصف مفصل للمشروع المقترح، بما في ذلك الأهداف المتوقعة والتقنيات المقترحة.',
          //   teamId: 1, suggestedByUserId: 2,
          // );
          // await updateProject(
          //   token: Provider.of<UserProvider>(context,listen: false).token?? '',
          //   projectId: 1,
          //   title: 'مشروع تخرج مُعدّل ومُحدّث',
          //   description: 'هذا وصف مُعدّل للمشروع، بعد إضافة بعض التفاصيل الجديدة أو تغييرات في الأهداف.',
          //   category: 'Software Engineering',
          //   status: 'in_progress',
          //   teamId: 1,
          // );
          // await deleteProject(
          //     token:  Provider.of<UserProvider>(context,listen: false).token?? '',
          //     projectId: 8);
          // await reviewSubmission(
          //   token:  Provider.of<UserProvider>(context,listen: false).token?? '',
          //   submissionId: 9,
          //   status: 'approved',
          //   notes: 'العمل ممتاز، تم الموافقة عليه.',
          // );





        }, child: Text('click')),
      ),
    );
  }
}


