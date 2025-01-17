// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!

import 'package:material_tag_editor/tag_editor.dart';

class TagsInputWidget extends StatefulWidget {
  final List<String> initialTags;
  final double width;
  final double height;
  final int? maxInputTags; // Optional parameter for maximum input tags

  const TagsInputWidget({
    Key? key,
    required this.initialTags,
    required this.width,
    required this.height,
    this.maxInputTags, // Optional parameter
  }) : super(key: key);

  @override
  _TagsInputWidgetState createState() => _TagsInputWidgetState();
}

class _TagsInputWidgetState extends State<TagsInputWidget> {
  late List<String> tags; // Manage tags for display
  bool showInputField = true; // Controls input field visibility
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    //tags = List.from(widget.initialTags); // Initialize tags
    tags = widget.initialTags;
    _textController = TextEditingController();
    _updateInputFieldVisibility(); // Set initial visibility
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _updateInputFieldVisibility() {
    if (widget.maxInputTags != null) {
      setState(() {
        showInputField = tags.length < widget.maxInputTags!;
      });
    }
  }

  void _addTag() {
    final newTag = _textController.text.trim().replaceAll(' ', '');
    if (newTag.isNotEmpty && !tags.contains(newTag)) {
      setState(() {
        tags.add(newTag); // Add sanitized tag
        _textController.clear(); // Clear input field
        _updateInputFieldVisibility(); // Update input field visibility
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showInputField)
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: const InputDecoration(
                      hintText: 'Enter tags...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: _addTag, // Add tag when button is pressed
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            children: tags
                .map(
                  (tag) => Chip(
                    label: Text(tag),
                    onDeleted: () {
                      setState(() {
                        tags.remove(tag); // Remove tag
                        _updateInputFieldVisibility(); // Update input field visibility
                      });
                    },
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
