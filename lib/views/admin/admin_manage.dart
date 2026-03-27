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
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          UIHelper.customTextField(controller: TextEditingController(), hintText: 'Search faculty or students...', icon: Icons.search),
          const SizedBox(height: 20),
          _buildSectionHeader('Faculty Directory'),
          const SizedBox(height: 8),
          _buildUserCard('Shivam', 'Senior Professor (CS)', Icons.person),
          _buildUserCard('Dr. Verma', 'HOD Mathematics', Icons.person),
          const SizedBox(height: 24),
          _buildSectionHeader('Student Directory'),
          const SizedBox(height: 8),
          _buildUserCard('Dhruvi', 'Semester 4', Icons.school),
          _buildUserCard('Rahul', 'Semester 6', Icons.school),
          const SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
    );
  }

  Widget _buildUserCard(String name, String role, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppColors.defaultShadow,
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: AppColors.primary.withValues(alpha: 0.1),
          child: Icon(icon, color: AppColors.primary),
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.textPrimary)),
        subtitle: Text(role, style: const TextStyle(color: AppColors.textSecondary)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(icon: const Icon(Icons.edit_outlined, color: AppColors.primary), onPressed: () {}),
            IconButton(icon: const Icon(Icons.delete_outline, color: AppColors.priorityUrgent), onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
