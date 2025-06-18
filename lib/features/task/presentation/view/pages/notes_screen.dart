// import 'package:flutter/material.dart';

// class Note {
//   final String content;
//   final String author;
//   final DateTime date;

//   Note({required this.content, required this.author, required this.date});
// }

// class NotesScreen extends StatefulWidget {
//   final List<Note> notes;
//   final bool isTeamLeader;
//   const NotesScreen({super.key, required this.notes, this.isTeamLeader = false});

//   @override
//   State<NotesScreen> createState() => _NotesScreenState();
// }

// class _NotesScreenState extends State<NotesScreen> {
//   late List<Note> _notes;

//   @override
//   void initState() {
//     super.initState();
//     _notes = List<Note>.from(widget.notes);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         Navigator.pop(context, _notes);
//         return false;
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Notes'),
//           backgroundColor: const Color(0xFF1886CC),
//           elevation: 0,
//           actions: [
//             IconButton(
//               icon: const Icon(Icons.save),
//               onPressed: () {
//                 Navigator.pop(context, _notes);
//               },
//             ),
//           ],
//         ),
//         body: _notes.isEmpty
//             ? const Center(child: Text('No notes found'))
//             : ListView.separated(
//                 padding: const EdgeInsets.all(16),
//                 itemCount: _notes.length,
//                 separatorBuilder: (_, __) => const SizedBox(height: 12),
//                 itemBuilder: (context, index) {
//                   final note = _notes[index];
//                   return Dismissible(
//                     key: ValueKey(note.hashCode),
//                     direction: widget.isTeamLeader ? DismissDirection.endToStart : DismissDirection.none,
//                     onDismissed: widget.isTeamLeader
//                         ? (direction) {
//                             setState(() {
//                               _notes.removeAt(index);
//                             });
//                           }
//                         : null,
//                     background: Container(
//                       alignment: Alignment.centerRight,
//                       padding: const EdgeInsets.symmetric(horizontal: 20),
//                       color: Colors.red,
//                       child: const Icon(Icons.delete, color: Colors.white),
//                     ),
//                     child: Container(
//                       padding: const EdgeInsets.all(16),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(12),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.08),
//                             blurRadius: 4,
//                             offset: const Offset(0, 2),
//                           ),
//                         ],
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             note.content,
//                             style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
//                           ),
//                           const SizedBox(height: 8),
//                           Row(
//                             children: [
//                               Icon(Icons.person, size: 16, color: Colors.grey[600]),
//                               const SizedBox(width: 4),
//                               Text(note.author, style: TextStyle(fontSize: 13, color: Colors.grey[700])),
//                               const Spacer(),
//                               Icon(Icons.access_time, size: 15, color: Colors.grey[500]),
//                               const SizedBox(width: 2),
//                               Text(
//                                 '${note.date.day}/${note.date.month}/${note.date.year}  ${note.date.hour.toString().padLeft(2, '0')}:${note.date.minute.toString().padLeft(2, '0')}',
//                                 style: TextStyle(fontSize: 12, color: Colors.grey[600]),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';

class Note {
  final String content;
  final String author;
  final DateTime date;

  Note({required this.content, required this.author, required this.date});
}

class NotesScreen extends StatefulWidget {
  final List<Note> notes;
  final bool isTeamLeader;
  const NotesScreen({super.key, required this.notes, this.isTeamLeader = false});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  late List<Note> _notes;

  @override
  void initState() {
    super.initState();
    _notes = List<Note>.from(widget.notes);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (!didPop) {
          Navigator.pop(context, _notes);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Notes'),
          backgroundColor: const Color(0xFF1886CC),
          elevation: 0,
        ),
        body: _notes.isEmpty
            ? const Center(child: Text('No notes found'))
            : ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: _notes.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final note = _notes[index];
                  return Dismissible(
                    key: ValueKey(note.hashCode),
                    direction: widget.isTeamLeader ? DismissDirection.endToStart : DismissDirection.none,
                    onDismissed: widget.isTeamLeader
                        ? (direction) {
                            setState(() {
                              _notes.removeAt(index);
                            });
                          }
                        : null,
                    background: Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      color: Colors.red,
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.08),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            note.content,
                            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.person, size: 16, color: Colors.grey[600]),
                              const SizedBox(width: 4),
                              Text(note.author, style: TextStyle(fontSize: 13, color: Colors.grey[700])),
                              const Spacer(),
                              Icon(Icons.access_time, size: 15, color: Colors.grey[500]),
                              const SizedBox(width: 2),
                              Text(
                                '${note.date.day}/${note.date.month}/${note.date.year}  ${note.date.hour.toString().padLeft(2, '0')}:${note.date.minute.toString().padLeft(2, '0')}',
                                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
