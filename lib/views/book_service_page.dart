import 'package:archline_flutter/utility/styles.dart';
import 'package:archline_flutter/view_models/book_service_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookServicePage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Styles.pageBgColor,
        body: Column(
          children: [
            Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios,
                        color: Styles.appBarTextColor),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  Text(
                      "BOOK SERVICE",
                      style: TextStyle(
                          color: Styles.appBarTextColor,
                          fontSize: Styles.appBarFontSize
                      )
                  ),
                ]
            ),

            Expanded(
              child: GetBuilder<BookServiceViewModel>(
                init: BookServiceViewModel(),
                builder: (vm) {
                  if(vm.isLoading.value)
                    return Center(child: CircularProgressIndicator(color:
                    Colors.white));
                  else
                    return SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
                          child: Wrap(
                            runSpacing: 10,
                            direction: Axis.horizontal,
                            alignment: WrapAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        labelText: 'First Name',
                                        filled: true,
                                        fillColor: Styles.textFieldFillColor,
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter first name';
                                        }
                                        return null;
                                      },
                                      onChanged: (fn) => vm.copyWith(firstName: fn),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        labelText: 'Last Name',
                                        filled: true,
                                        fillColor: Styles.textFieldFillColor,
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter last name';
                                        }
                                        return null;
                                      },
                                      onChanged: (ln) => vm.copyWith(lastName: ln),
                                    ),
                                  ),
                                ],
                              ),
                              TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Email',
                                    filled: true,
                                    fillColor: Styles.textFieldFillColor,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter email';
                                    }
                                    return null;
                                  },
                                  onChanged: (email) => vm.copyWith(email:
                                  email),
                                ),
                              TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Phone',
                                    filled: true,
                                    fillColor: Styles.textFieldFillColor,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter phone';
                                    }
                                    return null;
                                  },
                                  onChanged: (phone) => vm.copyWith(phone: phone),
                                ),
                              TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Message',
                                    filled: true,
                                    fillColor: Styles.textFieldFillColor,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter message';
                                    }
                                    return null;
                                  },
                                  onChanged: (message) => vm.copyWith(message:
                                  message),
                                ),
                              ElevatedButton(
                                  onPressed: () {
                                    // Validate returns true if the form is valid, or false otherwise.
                                    if (_formKey.currentState!.validate()) {
                                      vm.sendMail();
                                    }
                                  },
                                  child: Text(
                                      'SUBMIT',
                                      style: TextStyle(
                                        color: Styles.primaryButtonTextColor,
                                        fontSize: Styles.mediumFontSize,
                                      ),
                                  ),
                                style: ButtonStyle(
                                    padding: MaterialStateProperty.all(EdgeInsets.symmetric
                                      (vertical: 20.0, horizontal: 30.0)),
                                    backgroundColor: MaterialStateProperty.all
                                      (Styles.primaryColor),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10.0),
                                            side: BorderSide(color: Styles.primaryColor)
                                        )
                                    )
                                ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
