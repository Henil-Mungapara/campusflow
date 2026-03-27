import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../utils/ui_helper.dart';

class StudentRegistration extends StatelessWidget {
  const StudentRegistration({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Student Registration', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            UIHelper.customTextField(controller: TextEditingController(), hintText: 'Full Name', icon: Icons.person),
            const SizedBox(height: 16),
            UIHelper.customTextField(controller: TextEditingController(), hintText: 'Enrollment Number', icon: Icons.badge),
            const SizedBox(height: 16),
            UIHelper.customTextField(controller: TextEditingController(), hintText: 'Email Address', icon: Icons.email),
            const SizedBox(height: 16),
            UIHelper.customTextField(controller: TextEditingController(), hintText: 'Phone Number', icon: Icons.phone),
            const SizedBox(height: 16),
            UIHelper.customTextField(controller: TextEditingController(), hintText: 'Course / Branch', icon: Icons.book),
            const SizedBox(height: 16),
            UIHelper.customTextField(controller: TextEditingController(), hintText: 'Current Semester', icon: Icons.timeline),
            const SizedBox(height: 32),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Student Registered Successfully!')));
                Navigator.pop(context);
              },
              child: const Text('Register Student', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
