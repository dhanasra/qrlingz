import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class SingleSelect extends StatefulWidget {
  final List<String> items;
  final String value;
  final ValueChanged onChanged;
  const SingleSelect({super.key, required this.items, required this.value, required this.onChanged});

  @override
  State<SingleSelect> createState() => _SingleSelectState();
}

class _SingleSelectState extends State<SingleSelect> {
  String? selectedItem;

  @override
  void initState() {
    selectedItem = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return DropdownButtonFormField2<String>(
      value: selectedItem,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.security_outlined),
      ),
      onChanged: (v) {
        setState(() {
          selectedItem = v;
        });
        widget.onChanged(v);
      },
      menuItemStyleData: const MenuItemStyleData(
        padding: EdgeInsets.zero
      ),
      selectedItemBuilder: (_) {
        return widget.items.map<Widget>((String item) {
          return Text(item);
        }).toList();
      },
      items: widget.items.map(
        (e) => DropdownMenuItem<String>(
          value: e,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(e)),
        ),
      ).toList(),
    );
  }
}