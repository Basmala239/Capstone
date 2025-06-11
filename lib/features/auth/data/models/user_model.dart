import '../../../../resources/assets_manager.dart';

class User{
  String ?userName;
  String ?password;
  String ?image;
  String ?role;
  int ?notificationListId;
  User(this.userName,this.password,this.image,this.notificationListId,this.role);
  static List<User>u=[
    User("hassen","1234",AssetsManager.adminProfileImage,0,"admin"),
    User("ali","1234",AssetsManager.supervisorProfileImage,1,"supervisor"),
    User("ahmed","1234",AssetsManager.studentProfileImage,2,"student"),
  ];
  static User currentUser=u[0];
}
