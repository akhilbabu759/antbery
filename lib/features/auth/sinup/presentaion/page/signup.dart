import 'dart:developer';
import 'dart:io';

import 'package:antbery/config/them/pro_black.dart';
import 'package:antbery/features/auth/sinup/data/model/signup_model.dart';

import 'package:antbery/features/auth/sinup/presentaion/bloc/image_pic/image_pick_bloc.dart';
import 'package:antbery/features/auth/sinup/presentaion/bloc/signup/signup_bloc.dart';
import 'package:antbery/features/bottonavigation/page/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quickalert/quickalert.dart';

class BlSignUp extends StatelessWidget {
  const BlSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> _getImageFromGallery() async {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      context.read<ImagePickBloc>().add(OnvalueChange(image!));
    }

    TextEditingController name = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController address = TextEditingController();
    TextEditingController pin = TextEditingController();
    TextEditingController phone = TextEditingController();
    late File pic;
    TextEditingController password = TextEditingController();

    return Scaffold(
      backgroundColor: ProBlackStyle().grayblackProblack,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  _getImageFromGallery();
                },
                child: CircleAvatar(
                  radius: MediaQuery.of(context).size.width * 0.13,
                  child: BlocBuilder<ImagePickBloc, ImagePickState>(
                    builder: (context, state) {
                      if (state is ImagePicked) {
                        pic = File(state.image!.path);
                        return state.image == null
                            ? Text('No image selected.')
                            : CircleAvatar(
                                radius:
                                    MediaQuery.of(context).size.width * 0.13,
                                backgroundImage:
                                    FileImage(File(state.image!.path))
                                //  Image.file(
                                //   File(state.image!.path),
                                //   fit: BoxFit.fill,
                                // ),
                                );
                      }
                      return Text('Select Image');
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // Username TextField
              ClipRRect(
                borderRadius: BorderRadius.circular(18.0),
                child: Container(
                  height: ProBlackStyle().bappSize(context).height * 0.064,
                  width: ProBlackStyle().bappSize(context).width * 0.6,
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  color: ProBlackStyle().blackCloProBlack,
                  child: TextField(
                    style: TextStyle(color: Color.fromARGB(255, 176, 176, 176)),
                    controller: name,
                    decoration: InputDecoration(
                      fillColor: ProBlackStyle().blackCloProBlack,
                      filled: true,
                      hintText: 'Username',
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 176, 176, 176)),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              // Password TextField
              ClipRRect(
                borderRadius: BorderRadius.circular(18.0),
                child: Container(
                  height: ProBlackStyle().bappSize(context).height * 0.064,
                  width: ProBlackStyle().bappSize(context).width * 0.6,
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  color: ProBlackStyle().blackCloProBlack,
                  child: TextField(
                    style: TextStyle(color: Color.fromARGB(255, 176, 176, 176)),
                    controller: email,
                    obscureText: false,
                    decoration: InputDecoration(
                      fillColor: ProBlackStyle().blackCloProBlack,
                      filled: true,
                      hintText: 'Email',
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 177, 177, 177)),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              // Password TextField
              ClipRRect(
                borderRadius: BorderRadius.circular(18.0),
                child: Container(
                  height: ProBlackStyle().bappSize(context).height * 0.064,
                  width: ProBlackStyle().bappSize(context).width * 0.6,
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  color: ProBlackStyle().blackCloProBlack,
                  child: TextField(
                    style: TextStyle(color: Color.fromARGB(255, 176, 176, 176)),
                    controller: password,
                    obscureText: true,
                    decoration: InputDecoration(
                      fillColor: ProBlackStyle().blackCloProBlack,
                      filled: true,
                      hintText: 'Password',
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 177, 177, 177)),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              // Password TextField
              ClipRRect(
                borderRadius: BorderRadius.circular(18.0),
                child: Container(
                  height: ProBlackStyle().bappSize(context).height * 0.064,
                  width: ProBlackStyle().bappSize(context).width * 0.6,
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  color: ProBlackStyle().blackCloProBlack,
                  child: TextField(
                    style: TextStyle(color: Color.fromARGB(255, 176, 176, 176)),
                    controller: address,
                    obscureText: false,
                    decoration: InputDecoration(
                      fillColor: ProBlackStyle().blackCloProBlack,
                      filled: true,
                      hintText: 'address',
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 177, 177, 177)),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              // Password TextField
              ClipRRect(
                borderRadius: BorderRadius.circular(18.0),
                child: Container(
                  height: ProBlackStyle().bappSize(context).height * 0.064,
                  width: ProBlackStyle().bappSize(context).width * 0.6,
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  color: ProBlackStyle().blackCloProBlack,
                  child: TextField(
                    style: TextStyle(color: Color.fromARGB(255, 176, 176, 176)),
                    controller: pin,
                    obscureText: false,
                    decoration: InputDecoration(
                      fillColor: ProBlackStyle().blackCloProBlack,
                      filled: true,
                      hintText: 'pin',
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 177, 177, 177)),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              // Password TextField
              ClipRRect(
                borderRadius: BorderRadius.circular(18.0),
                child: Container(
                  height: ProBlackStyle().bappSize(context).height * 0.064,
                  width: ProBlackStyle().bappSize(context).width * 0.6,
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  color: ProBlackStyle().blackCloProBlack,
                  child: TextField(
                    style: TextStyle(color: Color.fromARGB(255, 176, 176, 176)),
                    controller: phone,
                    obscureText: true,
                    decoration: InputDecoration(
                      fillColor: ProBlackStyle().blackCloProBlack,
                      filled: true,
                      hintText: 'Phone',
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 177, 177, 177)),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // Login Button
              ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              18.0), // Set your desired border radius
                        ),
                      ),
                      minimumSize: MaterialStatePropertyAll(Size(
                          ProBlackStyle().bappSize(context).width * 0.6,
                          ProBlackStyle().bappSize(context).height * 0.064)),
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(196, 136, 78, 2))),
                  onPressed: () {
                    log('clickon');
                    // BlocBuilder<ImagePickBloc, ImagePickState>(
                    // builder: (context, state) {
                    //   log('clickon 1');
                    //   if (state is ImagePicked) {
                    //     log('clickon 2');
                    // pic = File(state.image!.path);
                    if (address.text != '' &&
                        email.text != '' &&
                        name.text != '' &&
                        phone.text != '' &&
                        pic != null &&
                        pin.text != '' &&
                        password.text != '') {
                      log(pic.path.toString());
                      final Signupmodel data = Signupmodel(
                          address: address.text,
                          email: email.text,
                          name: name.text,
                          phone: phone.text,
                          pic: pic,
                          pin: pin.text,
                          password: password.text);
                      context.read<SignupBloc>().add(OnClicked(data));
                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Bottomnavigation(),), (route) => false);
                    }else{
                      QuickAlert.show(
                            context: context,
                            type: QuickAlertType.error,
                            title: 'Oops...',
                            text: 'Enter correct details',
                          );
                    }
                    // }
                    // return Text('');
                    // });
                    log('clickon 4');
                  },
                  child: Center(
                    child: Text('SignUp'),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
