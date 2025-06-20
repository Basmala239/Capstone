import 'package:flutter/material.dart';

class SearchHeader extends StatelessWidget {
  final TextEditingController searchController;
  final ValueChanged<String>? onSearchChanged;
  final VoidCallback? onNewIdeaPressed;

  const SearchHeader({
    super.key,
    required this.searchController,
    this.onSearchChanged,
    this.onNewIdeaPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: _buildSearchField(),
          ),
          // SizedBox(width: 12),
          // _buildNewIdeaButton(),
        ],
      ),
    );
  }

  Widget _buildSearchField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: TextField(
        controller: searchController,
        onChanged: onSearchChanged,
        decoration: InputDecoration(
          hintText: 'Search...',
          prefixIcon: Icon(Icons.search, color: Colors.grey[400]),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
    );
  }

  // Widget _buildNewIdeaButton() {
  //   return OutlinedButton.icon(
  //     onPressed: onNewIdeaPressed,
  //     icon: Icon(Icons.add, color: Colors.blue[600]),
  //     label: Text(
  //       'New Idea +',
  //       style: TextStyle(color: Colors.blue[600]),
  //     ),
  //     style: OutlinedButton.styleFrom(
  //       side: BorderSide(color: Colors.blue[600]!),
  //       padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
  //     ),
  //   );
  // }
}
