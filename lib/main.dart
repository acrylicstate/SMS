import 'package:flutter/material.dart';
import 'package:telephony/telephony.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SMS Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Send SMS'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Telephony telephony = Telephony.instance;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phonecontroller = TextEditingController();
  final TextEditingController _msgController = TextEditingController();
  final TextEditingController _valueSms = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 50),
                TextFormField(
                  controller: _phonecontroller,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if(value == null || value.isEmpty) {
                      return 'Value is null';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Phone number',
                    labelText: 'Phone'),

                  ),
                SizedBox(height: 50),
                TextFormField(
                    controller: _msgController,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Value is null';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Text',
                      labelText: 'Text'
                    ),
                  ),
                SizedBox(height: 50),
                TextFormField(
                  controller: _valueSms,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Value is null';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Value',
                      labelText: 'Value'
                  ),
                ),
                SizedBox(height: 50),
                ElevatedButton(
                    onPressed: () => _sendSMS(),
                    child: const Text('Send SMS'))
              ],
            ),
          ),
        ),
      ),
      
    );
  }

  _sendSMS() async {
    telephony.sendSms(to: _phonecontroller.text, message: _msgController.text);
  }
}
