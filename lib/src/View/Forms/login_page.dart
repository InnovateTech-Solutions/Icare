import 'package:flutter/material.dart';
import '../../constant/color.dart';
import '../../widget/pages_widget/Forms_widgets/login_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstants.mainScaffoldBackgroundColor,
        body: const SingleChildScrollView(
          child: Column(
            children: [
              LoginWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
