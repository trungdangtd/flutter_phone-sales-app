import 'package:flutter/material.dart';
import 'package:flutter_store_mobile/common/style/spacing_styles.dart';
import 'package:flutter_store_mobile/features/authentication/screens/login/form_divider.dart';
import 'package:flutter_store_mobile/features/authentication/screens/login/login_footer.dart';
import 'package:flutter_store_mobile/features/authentication/screens/login/login_form.dart';
import 'package:flutter_store_mobile/features/authentication/screens/login/login_header.dart';
import 'package:flutter_store_mobile/utils/constants/sizes.dart';
import 'package:flutter_store_mobile/utils/helpers/helper_function.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark =
        THelperFunctions.isDarkMode(context); //biến để sd logo chế độ tối

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TspacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              //Logo - sub
              const TLoginHeader(),

              ///Form
              const TLoginForm(),

              //Divider
              TFormDivider(dark: dark),
              const SizedBox(height: TSizes.spaceBtwSections),

              //footer
              const TSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
