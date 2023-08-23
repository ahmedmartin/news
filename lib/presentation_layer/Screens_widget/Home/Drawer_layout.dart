import 'package:flutter/material.dart';
import 'package:news_app/Core/Constants/Text.dart';

class DrawerLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.only(bottom: 0, top: 0, right: 15, left: 20),
            margin: EdgeInsets.only(bottom: 0),
            decoration: const BoxDecoration(color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage('assets/menu/profile.png'),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      welcome,
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text('Tony Roshdy',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                            color: Colors.black))
                  ],
                ),
                Image.asset(
                  'assets/menu/arrow.png',
                  width: 20,
                  height: 30,
                ),
              ],
            ),
          ),
          const MenuItem(title: explore, imagePath: 'assets/menu/explore.png'),
          const SizedBox(
            height: 10,
          ),
          const MenuItem(title: liveChat, imagePath: 'assets/menu/live.png'),
          const SizedBox(
            height: 10,
          ),
          const MenuItem(title: gallery, imagePath: 'assets/menu/gallery.png'),
          const SizedBox(
            height: 10,
          ),
          const MenuItem(
              title: wishList, imagePath: 'assets/menu/wishlist.png'),
          const SizedBox(
            height: 10,
          ),
          const MenuItem(
              title: magazine, imagePath: 'assets/menu/magazine.png'),
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String title;
  final String imagePath;

  const MenuItem({super.key, required this.title, required this.imagePath});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 21, color: Colors.black, fontWeight: FontWeight.w300),
      ),
      leading: Image.asset(
        imagePath,
        width: 40,
        height: 25,
      ),
      contentPadding: const EdgeInsets.only(left: 15),
      onTap: () {
        showDialog(context: context, builder: (context) => AlertDialog(
          title: Text(title,),
          content: Text('you clicked on $title',style: TextStyle(fontSize: 20),),
        ),);
        
      },
    );
  }
}
