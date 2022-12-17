import 'package:flutter/material.dart';
import 'edit_dialog.dart';
import 'characters.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _index = -1;
  var _initialized = false;
  List<Character> fromApi = [];

  @override
  void didChangeDependencies() {
    if (!_initialized){
      _initialized = true;
      _init();
    }
    super.didChangeDependencies();
  }

  Future<void> _init()async{
    final apiProvider = Characterz();
    final fetchedCharacters = await apiProvider.getCharacters();
    setState(() {
      fromApi = fetchedCharacters;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("DBZ App")),
        body: Center(
          child: SizedBox(
              width: 600,
              child: ListView.builder(
                itemCount: fromApi.length,
                itemBuilder: (ctx, i) => Card(
                  elevation: 6,
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: TextButton(
                          child: Text(
                            fromApi[i].name,
                            style: _index == i
                                ? TextStyle(color: Colors.red)
                                : null,
                          ),
                          onPressed: () => setState(() {
                            if (_index == i) {
                              _index = -1;
                              return;
                            }
                            _index = i;
                          }),
                        ),
                        title: Text(fromApi[i].description),
                        trailing: IconButton(
                            onPressed: () async {
                              await showDialog(
                                  context: ctx,
                                  barrierDismissible: false,
                                  builder: (ctx) => EditDialog(
                                        character: fromApi[i],
                                        nameHandler: (String value) => setState(
                                            () => fromApi[i].name = value),
                                        descriptionHandler: (String value) =>
                                            setState(() => fromApi[i].description = value),
                                      ));
                            },
                            icon: const Icon(Icons.search)),
                      )),
                ),
              )),
        ));
  }
}
