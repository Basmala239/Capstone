import 'package:flutter/cupertino.dart';

class ItemModel{
  Icon? itemIcon;
  String itemTitle="";
  Function itemOnTap=(){};
  ItemModel(this.itemIcon,this.itemTitle,this.itemOnTap);
}