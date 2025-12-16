import 'package:dash_kit_core/dash_kit_core.dart';
import 'package:flutter/material.dart';
import 'package:task_requirements/action/load_products_action.dart';
import 'package:task_requirements/core/service_locator.dart';
import 'package:task_requirements/core/service/api_service.dart';
import 'package:task_requirements/core/models/product.dart';
import 'package:task_requirements/path_file.dart';
import 'package:task_requirements/state/app_state.dart';
import 'package:task_requirements/state/news/product_state.dart';

class AddProductScreen extends StatefulWidget {
  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  late Store<AppState> store = sl<Store<AppState>>();
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add New Product')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: titleController,
                  decoration: const InputDecoration(labelText: 'Title'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Title cannot be empty';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: priceController,
                  decoration: const InputDecoration(labelText: 'Price'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Price cannot be empty';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Please enter a valid price';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: descriptionController,
                  decoration: const InputDecoration(labelText: 'Description'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Description cannot be empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                isLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: _submitForm,
                        child: const Text('Add Product'),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        isLoading = true;
      });

      final title = titleController.text;
      final price = int.tryParse(priceController.text);
      final description = descriptionController.text.isNotEmpty
          ? descriptionController.text
          : "No description";
      final categoryId = 13; // Default category
      final images = ["https://placehold.co/600x400"]; // Placeholder image

      if (price != null) {
        final apiService = sl<ApiService>();
        await store.dispatch(
          CreateProductAction(
            apiService,
            title: title,
            price: price,
            description: description,
            categoryId: categoryId,
            images: images,
          ),
        );
        if (!mounted) return;
        Navigator.of(context).pop();
      } else {
        setState(() {
          isLoading = false;
        });
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("Invalid price")));
      }
    }
  }
}
