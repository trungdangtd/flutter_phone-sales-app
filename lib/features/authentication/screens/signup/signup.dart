import 'package:flutter/material.dart';
import 'package:flutter_store_mobile/features/authentication/screens/login/form_divider.dart';
import 'package:flutter_store_mobile/features/authentication/screens/login/login_footer.dart';
import 'package:flutter_store_mobile/features/authentication/screens/signup/signup_form.dart';
import 'package:flutter_store_mobile/utils/constants/sizes.dart';
import 'package:flutter_store_mobile/utils/constants/text_string.dart';
import 'package:flutter_store_mobile/utils/helpers/helper_function.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // di chuyen text qua trai
              children: [
                //Title
                Text(TTexts.signupTitle,
                    style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: TSizes.spaceBtwSections),

                //Form
                const TSignupForm(),
                const SizedBox(height: TSizes.spaceBtwSections),

                //divider
                TFormDivider(dark: dark),
                const SizedBox(height: TSizes.spaceBtwSections),

                //Social button
                const TSocialButtons(),
                const SizedBox(height: TSizes.spaceBtwSections),
              ],
            ),
          ),
        ));
  }
}
