import 'package:capstone/widgets/background.dart';
import 'package:flutter/material.dart';
import '../widgets/filter_section.dart';

class StudentsFilterScreen extends StatefulWidget {
  final List<String> selectedGenders;
  final List<String> selectedTracks;

  const StudentsFilterScreen({
    super.key,
    required this.selectedGenders,
    required this.selectedTracks,
  });

  @override
  State<StudentsFilterScreen> createState() => _StudentsFilterScreenState();
}

class _StudentsFilterScreenState extends State<StudentsFilterScreen> {
  List<String> _selectedGenders = [];
  List<String> _selectedTracks = [];

  final List<String> _genderOptions = ['Male', 'Female'];
  final List<String> _trackOptions = [
    'Frontend',
    'Backend',
    'Flutter',
    'ML',
    'UI/UX',
    'Security Engineer',
  ];

  @override
  void initState() {
    super.initState();
    _selectedGenders = List.from(widget.selectedGenders);
    _selectedTracks = List.from(widget.selectedTracks);
  }

  void _onGenderChanged(String gender, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedGenders.add(gender);
      } else {
        _selectedGenders.remove(gender);
      }
    });
  }

  void _onTrackChanged(String track, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedTracks.add(track);
      } else {
        _selectedTracks.remove(track);
      }
    });
  }

  void _applyFilters() {
    Navigator.pop(context, {
      'genders': _selectedGenders,
      'tracks': _selectedTracks,
    });
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
      ),
      body: Stack(
        children: [
          Background(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Gender Filter
                FilterSection(
                  title: 'Gender',
                  options: _genderOptions,
                  selectedOptions: _selectedGenders,
                  onOptionChanged: _onGenderChanged,
                ),
                const SizedBox(height: 24),
                    
                // Track Filter
                FilterSection(
                  title: 'Track',
                  options: _trackOptions,
                  selectedOptions: _selectedTracks,
                  onOptionChanged: _onTrackChanged,
                ),
                const Spacer(),
                    
                // Apply Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _applyFilters,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Search',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
