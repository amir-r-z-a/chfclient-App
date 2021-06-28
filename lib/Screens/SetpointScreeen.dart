import 'package:chfclient/Classes/RestaurantAccounts.dart';
import 'package:flutter/material.dart';
class SetPointScreen extends StatefulWidget {
  const SetPointScreen({Key key}) : super(key: key);
    static  List x /* = ["salam" , "khoobi" , "chetori"]*/;
  @override
  _SetPointScreenState createState() => _SetPointScreenState();
}

class _SetPointScreenState extends State<SetPointScreen> {
  var _key2 = GlobalKey<FormState>();
  String current ;
  void notInTime() {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) =>
          AlertDialog(
            title: Text('Set Point'),
            content: Container(
              height:170,
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 0)),
                  Row(children: [
                    SizedBox(
                      width: 180,
                      child: Form(
                          key: _key2,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 18, 0),
                            child: TextFormField(
                              validator: (String value) {
                                if (value.isEmpty || value == null) {
                                  return "you must fill this box";
                                }
                                return null;
                              },
                              onSaved: (String m){
                                setState(() {
                                  SetPointScreen.x.remove(current);
                                  for(var i = 0 ; i < RestaurantAccounts.restaurantList[0].length;i++){
                                    if(RestaurantAccounts.restaurantList[0][i].name==current){
                                      RestaurantAccounts.restaurantList[0][i].point = double.parse(m);
                                    }
                                  }
                                });
                              },
                              cursorColor: Color.fromRGBO(248, 95, 106, 1),
                              decoration: InputDecoration(
                                errorStyle: TextStyle(
                                  color: Color.fromRGBO(248, 95, 106, 1),
                                ),
                                labelText: "Point",
                                labelStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(248, 95, 106, 1)),
                                hintText: " 0 - 5",
                                hintStyle: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromRGBO(209, 214, 219, 1),
                                ),
                              ),
                            ),
                          )),
                    ),
                  ],),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                            primary: Theme
                                .of(context)
                                .primaryColor),
                        onPressed: () {
                          if(_key2.currentState.validate()) {
                            _key2.currentState.save();
                            Navigator.pop(context);
                          }
                        },
                        child: Text(
                          'OK',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text (" Point  "),
        centerTitle: true,
      ),
      body: ListView(
        children: List.generate(SetPointScreen.x.length, (index) {
         return GestureDetector(
          child: Card(
            child: ListTile(
              title:Text(SetPointScreen.x[index]),
            ),
          ),
          onTap: (){
            current = SetPointScreen.x[index];
            notInTime();
          },
        );
        }
        ),
      ),
    );
  }
}
