import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';

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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool _isVisible = true;
  MaterialColor _b = Colors.blue;
  final Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 2);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset('assets/images/copy_545718746.png', height: 100, width: 100,),
          centerTitle: true,
          bottom: TabBar(
            physics: const BouncingScrollPhysics(),
            controller: _tabController,
            labelColor: Colors.amber,
            unselectedLabelColor: Colors.white,
            indicatorColor: Colors.amber,
            indicatorWeight: 6,
            indicatorSize: TabBarIndicatorSize.tab,
            labelStyle:
                const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            unselectedLabelStyle:
                const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            // indicator: const BoxDecoration(
            //   shape: BoxShape.rectangle,
            // ),
            tabs: const [
              Text(
                'LogIn',
                // style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                'SignIn',
                // style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        body: TabBarView(
          physics: const BouncingScrollPhysics(),
          controller: _tabController,
          children: [
            // Login
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
                        'Welcome back..',
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
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
                              // E-mail TextFormField
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
                                  hintText: 'examble@gmail.com',
                                  hintStyle: const TextStyle(
                                      color: Colors.greenAccent, fontSize: 15),
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
                                  _authData['email'] = val!;
                                },
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              // Password TextFormField
                              TextFormField(
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: _isVisible ? true : false,
                                controller: _passwordController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.red,
                                      width: 2,
                                      style: BorderStyle.none,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  labelText: 'Password',
                                  labelStyle: const TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: 19,
                                  ),
                                  hintText: '********',
                                  hintStyle: const TextStyle(
                                      color: Colors.greenAccent, fontSize: 15),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _isVisible = !_isVisible;
                                        if (!_isVisible) {
                                          _b = Colors.red;
                                        } else {
                                          _b = Colors.blue;
                                        }
                                      });
                                    },
                                    icon: Icon(
                                      _isVisible
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: _b,
                                    ),
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.https,
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
                                  if (val!.length < 8 || val.isEmpty) {
                                    return 'invalid password';
                                  }
                                  return null;
                                },
                                onSaved: (val) {
                                  _authData['password'] = val!;
                                },
                              ),
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
            // signIn
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
                              // E-mail TextFormField
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                controller: _emailController,
                                decoration: InputDecoration(
                                  // label: const Text('examble@gmail.com'),
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
                                  hintText: 'examble@gmail.com',
                                  hintStyle: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.greenAccent,
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
                                  if (!val!.contains('@') ||
                                      val.isEmpty ||
                                      val.length <= 12) {
                                    return 'invalid email';
                                  }
                                  return null;
                                },
                                onSaved: (val) {
                                  _authData['email'] = val!;
                                },
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              // Password TextFormField
                              TextFormField(
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: _isVisible ? true : false,
                                controller: _passwordController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.red,
                                      width: 2,
                                      style: BorderStyle.none,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  labelText: 'Password',
                                  labelStyle: const TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: 19,
                                  ),
                                  hintText: '********',
                                  hintStyle: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.greenAccent,
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _isVisible = !_isVisible;
                                        if (!_isVisible) {
                                          _b = Colors.red;
                                        } else {
                                          _b = Colors.blue;
                                        }
                                      });
                                    },
                                    icon: Icon(
                                      _isVisible
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: _b,
                                    ),
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.https,
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
                                  if (val!.length < 8 || val.isEmpty) {
                                    return 'invalid password';
                                  }
                                  return null;
                                },
                                onSaved: (val) {
                                  _authData['password'] = val!;
                                },
                              ),
                              // confirm password TextFormField
                              const SizedBox(
                                height: 30,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.red,
                                      width: 2,
                                      style: BorderStyle.none,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  labelText: 'Confirm Password',
                                  labelStyle: const TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: 19,
                                  ),

                                  // suffixIcon: IconButton(
                                  //   onPressed: () {
                                  //     setState(() {
                                  //       _isVisible = !_isVisible;
                                  //       if (!_isVisible) {
                                  //         _b = Colors.red;
                                  //       } else {
                                  //         _b = Colors.blue;
                                  //       }
                                  //     });
                                  //   },
                                  //   icon: Icon(
                                  //     _isVisible
                                  //         ? Icons.visibility_off
                                  //         : Icons.visibility,
                                  //     color: _b,
                                  //   ),
                                  // ),
                                  prefixIcon: const Icon(
                                    Icons.https,
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
                                  if (val != _passwordController.text) {
                                    return 'password do not match';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              ElevatedButton(
                                onPressed: _submit,
                                child: const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                    "SignIn",
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
