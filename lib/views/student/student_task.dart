import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class StudentTask extends StatelessWidget {
  const StudentTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('My Assignments', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Pending Submissions', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
          const SizedBox(height: 12),
          _buildTaskCard('DBMS Project Proposal', 'Due tomorrow at 11:59 PM', AppColors.priorityUrgent),
          _buildTaskCard('CN Lab Assignment 4', 'Due in 3 days', AppColors.priorityMedium),
          const SizedBox(height: 24),
          const Text('Completed', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
          const SizedBox(height: 12),
          _buildTaskCard('Data Structures Prep Quiz', 'Submitted', AppColors.priorityLow, isCompleted: true),
          const SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget _buildTaskCard(String title, String subtitle, Color color, {bool isCompleted = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppColors.defaultShadow,
      ),
      child: CheckboxListTile(
        value: isCompleted,
        onChanged: (val) {},
        activeColor: color,
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.textPrimary, decoration: isCompleted ? TextDecoration.lineThrough : null)),
        subtitle: Text(subtitle, style: const TextStyle(color: AppColors.textSecondary)),
        secondary: CircleAvatar(backgroundColor: color.withOpacity(0.1), child: Icon(isCompleted ? Icons.check_circle : Icons.assignment, color: color)),
      ),
    );
  }
}
