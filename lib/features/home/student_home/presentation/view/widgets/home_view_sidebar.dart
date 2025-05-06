import 'package:capstone/resources/color_manager.dart';
import 'package:flutter/material.dart';

import '../../../../../../resources/text_styles.dart';
import '../../../data/model/list_item.dart';

Widget SideBar(BuildContext context,List<ItemModel> list)=> Drawer(
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildHeader(context),
          buildMenuItem(context,list),
        ],
      ),
    ),
);

Widget buildMenuItem(BuildContext context,List<ItemModel> list) {
  return Padding(padding:EdgeInsets.all(24),
      child: Column(
          children: [
            ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) =>
                    Column(
                        children: [
                          ListTile(
                              leading: list[index].itemIcon,
                              title: Text(list[index].itemTitle),
                              onTap: () {
                                list[index].itemOnTap;
                              }
                          ),
                          Divider(color: ColorManager.black,)
                        ]
                    )
            )
          ]
      )
  );
}
Widget buildHeader(BuildContext context) {
  return Container(
        padding:EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          color: ColorManager.blueEo,
          child: Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 30,
              // child:user.image!=null ?
              // Image.network(user.image!):
              // Text(user.name[0].toUpperCase(),
              //   style: TextStyles.blue4D18w700,),
            ),
          ]
      )

  );
}
