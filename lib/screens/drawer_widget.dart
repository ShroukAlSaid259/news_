import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  Function drawerAction;
  static int CATEGORIES_NUMBER=1;
  static int SETTING_NUMBER=2;

  DrawerWidget(this.drawerAction);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding:EdgeInsets.symmetric(vertical: 60) ,
            color: Colors.green,
          ),
          SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.home),
                InkWell(
                    onTap: () {
                      drawerAction(CATEGORIES_NUMBER);
                    },
                    child: Text("Categories",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)),
              ],
            ),
          ),
          SizedBox(height: 20,),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.settings),
                InkWell(
                    onTap: (){
                      drawerAction(SETTING_NUMBER);
                    },
                    child: Text("Setting",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
