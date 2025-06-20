import 'package:capstone/widgets/background.dart';
import 'package:flutter/material.dart';
import '../widgets/student_card.dart';
import '../../data/student_model.dart';
import '../../data/student_service.dart';
import 'students_filter_screen.dart';

class StudentsSearchScreen extends StatefulWidget {
  final List<Student> selectedMembers;

  const StudentsSearchScreen({super.key, required this.selectedMembers});

  @override
  State<StudentsSearchScreen> createState() => _StudentsSearchScreenState();
}

class _StudentsSearchScreenState extends State<StudentsSearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Student> _allStudents = [];
  List<Student> _filteredStudents = [];
  List<Student> _selectedMembers = [];
  List<String> _selectedGenders = [];
  List<String> _selectedTracks = [];

  @override
  void initState() {
    super.initState();
    _selectedMembers = List.from(widget.selectedMembers);
    _loadStudents();
    _searchController.addListener(_filterStudents);
  }

  void _loadStudents() {
    _allStudents = StudentService.getAllStudents();
    // Update invite status based on selected members
    for (var student in _allStudents) {
      final isSelected = _selectedMembers.any(
        (member) => member.id == student.id,
      );
      student = student.copyWith(isInvited: isSelected);
    }
    _filterStudents();
  }

  void _filterStudents() {
    setState(() {
      _filteredStudents = StudentService.searchStudents(
        query: _searchController.text,
        genderFilters: _selectedGenders.isEmpty ? null : _selectedGenders,
        trackFilters: _selectedTracks.isEmpty ? null : _selectedTracks,
      );

      // Update invite status
      for (int i = 0; i < _filteredStudents.length; i++) {
        final isSelected = _selectedMembers.any(
          (member) => member.id == _filteredStudents[i].id,
        );
        _filteredStudents[i] = _filteredStudents[i].copyWith(
          isInvited: isSelected,
        );
      }
    });
  }

  void _toggleStudentInvite(Student student) {
    setState(() {
      if (student.isInvited) {
        // Remove from selected members
        _selectedMembers.removeWhere((member) => member.id == student.id);
      } else {
        // Add to selected members
        _selectedMembers.add(student);
      }
      _filterStudents();
    });
  }

  void _openFilters() async {
    final result = await Navigator.push<Map<String, List<String>>>(
      context,
      MaterialPageRoute(
        builder:
            (context) => StudentsFilterScreen(
              selectedGenders: _selectedGenders,
              selectedTracks: _selectedTracks,
            ),
      ),
    );

    if (result != null) {
      setState(() {
        _selectedGenders = result['genders'] ?? [];
        _selectedTracks = result['tracks'] ?? [];
        _filterStudents();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Students'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: _openFilters,
          ),
        ],
      ),
      body: Stack(
        children: [
          Background(),
          Column(
            children: [
              // Search Bar
              Container(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search students...',
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
              ),

              // Students List
              Expanded(
                child: ListView.builder(
                  itemCount: _filteredStudents.length,
                  itemBuilder: (context, index) {
                    final student = _filteredStudents[index];
                    return StudentCard(
                      student: student,
                      onInvitePressed: () => _toggleStudentInvite(student),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton:
          _selectedMembers.isNotEmpty
              ? FloatingActionButton.extended(
                onPressed: () => Navigator.pop(context, _selectedMembers),
                backgroundColor: Colors.blue,
                label: Text(
                  'Done (${_selectedMembers.length})',
                  style: const TextStyle(color: Colors.white),
                ),
                icon: const Icon(Icons.check, color: Colors.white),
              )
              : null,
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
