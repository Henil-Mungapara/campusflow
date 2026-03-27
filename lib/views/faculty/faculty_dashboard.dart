import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/app_colors.dart';
import '../../utils/ui_helper.dart';
import '../../controllers/faculty_controller.dart';

class FacultyDashboard extends StatelessWidget {
  const FacultyDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<FacultyController>(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Faculty Dashboard', style: TextStyle(fontWeight: FontWeight.bold)),
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
            // Today's Classes Hero Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(20),
                boxShadow: AppColors.defaultShadow,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Today\'s Classes', style: TextStyle(color: Colors.white70, fontSize: 14)),
                  const SizedBox(height: 8),
                  Text('${controller.todayLectures} Lectures', style: const TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Icon(Icons.schedule, color: Colors.white, size: 16),
                      const SizedBox(width: 8),
                      Text('Next: ${controller.nextClass}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
                    ],
                  )
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Quick Tasks
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Quick Tasks', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                TextButton(onPressed: () {}, child: const Text('View All', style: TextStyle(color: AppColors.primary))),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(child: UIHelper.statCard(title: 'Pending', value: '${controller.pendingTasks}', icon: Icons.assignment_late, color: AppColors.primary)),
                const SizedBox(width: 16),
                Expanded(child: UIHelper.statCard(title: 'Completed', value: '${controller.completedTasks}', icon: Icons.check_circle, color: AppColors.primary)),
              ],
            ),

            const SizedBox(height: 24),
            const Text('Department Updates', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
            const SizedBox(height: 12),

            _buildUpdateCard('Staff Meeting', 'Today at 4:00 PM in Conference Room A.', Icons.groups),
            _buildUpdateCard('New Syllabus Guidelines', 'Check email for the updated curriculum.', Icons.menu_book),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildUpdateCard(String title, String subtitle, IconData icon) {
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
          decoration: BoxDecoration(color: AppColors.primary.withValues(alpha: 0.1), shape: BoxShape.circle),
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
