import 'package:flutter/material.dart';
import '../models/buku.dart';
import '../services/api_service.dart';

class BukuFormScreen extends StatefulWidget {
  final Buku? buku;

  const BukuFormScreen({super.key, this.buku});

  @override
  State<BukuFormScreen> createState() => _BukuFormScreenState();
}

class _BukuFormScreenState extends State<BukuFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final ApiService _apiService = ApiService();

  late TextEditingController _titleController;
  late TextEditingController _authorController;
  late TextEditingController _coverUrlController;
  late TextEditingController _descriptionController;
  late TextEditingController _ratingController;

  bool _isEditMode = false;

  @override
  void initState() {
    super.initState();

    _isEditMode = widget.buku != null;

    _titleController = TextEditingController(text: _isEditMode ? widget.buku!.title : '');
    _authorController = TextEditingController(text: _isEditMode ? widget.buku!.author : '');
    _coverUrlController = TextEditingController(text: _isEditMode ? widget.buku!.coverUrl : '');
    _descriptionController = TextEditingController(text: _isEditMode ? widget.buku!.description : '');
    _ratingController = TextEditingController(text: _isEditMode ? widget.buku!.rating.toString() : '');
  }

  @override
  void dispose() {
    _titleController.dispose();
    _authorController.dispose();
    _coverUrlController.dispose();
    _descriptionController.dispose();
    _ratingController.dispose();
    super.dispose();
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      Map<String, dynamic> data = {
        'title': _titleController.text,
        'author': _authorController.text,
        'description': _descriptionController.text,
        'cover_url': _coverUrlController.text,
        'rating': double.tryParse(_ratingController.text) ?? 0.0,
      };

      bool success = false;
      if (_isEditMode) {
        success = await _apiService.updateBook(widget.buku!.id, data);
      } else {
        success = await _apiService.addBook(data);
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(success ? 'Buku berhasil disimpan!' : 'Gagal menyimpan buku.'),
            backgroundColor: success ? Colors.green : Colors.red,
          ),
        );
        if (success) {
          Navigator.pop(context, true);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditMode ? 'Edit Buku' : 'Tambah Buku Baru'),
        backgroundColor: const Color(0xFF0077B6),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(labelText: 'Judul Buku', border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Judul tidak boleh kosong';
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _authorController,
                  decoration: const InputDecoration(labelText: 'Nama Penulis', border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Penulis tidak boleh kosong';
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _coverUrlController,
                  decoration: const InputDecoration(labelText: 'URL Cover Buku', border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'URL Cover tidak boleh kosong';
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(labelText: 'Deskripsi', border: OutlineInputBorder()),
                  maxLines: 4,
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Deskripsi tidak boleh kosong';
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _ratingController,
                  decoration: const InputDecoration(labelText: 'Rating (contoh: 4.5)', border: OutlineInputBorder()),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Rating tidak boleh kosong';
                    if (double.tryParse(value) == null) return 'Masukkan angka yang valid';
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                ElevatedButton.icon(
                  onPressed: _submitForm,
                  icon: const Icon(Icons.save),
                  label: const Text('Simpan'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: const Color(0xFF0077B6),
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}