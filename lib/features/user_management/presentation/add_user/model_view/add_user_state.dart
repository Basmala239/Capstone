part of 'add_user_cubit.dart';

class AddUserState {
  final String name;
  final String email;
  final String password;
  final String? role;
  final String department;
  final String github;
  final String year;
  final String teamId;
  final String maxTeamsAllowed;
  final String availability;

  final Map<String, String?> errors;

  AddUserState({
    this.name = '',
    this.email = '',
    this.password = '',
    this.role,
    this.department = '',
    this.github = '',
    this.year = '',
    this.teamId = '',
    this.maxTeamsAllowed = '',
    this.availability = '',
    this.errors = const {},
  });

  AddUserState copyWith({
    Map<String, String?>? updatedFields,
    String? role,
    Map<String, String?>? errors,
  }) {
    return AddUserState(
      name: updatedFields?['name'] ?? name,
      email: updatedFields?['email'] ?? email,
      password: updatedFields?['password'] ?? password,
      department: updatedFields?['department'] ?? department,
      github: updatedFields?['github'] ?? github,
      year: updatedFields?['year'] ?? year,
      teamId: updatedFields?['teamId'] ?? teamId,
      maxTeamsAllowed: updatedFields?['maxTeamsAllowed'] ?? maxTeamsAllowed,
      availability: updatedFields?['availability'] ?? availability,
      role: role ?? this.role,
      errors: errors ?? this.errors,
    );
  }
}
