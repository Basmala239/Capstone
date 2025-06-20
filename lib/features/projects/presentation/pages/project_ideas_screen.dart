import 'package:capstone/widgets/background.dart';
import 'package:flutter/material.dart';
import '../../data/project_idea_model.dart';
import '../../data/project_ideas_service.dart';
import '../widgets/project_idea_card.dart';
import '../widgets/search_header.dart';
import 'project_idea_details_screen.dart';

class ProjectIdeasScreen extends StatefulWidget {
  const ProjectIdeasScreen({super.key});

  @override
  ProjectIdeasScreenState createState() => ProjectIdeasScreenState();
}

class ProjectIdeasScreenState extends State<ProjectIdeasScreen> {
  final TextEditingController _searchController = TextEditingController();
  final ProjectIdeasService _projectIdeasService = ProjectIdeasService();
  
  List<ProjectIdeaModel> _projectIdeas = [];
  List<ProjectIdeaModel> _filteredProjectIdeas = [];

  @override
  void initState() {
    super.initState();
    _loadProjectIdeas();
    _searchController.addListener(_onSearchChanged);
  }

  void _loadProjectIdeas() {
    _projectIdeas = _projectIdeasService.getAllProjectIdeas();
    _filteredProjectIdeas = _projectIdeas;
    setState(() {});
  }

  void _onSearchChanged() {
    final query = _searchController.text;
    _filteredProjectIdeas = _projectIdeasService.searchProjectIdeas(query);
    setState(() {});
  }

  void _onProjectSelected(ProjectIdeaModel project) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProjectIdeaDetailsScreen(project: project),
      ),
    );
  }

  void _onNewIdeaPressed() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('New Idea feature coming soon!'),
        backgroundColor: Colors.blue[600],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.blue[600],
          elevation: 0,
        ),
      ),
      body: Stack(
        children: [
          Background(),
          Column(
          children: [
            SearchHeader(
              searchController: _searchController,
              onSearchChanged: (_) => _onSearchChanged(),
              onNewIdeaPressed: _onNewIdeaPressed,
            ),
            Expanded(
              child: _buildProjectIdeasList(),
            ),
          ],
        )
        ],
      ),
    );
  }

  Widget _buildProjectIdeasList() {
    if (_filteredProjectIdeas.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_off,
              size: 64,
              color: Colors.grey[400],
            ),
            SizedBox(height: 16),
            Text(
              'No projects found',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Try adjusting your search terms',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: _filteredProjectIdeas.length,
      itemBuilder: (context, index) {
        final project = _filteredProjectIdeas[index];
        return ProjectIdeaCard(
          project: project,
          onSeeMore: () => _onProjectSelected(project),
        );
      },
    );
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }
}
