import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  final Map<String, String> _autho = {
    'email': '',
    'password': '',
  };
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Title'),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Text(
                'LogIn',
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
              Text(
                'SignIn',
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.purple,
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 50,
                    ),
                    const Center(
                      child: Text(
                        'Welcome..',
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(30),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20),
                          ),
                          color: Colors.white,
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                controller: _emailController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.red,
                                      width: 2,
                                      style: BorderStyle.none,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  labelText: 'E-mail',
                                  labelStyle: const TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: 19,
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.email,
                                    color: Colors.indigo,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.red,
                                      width: 2,
                                      style: BorderStyle.solid,
                                    ),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                ),
                                validator: (val) {
                                  if (!val!.contains('@') || val.isEmpty) {
                                    return 'invalid email';
                                  }
                                  return null;
                                },
                                onSaved: (val) {
                                  _autho['email'] = val!;
                                  print(_autho['email']);
                                },
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              TextFormField(),
                              const Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: null,
                                  child: Text(
                                    'Forget password?',
                                    style: TextStyle(
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              ElevatedButton(
                                onPressed: _submit,
                                child: const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                    "LOGIN",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(),
          ],
        ),
      ),
    );
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
  }
}
