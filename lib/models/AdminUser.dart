
import 'dart:core';

import 'package:flutter/material.dart';
class AdminUser extends StatefulWidget {
  @override
  _AdminUserState createState() => _AdminUserState();
}

class _AdminUserState extends State<AdminUser> {

  String name = "X";
   String phn_no = "99999";
   String pinCode = "11111";
  late double admin_id;

   double registerAdmin(){
    name = "X";
    phn_no = "99999999";
    pinCode = "111";

    return 2;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    admin_id = registerAdmin() ;

  }

  updateCovidResult(){
    //if(covidResult db contain userId) update status "updated = true"
  }


  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
