import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../../../../../resources/color_manager.dart';
import '../../../../../../widgets/custom_buttons.dart';
import '../../../../../../widgets/custom_text_field.dart';
import '../../../../../auth/presentation/model_view/user_provider/user_provider.dart';
import '../../../../data/repository/change_password_repository/change_password_repository.dart';
import '../../../model_view/change_password/change_password_cubit.dart';
import '../../../model_view/change_password/change_password_state.dart';
class ChangePasswordBody extends StatefulWidget {
  const ChangePasswordBody({super.key});

  @override
  State<ChangePasswordBody> createState() => _ChangePasswordBodyState();
}

class _ChangePasswordBodyState extends State<ChangePasswordBody> {
  final TextEditingController _currentPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChangePasswordCubit(),
      child: BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
        builder: (context, state) {
          return Column(
            children: [
              SizedBox(height: 20),
              CustomTextField(
                controller: _currentPasswordController,
                hint: 'Current Password',
                errorText: state.currentPasswordError,
                color: ColorManager.whiteop,
              ),
              SizedBox(height: 10),
              CustomTextField(
                controller: _newPasswordController,
                hint: 'New Password',
                errorText: state.newPasswordError,
                color: ColorManager.whiteop,
              ),
              SizedBox(height: 10),
              CustomTextField(
                controller: _confirmPasswordController,
                hint: 'Confirm Password',
                errorText: state.confirmPasswordError,
                color: ColorManager.whiteop,
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomGeneralButton(
                    text: 'Cancel',
                    onTap: () => Navigator.pop(context),
                    editwidth: 130,
                    editheight: 40,
                    inverse: true,
                  ),
                  CustomGeneralButton(
                    text: 'Save',
                    onTap: () async {
                      final cubit = context.read<ChangePasswordCubit>();
                      cubit.validateFields(
                        currentPassword: _currentPasswordController.text.trim(),
                        newPassword: _newPasswordController.text.trim(),
                        confirmPassword: _confirmPasswordController.text.trim(),
                      );

                      if (cubit.state.isValid) {
                        String res= await changePassword(
                          token: Provider.of<UserProvider>(context, listen: false).token ?? '',
                          currentPassword: _currentPasswordController.text.trim(),
                          newPassword: _newPasswordController.text.trim(),
                        );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(res), duration: Duration(seconds: 2)),
                          );
                          if(res == 'تم تغيير كلمة المرور بنجاح.'){
                          Navigator.pop(context);
                        }
                      }
                    },
                    editwidth: 130,
                    editheight: 40,
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}