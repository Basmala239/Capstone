// import 'package:dio/dio.dart';
// import 'package:provider/provider.dart';
//
// import '../../../../utils/network/consts.dart';
// import '../../../../utils/network/repository_helper.dart';
// import '../../../profile/presentation/model_view/user_provider/user_provider.dart';
// import '../models/login_response/login_response_model.dart';
//
// class LoginRepository {
//   final Dio _dio = Dio(
//     BaseOptions(
//       baseUrl: ApiConstants.baseUrl,
//       headers: {
//         'Accept': 'application/json',
//       },
//     ),
//   );
//
//   Future<String?> login(String email, String password) async {
//     try {
//
//       final response = await _dio.post(
//         '/login',
//         data: {
//           'email': email,
//           'password': password,
//         },
//       );
//
//       final data = response.data;
//       print (data);
//       if (data['status'] == true) {
//
//         final loginResponse = LoginResponse.fromJson(response.data);
//         final user = loginResponse.user;
//         Provider.of<UserProvider>(context, listen: false).setUser(appUser);
//         print(user);
//         return 'Login successfully';
//
//       } else {
//         print('Login Failed: $data');
//         return data['msg'];
//       }
//
//     } on DioException catch (e) {
//       return RepositoryHelper.handleError(e);
//
//     } catch (e) {
//       return 'Unexpected error';
//     }
//   }
// }
