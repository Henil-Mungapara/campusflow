import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class FacultyTask extends StatelessWidget {
  const FacultyTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Tasks & Assignments', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text('Pending Grading', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
          const SizedBox(height: 12),
          _buildTaskCard('CS-101 Mid-term Papers', '40 papers pending', false),
          _buildTaskCard('CS-201 Assignments', '12 submissions pending review', false),
          const SizedBox(height: 24),
          const Text('Administrative Tasks', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
          const SizedBox(height: 12),
          _buildTaskCard('Submit monthly report to HOD', 'Due in 2 days', false),
          const SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget _buildTaskCard(String title, String subtitle, bool isCompleted) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppColors.defaultShadow,
      ),
      child: CheckboxListTile(
        value: isCompleted,
        onChanged: (val) {},
        activeColor: AppColors.primary,
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: AppColors.textPrimary)),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(subtitle, style: const TextStyle(color: AppColors.textSecondary, fontSize: 13)),
        ),
        secondary: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(color: AppColors.primary.withValues(alpha: 0.1), shape: BoxShape.circle),
          child: const Icon(Icons.assignment, color: AppColors.primary, size: 22),
        ),
      ),
    );
  }
}
