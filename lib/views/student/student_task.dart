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
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text('Pending Submissions', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
          const SizedBox(height: 12),
          _buildTaskCard('DBMS Project Proposal', 'Due tomorrow at 11:59 PM', false),
          _buildTaskCard('CN Lab Assignment 4', 'Due in 3 days', false),
          const SizedBox(height: 24),
          const Text('Completed', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
          const SizedBox(height: 12),
          _buildTaskCard('Data Structures Prep Quiz', 'Submitted', true),
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
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: AppColors.textPrimary,
            decoration: isCompleted ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(subtitle, style: const TextStyle(color: AppColors.textSecondary, fontSize: 13)),
        ),
        secondary: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(color: AppColors.primary.withValues(alpha: 0.1), shape: BoxShape.circle),
          child: Icon(isCompleted ? Icons.check_circle : Icons.assignment, color: AppColors.primary, size: 22),
        ),
      ),
    );
  }
}
