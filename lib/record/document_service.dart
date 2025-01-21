import 'document_model.dart';

class DocumentService {
  final List<Document> _documents = [];

  List<Document> getDocuments() {
    return _documents;
  }

  void addDocument(Document document) {
    _documents.add(document);
  }
}
