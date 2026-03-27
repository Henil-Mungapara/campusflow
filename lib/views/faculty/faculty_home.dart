import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/app_colors.dart';
import '../../utils/ui_helper.dart';
import '../../controllers/faculty_controller.dart';
import 'faculty_dashboard.dart';
import 'faculty_schedule.dart';
import 'faculty_task.dart';
import 'faculty_profile.dart';

class FacultyHome extends StatelessWidget {
  const FacultyHome({super.key});

  final List<Widget> _pages = const [
    FacultyDashboard(),
    FacultySchedule(),
    FacultyTask(),
    FacultyProfile(),
  ];

  void _showAddDialog(BuildContext context) {
    UIHelper.showCustomDialog(
      context: context,
      title: 'Create',
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildDialogOption(context, Icons.event, 'Add Event', () {
            Navigator.pop(context);
            _showAddForm(context, 'Event');
          }),
          const Divider(height: 1),
          _buildDialogOption(context, Icons.campaign, 'Add Notice', () {
            Navigator.pop(context);
            _showAddForm(context, 'Notice');
          }),
        ],
      ),
    );
  }

  void _showAddForm(BuildContext context, String title) {
    final TextEditingController titleCtrl = TextEditingController();
    final TextEditingController descCtrl = TextEditingController();

    UIHelper.showCustomDialog(
      context: context,
      title: 'New $title',
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          UIHelper.customTextField(controller: titleCtrl, hintText: '$title Title'),
          UIHelper.customTextField(controller: descCtrl, hintText: 'Description'),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel', style: TextStyle(color: AppColors.textSecondary)),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
          onPressed: () {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$title created successfully!')));
          },
          child: const Text('Post', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }

  Widget _buildDialogOption(BuildContext context, IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primary),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500, color: AppColors.textPrimary)),
      onTap: onTap,
    );
  }

  Future<bool> _onWillPop(BuildContext context) async {
    bool? exitResult = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Exit App?', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
        content: const Text('Are you sure you want to leave Campus Companion?', style: TextStyle(color: AppColors.textSecondary)),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel', style: TextStyle(color: AppColors.textSecondary)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Exit', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
    return exitResult ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<FacultyController>(context);

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        final shouldPop = await _onWillPop(context);
        if (shouldPop && context.mounted) Navigator.of(context).pop();
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: _pages[controller.currentIndex],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: Colors.white,
          onPressed: () => _showAddDialog(context),
          elevation: 4,
          child: const Icon(Icons.add, color: AppColors.primary, size: 28),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.currentIndex,
          onTap: (index) => controller.setIndex(index),
          backgroundColor: AppColors.primary,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white54,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
          unselectedLabelStyle: const TextStyle(fontSize: 11),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.dashboard_rounded), label: 'Dashboard'),
            BottomNavigationBarItem(icon: Icon(Icons.schedule_rounded), label: 'Schedule'),
            BottomNavigationBarItem(icon: Icon(Icons.task_rounded), label: 'Task'),
            BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
