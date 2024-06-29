import 'package:bhargav_practicle/src/Constants/app_images.dart';
import 'package:bhargav_practicle/src/Controller/AlertController/logout_dialog.dart';
import 'package:bhargav_practicle/src/Controller/custom_text_field.dart';
import 'package:bhargav_practicle/src/Element/padding_class.dart';
import 'package:bhargav_practicle/src/Element/textfield_controller.dart';
import 'package:bhargav_practicle/src/Style/color.dart';
import 'package:bhargav_practicle/src/Style/text_style.dart';
import 'package:bhargav_practicle/src/Utils/GetxController/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  final profileController = Get.put(ProfileController());

  @override
  void initState() {
    profileController.initState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile Screen")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            paddingTop(20),
            customTextField("Name", profileNameController, (value) => null, FocusNode(), TextInputAction.done, TextInputType.text, "", context, readOnly: true),
            paddingTop(20),
            customTextField("Email", profileEmailController, (value) => null, FocusNode(), TextInputAction.done, TextInputType.text, "", context, readOnly: true),
            paddingTop(20),
            GestureDetector(
              onTap: (){showLogoutDialog(context);},
              child: Row(
                children: [
                  Image.asset(AppImages.logoutIcon, height: 30, width: 30,),
                  paddingLeft(15),
                  Text("Logout", style: TextStyleTheme.customTextStyle(AppTextColors.black, 16, FontWeight.w500),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
