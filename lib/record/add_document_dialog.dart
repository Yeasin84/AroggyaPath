import 'package:flutter/material.dart';
import 'file_picker_service.dart';
import 'file_service.dart';
import 'document_model.dart';

Future<Document?> showAddDocumentDialog(BuildContext context) async {
  final _nameController = TextEditingController();
  final _dateController = TextEditingController();
  final FilePickerService _filePickerService = FilePickerService();
  final FileService _fileService = FileService();

  String? filePath;

  return showDialog<Document>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Add Document"),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: "Name"),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _dateController,
                decoration: const InputDecoration(
                  labelText: "Date",
                  suffixIcon: Icon(Icons.calendar_today), // Add a calendar icon
                ),
                readOnly: true, // Make it non-editable
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(), // Current date as the default
                    firstDate: DateTime(2000), // Earliest date allowed
                    lastDate: DateTime(2100), // Latest date allowed
                  );

                  if (pickedDate != null) {
                    // Format the selected date and set it in the controller
                    _dateController.text =
                        "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
                  }
                },
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () async {
                  final pickedFile = await _filePickerService.pickFile();
                  if (pickedFile != null) {
                    filePath = pickedFile;
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("File selected successfully"),
                        backgroundColor: Colors.green,
                      ),
                    );
                  }
                },
                child: const Text("Upload File (PDF/Image)"),
              ),
              if (filePath != null)
                Text(
                  "File selected: ${filePath!.split('/').last}",
                  style: const TextStyle(fontSize: 12, color: Colors.blue),
                ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () async {
              if (_nameController.text.isNotEmpty &&
                  _dateController.text.isNotEmpty &&
                  filePath != null) {
                final fileName = filePath!.split('/').last;
                final localFilePath =
                    await _fileService.saveFileLocally(filePath!, fileName);

                final newDocument = Document(
                  name: _nameController.text,
                  date: _dateController.text,
                  filePath: localFilePath,
                );

                Navigator.pop(context, newDocument);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("All fields are required."),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            child: const Text("Save"),
          ),
        ],
      );
    },
  );
}
