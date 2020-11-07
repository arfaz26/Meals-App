import 'dart:io';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget _buildTile(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Icon(icon),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        onTap: () {
          exit(0);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.all(15),
                alignment: Alignment.bottomLeft,
                height: 250,
                width: double.infinity,
                color: Theme.of(context).accentColor,
                child: Text(
                  'Happy Cooking!',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              _buildTile('Meals', Icons.restaurant),
              _buildTile('Filter', Icons.settings),
            ],
          ),
          Container(
            child: _buildTile('Exit', Icons.exit_to_app),
          )
        ],
      ),
    );
  }
}
