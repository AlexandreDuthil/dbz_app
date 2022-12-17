import "package:flutter/material.dart";
import "characters.dart";

class EditDialog extends StatelessWidget {
  EditDialog(
      {Key? key,
      required this.character,
      required this.nameHandler,
      required this.descriptionHandler})
      : super(key: key);
  final Character character;
  final _form = GlobalKey<FormState>();
  final Function nameHandler;
  final Function descriptionHandler;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Edit character"),
      content: SizedBox(
          height: 600,
          width: 900,
          child: Form(
              key: _form,
              child: ListView(
                children: [
                  TextFormField(
                      initialValue: character.name,
                      decoration: const InputDecoration(labelText: "Name"),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      onSaved: (value) => nameHandler(value!)),
                  TextFormField(
                      initialValue: character.description,
                      decoration: const InputDecoration(labelText: "Description"),
                      keyboardType: TextInputType.text,
                      onSaved: (value) => descriptionHandler(value!))
                ],
              ))),
      actions: [
        TextButton(
            onPressed: () => Navigator.of(context).pop(), child: Text("Close"))
      ],
    );
  }
}
