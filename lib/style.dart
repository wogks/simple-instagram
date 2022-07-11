import 'package:flutter/material.dart';

var theme = ThemeData(
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(color: Colors.black,fontSize: 25),
          color: Colors.white,
          elevation: 1,
          actionsIconTheme: IconThemeData(color: Colors.black, size: 30),
          
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(selectedIconTheme: IconThemeData(color: Colors.black),
          unselectedIconTheme:IconThemeData(color: Colors.black) )
        
      );