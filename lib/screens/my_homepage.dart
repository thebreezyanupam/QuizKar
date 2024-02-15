import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizker/components/category_btn.dart';
import 'package:quizker/screens/quizker_challenge_page.dart';

import '../components/copy_btn.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(70)),
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 60, right: 25, left: 25),
                    color: Theme.of(context).colorScheme.secondary,
                    height: 250,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Welcome to Quizker,', style: TextStyle(
                                  color: Theme.of(context).colorScheme.inversePrimary, fontSize: 18,),
                                  textAlign: TextAlign.left,),
                                Text(
                                  'Anupam Pandey',
                                  style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(color: Theme.of(context).colorScheme.background,
                                  borderRadius: BorderRadius.circular(50)),
                              width: 70,
                              height: 70,
                              child: Icon(Icons.person, size: 50, color: Theme.of(context).colorScheme.secondary,),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20,),
                      ],
                    ),
                  ),
                ),

                Center(
                  child: Container(
                    padding: EdgeInsets.all(25),

                    margin: const EdgeInsets.only(top: 150),
                    decoration: BoxDecoration(
                      //add Boxshadow in this container
                        boxShadow: [BoxShadow(color: Theme.of(context).colorScheme.tertiary,
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 2),)],
                        color:Theme.of(context).colorScheme.background,
                        borderRadius: BorderRadius.circular(20)),
                    width: 300,
                    height: 170,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(

                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.flash_on_sharp, color: Theme.of(context).colorScheme.secondary,
                                size: 50,),
                              Text('WEEKLY QUIZKER', style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary, fontSize: 18,),),
                              Text('CHALLENGE', style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary, fontSize: 18,),),
                            ],
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const WeeklyQuizkerChallenge(),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.secondary,
                              borderRadius: BorderRadius.circular(50),),
                              width: 60,
                              height: 60,
                              child: Icon(
                                Icons.arrow_forward, color: Theme.of(context).colorScheme.background,
                                size: 40,),),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary, borderRadius: BorderRadius.circular(20),),
              width: 370,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Text('CATEGORIES', style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary,fontSize: 20, fontWeight: FontWeight.bold),),
                      Icon(Icons.category, color: Theme.of(context).colorScheme.inversePrimary,),
                    ],),
                  ),

              const SingleChildScrollView(
                padding: EdgeInsets.all(15),
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyCategoryBtn(title: 'Science', iconData: Icons.science, routeName: '',),
                    MyCategoryBtn(title: 'History', iconData: Icons.history, routeName: '',),
                    MyCategoryBtn(title: 'Geography', iconData: CupertinoIcons.globe, routeName: '',),
                    MyCategoryBtn(title: 'Sports', iconData: Icons.sports_basketball, routeName: '',),
                    MyCategoryBtn(title: 'Movies', iconData: Icons.movie, routeName: '',),

                    // Add more containers with different titles and route names
                  ],
                ),
              ),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(10),

              ),
              width: 370,
              height: 225,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 25, right: 25, bottom: 10),
                    child: Row(
                      children: [

                        Text('FACT OF THE DAY', style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary, fontWeight: FontWeight.bold, fontSize: 20),),

                      ],
                    ),
                  ),

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(color: Theme.of(context).colorScheme.tertiary,
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 3),)],
                  color: Theme.of(context).colorScheme.background, borderRadius: BorderRadius.circular(20),),
              width: 380,
              height: 100,
              child: Center(child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.fact_check_outlined, color: Theme.of(context).colorScheme.secondary,),
                  Container(
                    padding: EdgeInsets.all(5),
                      decoration:BoxDecoration() ,
                      child: Text('SUN ALWAYS RISES FROM THE EAST!', style: TextStyle(color: Theme.of(context).colorScheme.secondary, fontSize: 16,),)),
                ],
              )),
              ),
            ),
                  const SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CopyButton(textToCopy: 'SUN ALWAYS RISES FROM THE EAST!'), // Use CopyButton here
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: 40,
                        height: 40,
                        child: IconButton(
                          icon: Icon(Icons.share,
                              color: Theme.of(context).colorScheme.secondary),
                          onPressed: () {
                            // Handle share functionality
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),


          ],

        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        color: Theme.of(context).colorScheme.secondary,
        index: 1,

        items: const [
          CurvedNavigationBarItem(child: Icon(Icons.person, color: Colors.white,),),
          CurvedNavigationBarItem(child: Icon(Icons.home, color: Colors.white,),),
          CurvedNavigationBarItem(child: Icon(Icons.settings, color: Colors.white,),),



      ],

      ),
    );
  }
}
