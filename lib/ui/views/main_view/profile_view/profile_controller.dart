import 'package:flutter/material.dart';
import 'package:foodordering/core/services/base_controller.dart';

class ProfileController extends BaseController {
  TextEditingController nameController =
          TextEditingController(text: 'Emilia Clarke'),
      emailController = TextEditingController(text: 'emiliaclarke@email.com'),
      mobileController = TextEditingController(text: 'emiliaclarke@email.com'),
      addressController =
          TextEditingController(text: 'No 23, 6th Lane, Colombo 03'),
      passwordController = TextEditingController(text: '**************'),
      confirmPasswordController = TextEditingController(text: '**************');
}
