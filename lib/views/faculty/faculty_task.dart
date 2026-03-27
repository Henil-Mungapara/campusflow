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
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Pending Grading', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
          const SizedBox(height: 12),
          _buildTaskCard('CS-101 Mid-term Papers', '40 papers pending', AppColors.priorityUrgent),
          _buildTaskCard('CS-201 Assignments', '12 submissions pending review', AppColors.priorityMedium),
          const SizedBox(height: 24),
          const Text('Administrative Tasks', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
          const SizedBox(height: 12),
          _buildTaskCard('Submit monthly report to HOD', 'Due in 2 days', AppColors.priorityLow),
          const SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget _buildTaskCard(String title, String subtitle, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppColors.defaultShadow,
      ),
      child: CheckboxListTile(
        value: false,
        onChanged: (val) {},
        activeColor: color,
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.textPrimary)),
        subtitle: Text(subtitle, style: const TextStyle(color: AppColors.textSecondary)),
        secondary: CircleAvatar(backgroundColor: color.withOpacity(0.1), child: Icon(Icons.assignment, color: color)),
      ),
    );
  }
}
