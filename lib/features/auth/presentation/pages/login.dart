import 'package:antbery/config/them/app_style.dart';
import 'package:antbery/features/auth/presentation/pages/widget/top_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const TopContainer(),
        Gap(MediaQuery.of(context).size.height * 0.09),
        Expanded(
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.94,
                decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.only(topRight: Radius.circular(100)),
                    color: AppStryle().bluMin),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Sign In',
                          style: GoogleFonts.italiana(
                              textStyle: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.08,
                                  color: AppStryle().whiteCle
                                  // Additional styling options
                                  )),
                          textAlign: TextAlign.center,
                        ),
                        Gap(MediaQuery.of(context).size.height * 0.08),
                        TextFormField( textAlign: TextAlign.center,
                          // controller: _textController,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                        Gap(MediaQuery.of(context).size.height * 0.02),
                        TextFormField(
                          textAlign: TextAlign.center,
                          // controller: _textController,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                        Gap(MediaQuery.of(context).size.height * 0.04),
                        Divider(
                          color: AppStryle().whiteCle,
                          thickness: 1.5,
                        ),
                        Gap(10),
                        CircleAvatar(
                          backgroundColor: AppStryle().whiteCle,
                          radius: MediaQuery.of(context).size.height * 0.028,
                          child: Image.network(
                              'https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png'),
                        )
                      ]),
                ),
              ),
              Positioned(
                top: 22.5,
                right: 18,
                child: CircleAvatar(
                  radius: MediaQuery.of(context).size.width * 0.05,
                  backgroundColor: AppStryle().whiteCle,
                  child: CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.04,
                    backgroundColor: AppStryle().bluMin,
                  ),
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
