import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/app_colors.dart';
import '../../utils/ui_helper.dart';
import '../../controllers/admin_controller.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AdminController>(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Admin Dashboard', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child: UIHelper.statCard(title: 'Students', value: '${controller.totalStudents}', icon: Icons.group, color: AppColors.primary)),
                const SizedBox(width: 16),
                Expanded(child: UIHelper.statCard(title: 'Faculty', value: '${controller.totalFaculty}', icon: Icons.person_outline, color: AppColors.primary)),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(child: UIHelper.statCard(title: 'Notices', value: '${controller.activeNotices}', icon: Icons.campaign, color: AppColors.primary)),
                const SizedBox(width: 16),
                Expanded(child: UIHelper.statCard(title: 'Events', value: '${controller.upcomingEvents}', icon: Icons.event, color: AppColors.primary)),
              ],
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Recent Activity', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                TextButton(onPressed: () {}, child: const Text('View All', style: TextStyle(color: AppColors.primary))),
              ],
            ),
            const SizedBox(height: 8),
            _buildActivityCard('New Student Registered', 'Aarav Patel (Computer Science)', Icons.person_add),
            _buildActivityCard('Urgent Notice Posted', 'By Principal regarding holidays', Icons.campaign),
            _buildActivityCard('Faculty Leave Request', 'Shivam asked for 2 days leave', Icons.event_busy),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityCard(String title, String subtitle, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppColors.defaultShadow,
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: AppColors.primary, size: 22),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: AppColors.textPrimary)),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(subtitle, style: const TextStyle(color: AppColors.textSecondary, fontSize: 13)),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.textLight),
      ),
    );
  }
}
