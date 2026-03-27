import 'package:flutter/material.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/ui_helper.dart';

class SetupScreen extends StatelessWidget {
  const SetupScreen({super.key});

  void _onCardTap(BuildContext context, String title) {
    UIHelper.showCustomDialog(
      context: context,
      title: 'Manage $title',
      content: Text('What would you like to do with $title?', style: const TextStyle(color: AppColors.textSecondary)),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            _showAddDialog(context, title);
          },
          child: const Text('Add', style: TextStyle(color: AppColors.primary)),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
          onPressed: () {
            Navigator.pop(context);
            _showViewScreen(context, title);
          },
          child: const Text('View', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }

  void _showAddDialog(BuildContext context, String title) {
    final TextEditingController nameCtrl = TextEditingController();
    UIHelper.showCustomDialog(
      context: context,
      title: 'Add $title',
      content: UIHelper.customTextField(
        controller: nameCtrl,
        hintText: 'Enter $title Name',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel', style: TextStyle(color: AppColors.textSecondary)),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
          onPressed: () {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$title saved successfully!')));
          },
          child: const Text('Save', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }

  void _showViewScreen(BuildContext context, String title) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => SetupViewScreen(title: title)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Setup', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSetupCard(context, 'Department', Icons.business),
          _buildSetupCard(context, 'Course', Icons.book_rounded),
          _buildSetupCard(context, 'Division', Icons.group),
          _buildSetupCard(context, 'Subject', Icons.subject),
        ],
      ),
    );
  }

  Widget _buildSetupCard(BuildContext context, String title, IconData icon) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      color: AppColors.surface,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: AppColors.primary),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.textPrimary)),
        trailing: const Icon(Icons.chevron_right, color: AppColors.textLight),
        onTap: () => _onCardTap(context, title),
      ),
    );
  }
}

class SetupViewScreen extends StatefulWidget {
  final String title;
  const SetupViewScreen({super.key, required this.title});

  @override
  State<SetupViewScreen> createState() => _SetupViewScreenState();
}

class _SetupViewScreenState extends State<SetupViewScreen> {
  final TextEditingController _searchController = TextEditingController();
  late List<Map<String, dynamic>> _allItems;
  List<Map<String, dynamic>> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _allItems = List.generate(8, (index) => {
      'id': '#100${index + 1}',
      'name': 'Mock ${widget.title} ${index + 1}',
      'index': index + 1,
    });
    _filteredItems = _allItems;
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredItems = _allItems.where((item) {
        return item['name']!.toLowerCase().contains(query) ||
               item['id']!.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('View ${widget.title}', style: const TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: UIHelper.customTextField(
              controller: _searchController,
              hintText: 'Search ${widget.title}...',
              icon: Icons.search,
            ),
          ),
          Expanded(
            child: _filteredItems.isEmpty
                ? const Center(child: Text('No items found.', style: TextStyle(color: AppColors.textSecondary)))
                : ListView.builder(
                    itemCount: _filteredItems.length,
                    itemBuilder: (context, index) {
                      final item = _filteredItems[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
                        color: AppColors.surface,
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        child: ListTile(
                          title: Text(item['name'], style: const TextStyle(fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
                          subtitle: Text('ID: ${item['id']}', style: const TextStyle(color: AppColors.textSecondary)),
                          leading: CircleAvatar(
                            backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                            child: Text('${item['index']}', style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete_outline, color: AppColors.priorityUrgent),
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Deleted ${item['name']}')));
                            },
                          ),
                        ),
                      );
                    },
                  ),
          )
        ],
      ),
    );
  }
}
