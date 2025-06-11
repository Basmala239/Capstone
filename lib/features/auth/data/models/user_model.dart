import '../../../../resources/assets_manager.dart';

class User{
  String ?userName;
  String ?password;
  String ?image;
  String ?role;
  int ?notificationList_id;
  User(this.userName,this.password,this.image,this.notificationList_id,this.role);
  List<User>u=[
    User("hassen","1234",AssetsManager.adminProfileImage,0,"admin"),
    User("ali","1234",AssetsManager.supervisorProfileImage,1,"supervisor"),
    User("ahmed","1234",AssetsManager.studentProfileImage,2,"student"),
  ];
}