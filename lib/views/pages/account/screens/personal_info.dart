import 'package:flutter/material.dart';
import 'package:warehouse/core/logic/cache_helper.dart';
import 'package:warehouse/core/logic/helper_mothods.dart';
import 'package:warehouse/core/widgets/app_image.dart';
import 'package:warehouse/core/widgets/custom_app_bar.dart';
import 'package:warehouse/views/auth/widgets/custom_textfield.dart';

class PersonalInfoView extends StatefulWidget {
  const PersonalInfoView({super.key});

  @override
  State<PersonalInfoView> createState() => _PersonalInfoViewState();
}

class _PersonalInfoViewState extends State<PersonalInfoView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();
  final TextEditingController _expirationController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();

  @override
  void initState() {
    _nameController.text = CacheHelper.getUsername() ?? '';
    _roleController.text = CacheHelper.getUserRole() ?? '';
    _expirationController.text = CacheHelper.getUserExpiration() ?? '';
    _departmentController.text = CacheHelper.getDepartment() ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Personal Info",
      ),
      body: SizedBox(
        width: double.infinity,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 26,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(11),
                      child: Hero(
                        tag: "11",
                        child: AppImage(
                          fit: BoxFit.cover,
                          CacheHelper.getUserId() == "1"
                              ? "assets/images/my_image.jpg"
                              : "assets/images/image_man.png",
                          height: 200,
                          width: 210,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  GestureDetector(
                    onTap: () {
                      showMessage(
                          message: "You cannot edit the Name",
                          type: MessageType.success);
                    },
                    child: AbsorbPointer(
                      absorbing: true,
                      child: CustomTextField(
                        isPersonal: true,
                        controller: _nameController,
                        labelText: "user name",
                        prefixIcon: Icons.account_circle_rounded,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  GestureDetector(
                    onTap: () {
                      showMessage(
                          message: "You cannot edit the Role",
                          type: MessageType.success);
                    },
                    child: AbsorbPointer(
                      absorbing: true,
                      child: CustomTextField(
                        isPersonal: true,
                        controller: _roleController,
                        labelText: "role",
                        prefixIcon: Icons.engineering_rounded,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  GestureDetector(
                    onTap: () {
                      showMessage(
                          message: "You cannot edit the Department",
                          type: MessageType.success);
                    },
                    child: AbsorbPointer(
                      absorbing: true,
                      child: CustomTextField(
                        isPersonal: true,
                        controller: _departmentController,
                        labelText: "department",
                        prefixIcon: Icons.people_alt_rounded,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  GestureDetector(
                    onTap: () {
                      showMessage(
                          message: "You cannot edit the Expiration",
                          type: MessageType.success);
                    },
                    child: AbsorbPointer(
                      absorbing: true,
                      child: CustomTextField(
                        isPersonal: true,
                        controller: _expirationController,
                        labelText: "expiration",
                        prefixIcon: Icons.access_time_rounded,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
