import 'package:flutter/material.dart';

class NotifyListenerScreen extends StatelessWidget {
  NotifyListenerScreen({super.key});

  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> toggle = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Monkey D Luffy'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ValueListenableBuilder(
              valueListenable: toggle,
              builder: (context, value, child) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    obscureText: toggle.value,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        suffixIcon: InkWell(
                          child: Icon(toggle.value
                              ? Icons.visibility_off_outlined
                              : Icons.visibility),
                          onTap: () {
                            toggle.value = !toggle.value;
                          },
                        )),
                  ),
                );
              }),
          Center(
              child: ValueListenableBuilder(
                  valueListenable: _counter,
                  builder: (context, value, child) {
                    return Text(
                      _counter.value.toString(),
                      style: TextStyle(fontSize: 50),
                    );
                  })),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          _counter.value++;
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
