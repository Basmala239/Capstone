import 'package:capstone/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../widgets/custom_buttons.dart';
import '../../../../data/repository/add_user_repository/add_user_repasitory.dart';
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
                        await addUser(
                        token: token,
                        name: 'Basmala Abuzied',
                        email: 'abuziedbasmala@gmail.com',
                        password: '12345678',
                        userType: 'student',
                        teamId: '1',
                        github: 'https://github.com/Basmala239',
                        department: 'CS',
                        year: '2021',
                        studentName: 'Basmala',
                        );

                        print("Form is valid, submit data");
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
