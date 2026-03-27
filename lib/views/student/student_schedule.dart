import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class StudentSchedule extends StatelessWidget {
  const StudentSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Class Schedule', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text('Today', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
          const SizedBox(height: 12),
          _buildScheduleCard('09:00 AM', '10:00 AM', 'Database Management', 'Room 201'),
          _buildScheduleCard('10:30 AM', '11:30 AM', 'Data Structures', 'Room 304'),
          _buildScheduleCard('01:00 PM', '03:00 PM', 'Computer Networks Lab', 'Net Lab 1'),
          const SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget _buildScheduleCard(String startTime, String endTime, String subject, String location) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppColors.defaultShadow,
        border: const Border(left: BorderSide(color: AppColors.primary, width: 4)),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        leading: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(startTime, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.primary)),
              Text(endTime, style: const TextStyle(fontSize: 10, color: AppColors.textSecondary)),
            ],
          ),
        ),
        title: Text(subject, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: AppColors.textPrimary)),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Row(
            children: [
              const Icon(Icons.location_on_outlined, size: 14, color: AppColors.textSecondary),
              const SizedBox(width: 4),
              Text(location, style: const TextStyle(color: AppColors.textSecondary, fontSize: 13)),
            ],
          ),
        ),
      ),
    );
  }
}
