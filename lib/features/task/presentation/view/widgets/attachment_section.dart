import 'package:capstone/features/task/data/models/task_model.dart';
import 'package:flutter/material.dart';

class AttachmentSection extends StatelessWidget {
  final List<AttachmentModel> attachments;
  final VoidCallback? onAddAttachment;
  final bool showAddButton;
  final VoidCallback? onRefresh; // جديد

  const AttachmentSection({
    super.key,
    required this.attachments,
    this.onAddAttachment,
    this.showAddButton = false,
    this.onRefresh, // جديد
  });

  static Future<AttachmentModel?> showAddAttachmentDialog(BuildContext context) async {
    AttachmentType? selectedType = AttachmentType.link;
    final nameController = TextEditingController();
    final urlController = TextEditingController();
    String? pickedFileName;
    return await showDialog<AttachmentModel>(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return AlertDialog(
              title: const Text('Add Attachment'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButtonFormField<AttachmentType>(
                    value: selectedType,
                    items: AttachmentType.values.map((type) {
                      return DropdownMenuItem(
                        value: type,
                        child: Text(type.name),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setStateDialog(() {
                        selectedType = val;
                        urlController.clear();
                        pickedFileName = null;
                      });
                    },
                    decoration: const InputDecoration(hintText: 'Type'),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(hintText: 'Attachment Name'),
                  ),
                  const SizedBox(height: 8),
                  if (selectedType == AttachmentType.link) ...[
                    TextField(
                      controller: urlController,
                      decoration: const InputDecoration(hintText: 'Attachment URL'),
                    ),
                  ] else ...[
                    Row(
                      children: [
                        Expanded(
                          child: Text(pickedFileName ?? 'No file selected',
                            style: const TextStyle(fontSize: 13, color: Colors.grey),
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            setStateDialog(() {
                              pickedFileName = 'dummy_file_${DateTime.now().millisecondsSinceEpoch}.pdf';
                              urlController.text = pickedFileName!;
                            });
                          },
                          child: const Text('Choose File'),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (nameController.text.trim().isEmpty || selectedType == null) return;
                    if (selectedType == AttachmentType.link && urlController.text.trim().isEmpty) return;
                    if (selectedType != AttachmentType.link && (pickedFileName == null || pickedFileName!.isEmpty)) return;
                    Navigator.pop(context, AttachmentModel(
                      id: DateTime.now().millisecondsSinceEpoch.toString(),
                      name: nameController.text.trim(),
                      url: urlController.text.trim(),
                      type: selectedType!,
                    ));
                  },
                  child: const Text('Add'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(
              Icons.attach_file,
              size: 16,
              color: Color(0xFF1886CC),
            ),
            const SizedBox(width: 8),
            const Text(
              'Attachment',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFF1886CC),
              ),
            ),
            if (showAddButton) ...[
              const Spacer(),
              IconButton(
                onPressed: onAddAttachment,
                icon: const Icon(
                  Icons.add,
                  color: Color(0xFF1886CC),
                ),
                style: IconButton.styleFrom(
                  backgroundColor: const Color(0xFF1886CC).withOpacity(0.1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ],
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 80,
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AttachmentListPage(
                          title: 'Links',
                          attachments: attachments,
                          type: AttachmentType.link,
                        ),
                      ),
                    );
                    if (onRefresh != null) onRefresh!(); // تحديث بعد العودة
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF1886CC).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.link,
                        color: Color(0xFF1886CC),
                        size: 32,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: GestureDetector(
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AttachmentListPage(
                          title: 'Files',
                          attachments: attachments,
                          type: AttachmentType.image, // will filter inside page
                        ),
                      ),
                    );
                    if (onRefresh != null) onRefresh!(); 
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF1886CC).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.upload_file,
                        color: Color(0xFF1886CC),
                        size: 32,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// صفحة عرض المرفقات حسب النوع
class AttachmentListPage extends StatelessWidget {
  final String title;
  final List<AttachmentModel> attachments;
  final AttachmentType type;
  const AttachmentListPage({super.key, required this.title, required this.attachments, required this.type});

  @override
  Widget build(BuildContext context) {
    // فلترة حسب النوع
    List<AttachmentModel> filtered = [];
    if (type == AttachmentType.link) {
      filtered = attachments.where((a) => a.type == AttachmentType.link).toList();
    } else {
      filtered = attachments.where((a) => a.type == AttachmentType.image || a.type == AttachmentType.pdf || a.type == AttachmentType.document).toList();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: filtered.isEmpty
          ? const Center(child: Text('No attachments found'))
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: filtered.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, i) {
                final att = filtered[i];
                IconData icon;
                switch (att.type) {
                  case AttachmentType.link:
                    icon = Icons.link;
                    break;
                  case AttachmentType.image:
                    icon = Icons.image;
                    break;
                  case AttachmentType.pdf:
                    icon = Icons.picture_as_pdf;
                    break;
                  case AttachmentType.document:
                    icon = Icons.description;
                    break;
                }
                return ListTile(
                  leading: Icon(icon, color: const Color(0xFF1886CC)),
                  title: Text(att.name),
                  subtitle: Text(att.url, style: const TextStyle(fontSize: 12)),
                  onTap: () {
                    //here u can open the file or link
                    // if (att.type == AttachmentType.link) {
                    //   // open link in browser
                    //   launchUrl(Uri.parse(att.url));
                    // } else {
                    //   // to open file, you can use a package like open_file or url_launcher
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     SnackBar(content: Text('Opening file: ${att.name}')),
                    //   );
                    // }
                  },
                );
              },
            ),
    );
  }
}
