import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new LoginPage(),
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {

  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  @override
  void initState(){
    super.initState();
    _iconAnimationController = new AnimationController(
      vsync: this,
      duration: new Duration(milliseconds: 400)
    );
    _iconAnimation = new CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.easeOut
    );
    _iconAnimation.addListener(() => this.setState((){ }));
    _iconAnimationController.forward();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.blueAccent,
      body:_bodyWidget(),
    );
  }
  
  Widget _bodyWidget(){
    return new Stack(
      fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage("assets/images/bg_two.jpg"),
            fit: BoxFit.cover,//This will cover the entire screen
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
           
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new FlutterLogo(
                size: _iconAnimation.value * 100,
              ),
              new Form(
                child: new Theme(
                  data: new ThemeData(
                    brightness: Brightness.dark,
                    primarySwatch: Colors.teal,
                    inputDecorationTheme: new InputDecorationTheme(
                      labelStyle: new TextStyle(color: Colors.teal, fontSize: 200.0)
                    )
                  ),
                      child: Container(
                        padding: const EdgeInsets.all(60.0),
                        child: new Column(
                    children: <Widget>[
                     new TextFormField(
                    decoration: new InputDecoration (
                      labelText: "Enter Email!",
                      labelStyle: new TextStyle(
                         color: Colors.tealAccent,
                        fontSize: 18.0
                      )
                      ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  new Padding(padding: const EdgeInsets.only(top: 40.0),),
                  new TextFormField(
                    decoration: new InputDecoration (
                      labelText: "Enter Password",
                      labelStyle: new TextStyle(
                        color: Colors.tealAccent,
                        fontSize: 18.0
                      )
                      ),
                    keyboardType: TextInputType.text,
                    obscureText: true,
                  ),
                  new Padding(padding: const EdgeInsets.only(bottom: 40.0),),
                  new MaterialButton(
                    height: 40.0,
                    minWidth: 100.0,
                    color: Colors.teal,
                    textColor: Colors.white,
                    child: new Icon(Icons.transit_enterexit),
                    onPressed: () => {},
                    splashColor: Colors.pinkAccent,
                  )
                    ],
                  ),
                                  ),
                )
              )
            ],
          )
        ],
    );
  }
}