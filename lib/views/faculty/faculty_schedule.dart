import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class FacultySchedule extends StatelessWidget {
  const FacultySchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('My Schedule', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Today\'s Classes', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
          const SizedBox(height: 12),
          _buildScheduleCard('10:30 AM - 11:30 AM', 'CS-101 Data Structures', 'Room 304', AppColors.primaryLight),
          _buildScheduleCard('12:00 PM - 01:00 PM', 'CS-201 Automata Theory', 'Lab 2', AppColors.secondary),
          _buildScheduleCard('02:30 PM - 03:30 PM', 'CS-302 AI & ML', 'Room 101', AppColors.accent),
          const SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget _buildScheduleCard(String time, String subject, String location, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppColors.defaultShadow,
        border: Border(left: BorderSide(color: color, width: 4)),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        title: Text(subject, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.textPrimary)),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 6.0),
          child: Row(
            children: [
              Icon(Icons.schedule, size: 16, color: AppColors.textSecondary),
              const SizedBox(width: 4),
              Text(time, style: const TextStyle(color: AppColors.textSecondary)),
              const SizedBox(width: 16),
              Icon(Icons.location_on, size: 16, color: AppColors.textSecondary),
              const SizedBox(width: 4),
              Text(location, style: const TextStyle(color: AppColors.textSecondary)),
            ],
          ),
        ),
      ),
    );
  }
}
