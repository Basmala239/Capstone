import 'package:flutter/material.dart';

class AttachmentSection extends StatelessWidget {
  final List<String> attachments;
  final VoidCallback? onAddAttachment;
  final bool showAddButton;

  const AttachmentSection({
    Key? key,
    required this.attachments,
    this.onAddAttachment,
    this.showAddButton = false,
  }) : super(key: key);

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
        Container(
          height: 80,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF1886CC).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.folder,
                      color: Color(0xFF1886CC),
                      size: 32,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF1886CC).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.description,
                      color: Color(0xFF1886CC),
                      size: 32,
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
