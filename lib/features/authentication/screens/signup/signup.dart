import 'package:flutter/material.dart';
import 'package:flutter_store_mobile/features/authentication/screens/login/form_divider.dart';
import 'package:flutter_store_mobile/features/authentication/screens/login/login_footer.dart';
import 'package:flutter_store_mobile/utils/constants/colors.dart';
import 'package:flutter_store_mobile/utils/constants/sizes.dart';
import 'package:flutter_store_mobile/utils/constants/text_string.dart';
import 'package:flutter_store_mobile/utils/helpers/helper_function.dart';
import 'package:iconsax/iconsax.dart';

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
                Form(
                    child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            expands: false,
                            decoration: const InputDecoration(
                                labelText: TTexts.firstName,
                                prefixIcon: Icon(Iconsax.user)),
                          ),
                        ),
                        const SizedBox(width: TSizes.spaceBtwInputFields),
                        Expanded(
                          child: TextFormField(
                            expands: false,
                            decoration: const InputDecoration(
                                labelText: TTexts.lastName,
                                prefixIcon: Icon(Iconsax.user)),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: TSizes.spaceBtwInputFields),

                    //username
                    TextFormField(
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: TTexts.username,
                          prefixIcon: Icon(Iconsax.user_edit)),
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields),

                    //email
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: TTexts.email,
                          prefixIcon: Icon(Iconsax.direct)),
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields),

                    //Phonenumber
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: TTexts.phoneNo,
                          prefixIcon: Icon(Iconsax.call)),
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields),

                    ///Password
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: TTexts.password,
                        prefixIcon: Icon(Iconsax.password_check),
                        suffixIcon: Icon(Iconsax.eye_slash),
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields),

                    ///Dieu kien checkbox
                    Row(
                      children: [
                        SizedBox(
                            width: 24,
                            height: 24,
                            child:
                                Checkbox(value: true, onChanged: (value) {})),
                        const SizedBox(width: TSizes.spaceBtwItems),
                        Expanded(
                          child: Text.rich(
                            TextSpan(children: [
                              TextSpan(
                                  text: '${TTexts.iAgreeTo} ',
                                  style: Theme.of(context).textTheme.bodySmall),
                              TextSpan(
                                  text: TTexts.privacyPolicy,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .apply(
                                        color: dark
                                            ? TColors.white
                                            : TColors.primary,
                                        decoration: TextDecoration.underline,
                                        decorationColor: dark
                                            ? TColors.white
                                            : TColors.primary,
                                      )),
                              TextSpan(
                                  text: ' ${TTexts.and} ',
                                  style: Theme.of(context).textTheme.bodySmall),
                              TextSpan(
                                  text: TTexts.termsOfUse,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .apply(
                                        color: dark
                                            ? TColors.white
                                            : TColors.primary,
                                        decoration: TextDecoration.underline,
                                        decorationColor: dark
                                            ? TColors.white
                                            : TColors.primary,
                                      )),
                            ]),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: TSizes.spaceBtwSections),

                    ///Sign up button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {},
                          child: const Text(TTexts.createAccount)),
                    ),
                  ],
                )),
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
