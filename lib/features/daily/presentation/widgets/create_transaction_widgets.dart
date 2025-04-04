import 'package:flutter/material.dart';
import 'package:flutter_money_manager/core/colors/app_colors.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../core/provider/keyboard_provider.dart';
import '../../../../shared/widgets/app_btn_widgets.dart';
import '../../../../shared/widgets/custom_keyboard_widgets.dart';

class CreateTransactionWidgets extends StatefulWidget {
  const CreateTransactionWidgets({super.key});

  static const String routePath = '/create-transaction';

  @override
  State<CreateTransactionWidgets> createState() =>
      _CreateTransactionWidgetsState();
}

class _CreateTransactionWidgetsState extends State<CreateTransactionWidgets> {
  int _selectedIndex = 1;
  Map<String, String>? _selectedCategory;
  final List<String> _transactionTypes = ['Income', 'Expense', 'Transfer'];
  DateTime? _selectedDate;

  void _showCategoryPicker() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
      ),
      builder: (context) {
        return _buildCategoryPicker();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _transactionTypes[_selectedIndex],
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: List.generate(_transactionTypes.length, (index) {
                bool isSelected = _selectedIndex == index;
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: OutlinedButton(
                      onPressed: () {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor:
                            isSelected
                                ? Theme.of(
                                  context,
                                ).colorScheme.secondary.withOpacity(0.2)
                                : Colors.transparent,
                        side: BorderSide(
                          color:
                              isSelected
                                  ? Theme.of(context).colorScheme.secondary
                                  : Theme.of(context).dividerColor,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        _transactionTypes[index],
                        style: TextStyle(
                          color:
                              isSelected
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(
                                    context,
                                  ).hintColor, // Changed from AppColors.kColorGrey
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 16),
            _buildFormField(
              'Date',
              _selectedDate == null
                  ? DateFormat.yMMMd().format(DateTime.now())
                  : DateFormat.yMMMd().format(_selectedDate!),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: _selectedDate ?? DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );

                if (pickedDate != null && pickedDate != _selectedDate) {
                  setState(() {
                    _selectedDate = pickedDate;
                  });
                }
              },
            ),
            Consumer<KeyboardProvider>(
              builder: (context, keyboardProvider, child) {
                return _buildFormField(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder:
                          (_) => CustomKeyboardWidgets(
                            onKeyTap: (value) {
                              keyboardProvider.addCharacter(value);
                            },
                          ),
                    );
                  },
                  'Amount',
                  keyboardProvider.inputValue,
                );
              },
            ),
            _buildFormField(
              'Category',
              _selectedCategory == null
                  ? 'Select Category'
                  : '${_selectedCategory!['emoji']} ${_selectedCategory!['name']}',
              onTap: _showCategoryPicker,
            ),
            _buildFormField('Account', ''),
            _buildFormField('Note', ''),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AppBtnWidgets(
                  width: 120,
                  text: 'Save',
                  onClick: () {
                    // Handle save action
                  },
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  borderRadius: 8,
                ),
                const SizedBox(width: 16),
                AppBtnWidgets(
                  text: 'Continue',
                  onClick: () {
                    Navigator.pop(context);
                  },
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  borderRadius: 8,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormField(String label, String hintText, {VoidCallback? onTap}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Text(label, style: Theme.of(context).textTheme.bodyMedium),
        TextField(
          onTap: onTap,
          readOnly: true,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.kColorGrey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.kColorGrey),
            ),
            filled: false,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        ),
      ],
    );
  }

  // build categories widgets
  Widget _buildCategoryPicker() {
    List<Map<String, String>> categories = [
      {"name": "Food", "emoji": "🍜"},
      {"name": "Social Life", "emoji": "🧑‍🤝‍🧑"},
      {"name": "Pets", "emoji": "🐶"},
      {"name": "Transport", "emoji": "🚕"},
      {"name": "Culture", "emoji": "🖼️"},
      {"name": "Household", "emoji": "🪑"},
      {"name": "Apparel", "emoji": "👕"},
      {"name": "Beauty", "emoji": "💄"},
      {"name": "Health", "emoji": "🧘"},
      {"name": "Education", "emoji": "📖"},
      {"name": "Gift", "emoji": "🎁"},
      {"name": "Other", "emoji": "🔹"},
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Category",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          const Divider(),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 2.5,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index]["name"]!;
              final emoji = categories[index]["emoji"]!;
              final isSelected = category == _selectedCategory;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedCategory = {"name": category, "emoji": emoji};
                  });
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color:
                        isSelected
                            ? Theme.of(
                              context,
                            ).colorScheme.primary.withOpacity(0.2)
                            : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color:
                          isSelected
                              ? Theme.of(context).colorScheme.primary
                              : Colors.grey,
                    ),
                  ),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(emoji, style: const TextStyle(fontSize: 18)),
                      const SizedBox(height: 5),
                      Text(
                        category,
                        style: TextStyle(
                          fontSize: 14,
                          color:
                              isSelected
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context).hintColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
