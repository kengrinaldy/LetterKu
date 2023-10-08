import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:letterku/main_menu.dart';
import 'package:letterku/views/genre_select.dart';
import 'package:letterku/styles/button.dart';
import 'package:intl/intl.dart';

class AccountEdit extends StatefulWidget{
  @override
  State createState() => AccountEditState();
}

class AccountEditState extends State<AccountEdit> {
  TextEditingController dateinput = TextEditingController();
  //text editing controller for text field

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          SizedBox(width: 18, height: 100,),
                          TextButton(
                            onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(builder: (_) => MainMenuScreen() )),
                            child: Icon(Icons.arrow_back, color: Colors.black),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 40, bottom: 20),
                        child:
                        Text('Account Setting',
                          style: GoogleFonts.inter(fontSize: 28
                              , color: Colors.black, fontWeight: FontWeight.w800),),
                      ),
                      Container(
                          padding: EdgeInsets.only(left: 130, top:10),
                          child : CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 80,
                            child: CircleAvatar(
                              radius: 75,
                              backgroundImage: AssetImage('1.jpeg'),
                            ),
                          )
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 40, top: 30),
                        child: Text('Fullname',
                          style: GoogleFonts.inter(fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),),

                      ),
                      Container(
                          padding: EdgeInsets.only(left: 40),
                          child : const SizedBox(
                              width: 300.0,
                              child: TextField(
                                style: TextStyle(fontSize: 17, color: Colors.black),
                                  decoration: InputDecoration(
                                    suffixIcon: Icon(Icons.edit)),
                              )
                          )
                      ),

                      Container(
                        padding: EdgeInsets.only(left: 40, top: 30),
                        child: Text('Birthdate',
                          style: GoogleFonts.inter(fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),),
                      ),

                      Container(
                          padding: EdgeInsets.only(right: 30),
                          child:Center(
                              child : Container(
                                  width: 300,
                                  child:TextField(
                                    controller: dateinput,
                                    decoration: InputDecoration(
                                        suffixIcon: Icon(Icons.calendar_today),
                                        labelText: "Enter Date"
                                    ),
                                    readOnly: true,
                                    onTap: () async {
                                      DateTime? pickedDate = await showDatePicker(
                                          context: context, initialDate: DateTime.now(),
                                          firstDate: DateTime(2000),
                                          lastDate: DateTime(2101)
                                      );

                                      if(pickedDate != null ){
                                        print(pickedDate);
                                        String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                                        print(formattedDate);

                                        setState(() {
                                          dateinput.text = formattedDate; //set output date to TextField value.
                                        });
                                      }else{
                                        print("Date is not selected");
                                      }
                                    },
                                  )
                              )
                          )
                      ),

                      Container(
                        padding: EdgeInsets.only(left: 40, top: 30),
                        child: Text('Phone',
                          style: GoogleFonts.inter(fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),),

                      ),
                      Container(
                          padding: EdgeInsets.only(left: 40),
                          child : const SizedBox(
                              width: 300.0,
                              child: TextField(
                                style: TextStyle(fontSize: 17, color: Colors.black),
                                decoration: InputDecoration(
                                    suffixIcon: Icon(Icons.edit)),
                              )
                          )
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 40, top: 30),
                        child: Text('Country',
                          style: GoogleFonts.inter(fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),),

                      ),
                      Container(
                          padding: EdgeInsets.only(left: 40),
                          child : const SizedBox(
                              width: 300.0,
                              child: TextField(
                                style: TextStyle(fontSize: 17, color: Colors.black),
                                decoration: InputDecoration(
                                    suffixIcon: Icon(Icons.edit)),
                              )
                          )
                      ),
                      Container(
                          padding: EdgeInsets.only(top: 50, left: 30),
                          child:
                          Column (
                            children: [
                              ElevatedButton(
                                style: buttonPrimary,
                                onPressed: () => Navigator.of(context).push(
                                    MaterialPageRoute(builder: (_) => MainMenuScreen() )), //ini nanti ke main menu
                                child: Text('SAVE', style: GoogleFonts.inter(fontSize: 17
                                    , color: Colors.white, fontWeight: FontWeight.bold)),
                              )
                            ],
                          )
                      )
                    ]
                )
            )
        )
    );
  }
}