import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../utils/ui_helper.dart';

class AdminManage extends StatelessWidget {
  const AdminManage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Manage Users', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          UIHelper.customTextField(controller: TextEditingController(), hintText: 'Search faculty or students...', icon: Icons.search),
          const SizedBox(height: 16),
          const Text('Faculty Directory', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
          const SizedBox(height: 8),
          _buildUserCard('Shivam', 'Senior Professor (CS)', Icons.person, AppColors.secondary),
          _buildUserCard('Dr. Verma', 'HOD Mathematics', Icons.person, AppColors.secondary),
          const SizedBox(height: 24),
          const Text('Student Directory', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
          const SizedBox(height: 8),
          _buildUserCard('Dhruvi', 'Semester 4', Icons.school, AppColors.primaryLight),
          _buildUserCard('Rahul', 'Semester 6', Icons.school, AppColors.primaryLight),
          const SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget _buildUserCard(String name, String role, IconData icon, Color color) {
    return Card(
      color: Colors.white,
      elevation: 2,
      shadowColor: Colors.black.withOpacity(0.05),
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(backgroundColor: color.withOpacity(0.1), child: Icon(icon, color: color)),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.textPrimary)),
        subtitle: Text(role, style: const TextStyle(color: AppColors.textSecondary)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(icon: const Icon(Icons.edit, color: Colors.blue), onPressed: () {}),
            IconButton(icon: const Icon(Icons.delete, color: AppColors.priorityUrgent), onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
