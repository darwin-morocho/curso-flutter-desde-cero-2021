import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_ux/src/data/models/user.dart';
import 'package:ui_ux/src/helpers/get.dart';
import 'package:ui_ux/src/utils/font_styles.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Get.i.find<User>();
    return Container(
      color: CupertinoColors.systemGroupedBackground,
      child: ListView(
        children: [
          SizedBox(height: 20),
          Align(
            child: ClipOval(
              child: CachedNetworkImage(
                width: 200,
                height: 200,
                fit: BoxFit.cover,
                imageUrl:
                    "https://www.nj.com/resizer/h8MrN0-Nw5dB5FOmMVGMmfVKFJo=/450x0/smart/cloudfront-us-east-1.images.arcpublishing.com/advancelocal/SJGKVE5UNVESVCW7BBOHKQCZVE.jpg",
              ),
            ),
          ),
          CupertinoFormSection.insetGrouped(
            header: Text("User information"),
            margin: EdgeInsets.all(15).copyWith(top: 0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            children: [
              CupertinoFormRow(
                prefix: Text(
                  "ID: ",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: Text(user.id),
              ),
              CupertinoFormRow(
                prefix: Text(
                  "Name: ",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: Text("${user.name} ${user.lastname}"),
              ),
              CupertinoTextFormFieldRow(
                prefix: Text(
                  "Email: ",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                initialValue: user.email,
                textAlign: TextAlign.right,
                style: FontStyles.normal.copyWith(
                  color: Colors.black,
                ),
              ),
              CupertinoFormRow(
                prefix: Text(
                  "Birthday: ",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: Text(
                  user.birthday.toString(),
                ),
              )
            ],
          ),
          CupertinoFormSection.insetGrouped(
            header: Text("Payment methods"),
            children: [
              CupertinoFormRow(
                prefix: Text(
                  "Credit cards",
                  style: TextStyle(color: Colors.black),
                ),
                child: CupertinoButton(
                  onPressed: () {},
                  minSize: 20,
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text("Show 〉"),
                ),
              ),
              CupertinoFormRow(
                prefix: Text(
                  "Paypal",
                  style: TextStyle(color: Colors.black),
                ),
                child: CupertinoButton(
                  onPressed: () {},
                  minSize: 20,
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text("test@paypal.com 〉"),
                ),
              ),
            ],
          ),
          CupertinoFormSection.insetGrouped(
            header: Text("My Account"),
            children: [
              CupertinoFormRow(
                prefix: Text(
                  "Remove or hide",
                  style: TextStyle(color: Colors.black),
                ),
                child: CupertinoButton(
                  onPressed: () {},
                  minSize: 20,
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text("Set confirguration"),
                ),
              ),
              CupertinoFormRow(
                prefix: Text(
                  "Session",
                  style: TextStyle(color: Colors.black),
                ),
                child: CupertinoButton(
                  onPressed: () {},
                  minSize: 20,
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    "Sign Out",
                    style: TextStyle(color: Colors.redAccent),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
