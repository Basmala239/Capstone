import 'package:capstone/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../resources/text_styles.dart';
import '../../../../../../widgets/custom_buttons.dart';
import '../../../../data/repository/add_user_repository/add_user_repasitory.dart';
import '../../../all_users/view/all_users_view.dart';
import '../../model_view/add_user_cubit.dart';
class AddUserBody extends StatelessWidget {
  AddUserBody({super.key,required this.token});

  final String token;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _departmentController = TextEditingController();
  final _githubController = TextEditingController();
  final _yearController = TextEditingController();
  final _teamIdController = TextEditingController();
  final _maxTeamsAllowedController = TextEditingController();
  final _availabilityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddUserCubit, AddUserState>(
      builder: (context, state) {
        final cubit = context.read<AddUserCubit>();

        return SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(18),
            child: Column(
            children: [
              CustomTextField(
                controller: _nameController,
                hint: 'Name',
                errorText: state.errors['name'],
                onChanged: (val) => cubit.updateField('name', val),
              ),
              CustomTextField(
                controller: _emailController,
                hint: 'Email',
                errorText: state.errors['email'],
                onChanged: (val) => cubit.updateField('email', val),
              ),
              CustomTextField(
                controller: _passwordController,
                hint: 'Password',
                obscureText: true,
                errorText: state.errors['password'],
                onChanged: (val) => cubit.updateField('password', val),
              ),
              const SizedBox(height: 3),
              Text('Role', style: TextStyles.black22W500),
              const SizedBox(height: 3),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Choose an option',
                  border: OutlineInputBorder(),
                ),

                value: state.role,
                items: ['admin', 'student', 'supervisor']
                    .map((option) => DropdownMenuItem(
                  value: option,
                  child: Text(option),
                ))
                    .toList(),
                onChanged: (val) => cubit.updateRole(val),
              ),
              if (state.role == 'student')
                CustomTextField(
                  controller: _githubController,
                  hint: 'GitHub Link',
                  onChanged: (val) => cubit.updateField('github', val),
                ),
              if (state.role == 'student' || state.role == 'supervisor')
                CustomTextField(
                  controller: _departmentController,
                  hint: 'Department',
                  onChanged: (val) => cubit.updateField('department', val),
                ),
              if (state.role == 'student')
                CustomTextField(
                  controller: _yearController,
                  hint: 'Year',
                  onChanged: (val) => cubit.updateField('year', val),
                ),
              if (state.role == 'student')
                CustomTextField(
                  controller: _teamIdController,
                  hint: 'Team ID',
                  onChanged: (val) => cubit.updateField('teamId', val),
                ),
              if (state.role == 'supervisor')
                CustomTextField(
                  controller: _maxTeamsAllowedController,
                  hint: 'Max Teams Allowed',
                  onChanged: (val) => cubit.updateField('maxTeamsAllowed', val),
                ),if (state.role == 'supervisor')
                CustomTextField(
                  controller: _availabilityController,
                  hint: 'Availability',
                  onChanged: (val) => cubit.updateField('availability', val),
                ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomGeneralButton(
                    text: 'Cancel',
                    onTap: () {
                      cubit.clearForm();
                      _nameController.clear();
                      _emailController.clear();
                      _passwordController.clear();
                      _departmentController.clear();
                      _githubController.clear();
                      _yearController.clear();
                      _teamIdController.clear();
                      _maxTeamsAllowedController.clear();
                      _availabilityController.clear();
                      Navigator.pop(context);
                    },
                    editwidth: 130,
                    editheight: 40,
                    inverse: true,
                  ),
                  CustomGeneralButton(
                    text: 'ADD',
                    onTap: () async {
                      cubit.validateForm();
                      if (context.read<AddUserCubit>().state.errors.isEmpty) {
                        String response= await addUser(
                        token: token,
                        name: _nameController.text.trim(),
                        email: _emailController.text.trim(),
                        password: _passwordController.text.trim(),
                        userType: state.role ?? 'admin',
                        teamId: _teamIdController.text.trim(),
                        github: _githubController.text.trim(),
                        department: _departmentController.text.trim(),
                        year: _yearController.text.trim(),
                        maxTeamsAllowed: _maxTeamsAllowedController.text.trim(),
                        availability: _availabilityController.text.trim()
                        );
                          if(response =='تم إضافة المستخدم بنجاح.'){
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>UserListView(token: token,)));
                        }
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(response),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    },
                    editwidth: 130,
                    editheight: 40,
                  ),
                ],
              ),
              SizedBox(height: 10,),
            ],
          )
        ),
        );
      },
    );
  }
}
