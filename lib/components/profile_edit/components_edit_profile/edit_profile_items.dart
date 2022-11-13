import 'package:flutter/material.dart';
import 'package:profile_edit_mock/components_edit_profile/custom_text_field.dart';

import 'save_button.dart';
import 'title_specs.dart';

class EditProfileItems extends StatelessWidget {
  const EditProfileItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        appBar: AppBar(
          toolbarHeight: 70.0,
          title: Center(
            child: Text(
              'Edit Profile',
              style: TextStyle(color: Colors.black, fontSize: 30.0),
            ),
          ),
          backgroundColor: Color(0xFFFFFFFF),
          elevation: 0,
          leading: Container(
            decoration: BoxDecoration(
              color: Color(0xFFE7F1F8),
              borderRadius: BorderRadius.circular(15),
            ),
            margin: EdgeInsets.only(left: 10.0, top: 10.0),
            width: 50.0,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back, color: Color(0xFF2B30B4)),
            ),
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 10.0, top: 10.0),
              width: 50.0,
              decoration: BoxDecoration(
                color: Color(0xFFE7F1F8),
                borderRadius: BorderRadius.circular(15),
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.settings,
                  color: Color(0xFF2B30B4),
                ),
              ),
            )
          ],
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                        width: 130.0,
                        height: 130.0,
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 3.0,
                              color: Colors.indigo,
                            ),
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 8,
                                blurRadius: 2,
                                color: Colors.indigo.withOpacity(0.3),
                                // offset: Offset(0, 5),
                              )
                            ],
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://i.redd.it/jeuusd992wd41.jpg'),
                            ))),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 2,
                            color: Colors.white,
                          ),
                          color: Colors.indigo,
                        ),
                        height: 40.0,
                        width: 40.0,
                        child: Icon(Icons.edit, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
              // title_specs(),

              text_title(
                textbox_title: 'Full Name',
              ),
              CustomeTextField(
                hintText: 'Jack Sparrow',
              ),
              text_title(
                textbox_title: 'Telephone',
              ),
              CustomeTextField(
                hintText: '876-123-4567',
              ),
              text_title(
                textbox_title: 'Email',
              ),
              CustomeTextField(
                hintText: 'sparrow@gmail.com',
              ),
              text_title(
                textbox_title: 'Password',
              ),
              CustomeTextField(
                hintText: 'Please Enter your Password',
              ),
              Container(
                padding: EdgeInsets.only(right: 15.0, left: 15.0),
                child: Row(
                  children: [
                    Expanded(
                        child: SaveButton(
                      onTap: () {},
                      buttonTitle: 'Cancel',
                      buttonMainColor: Colors.red,
                    )),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                        child: SaveButton(
                      onTap: () {},
                      buttonTitle: 'Update',
                      buttonMainColor: Color(0xFF1B75BC),
                    )),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
