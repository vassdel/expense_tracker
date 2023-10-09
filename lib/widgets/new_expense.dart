import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void presentDatePicker() {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);
  }

  @override
  void dispose() {
    titleController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            // Expense Name (title)
            controller: titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    suffixText: '€',
                    label: Text('Ammount'),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Selected Date'),
                    IconButton(
                      onPressed: presentDatePicker,
                      icon: const Icon(Icons.calendar_month_rounded),
                    )
                  ],
                ),
              ),
            ],
          ),
          // bottom buttons
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  print(titleController.text);
                  print(amountController.text);
                },
                child: const Text('Save Expense'),
              )
            ],
          )
        ],
      ),
    );
  }
}
