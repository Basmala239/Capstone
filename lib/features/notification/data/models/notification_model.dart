class NotificationModel {
  int id;
  String name;
  String description;
  String? image;
  String time;
  bool read;
  NotificationModel({required this.id,this.image,required this.name,required this.time,required this.description,required this.read});
  static List<NotificationModel> notifications=[
    NotificationModel(id:1,image: null,name: "Design team", description: 'Wire frame  submitted for approval',time: '10:00 pm',read: true),
    NotificationModel(id:2,image: null,name: "Design team", description: 'Wire frame  submitted for approval',time: '10:00 pm',read: false),
    NotificationModel(id:3,image: null,name: "Design team", description: 'Wire frame  submitted for approval',time: '10:00 pm',read: true),
    NotificationModel(id:4,image: null,name: "Design team", description: 'Wire frame  submitted for approval',time: '10:00 pm',read: false),
    NotificationModel(id:5,image: null,name: "Design team", description: 'Wire frame  submitted for approval',time: '10:00 pm',read: false),
  ];
}