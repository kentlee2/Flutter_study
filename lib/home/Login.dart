import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPage();
  }
}

class LoginPage extends State<Login> {
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passWordController = new TextEditingController();
  GlobalKey _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return buildLoginForm();
  }

  Widget buildLoginForm() {
    return Scaffold(
        appBar: AppBar(
          title: Text("title"),
          centerTitle: true,
        ),
        body: new Container(
          margin: EdgeInsets.all(20),
          decoration: new BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: Colors.white10),
          child: Form(
              key: _formKey, //设置globalKey，用于后面获取FormState
              autovalidate: false, //开启自动校验
              child: Padding(
                padding: const EdgeInsets.all(28),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      autofocus: false,
                      controller: usernameController,
                      decoration: InputDecoration(
                        labelText: "用户名",
                        hintText: "用户名或邮箱",
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                      ),
                      // 校验用户名
                      validator: (v) {
                        return v.trim().length > 0 ? null : "用户名不能为空";
                      },
                    ),
                    Container(
                      height: 30.0,
                    ),
                    TextFormField(
                      controller: passWordController,
                      decoration: InputDecoration(
                          labelText: "密码",
                          hintText: "您的登录密码",
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock)),
                      obscureText: true,
                      //校验密码
                      validator: (v) {
                        return v.trim().length > 5 ? null : "密码不能少于6位";
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 28),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: RaisedButton(
                                child: Text("登录"),
                                padding: EdgeInsets.all(5),
                                color: Theme.of(context).primaryColor,
                                textColor: Colors.white,
                                onPressed: () {
                                  if ((_formKey.currentState as FormState)
                                      .validate()) {
                                    String username =
                                        usernameController.text.toString();
                                    String password =
                                        passWordController.text.toString();
                                  }
                                }),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )),
        ));
  }
}
