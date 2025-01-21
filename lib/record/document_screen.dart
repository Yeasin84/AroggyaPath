import 'dart:io';
import 'package:flutter/material.dart';
import 'document_model.dart';
import 'file_service.dart';
import 'add_document_dialog.dart';

class DocumentScreen extends StatefulWidget {
  @override
  _DocumentScreenState createState() => _DocumentScreenState();
}

class _DocumentScreenState extends State<DocumentScreen> {
  final FileService _fileService = FileService();
  List<Document> _documents = [];

  @override
  void initState() {
    super.initState();
    _fetchDocuments();
  }

  void _fetchDocuments() async {
    final documents = await _fileService.fetchDocuments();
    setState(() {
      _documents = documents;
    });
  }

  void _addDocument() async {
    final newDocument = await showAddDocumentDialog(context);
    if (newDocument != null) {
      setState(() {
        _documents.add(newDocument);
      });
    }
  }

  void _deleteDocument(int index) async {
    final doc = _documents[index];
    bool deleted = await _fileService.deleteDocument(doc.filePath);
    if (deleted) {
      setState(() {
        _documents.removeAt(index);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Document deleted successfully")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to delete document")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Documents",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: _documents.isEmpty
          ? const Center(child: Text("No documents added yet."))
          : ListView.builder(
              itemCount: _documents.length,
              itemBuilder: (context, index) {
                final doc = _documents[index];
                return ListTile(
                  leading: Icon(Icons.insert_drive_file, color: Colors.deepPurple),
                  title: Text(doc.name),
                  subtitle: Text("Date: ${doc.date}"),
                  onTap: () {
                    // Preview File
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PreviewScreen(filePath: doc.filePath),
                      ),
                    );
                  },
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      _deleteDocument(index);
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addDocument,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class PreviewScreen extends StatelessWidget {
  final String filePath;

  PreviewScreen({required this.filePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Preview Document")),
      body: Center(
        child: filePath.endsWith(".pdf")
            ? Text("PDF Preview Not Implemented")
            : Image.file(File(filePath)),
      ),
    );
  }
}
