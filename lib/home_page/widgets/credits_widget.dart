import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CreditsWidget extends StatelessWidget {
  const CreditsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("App made by: Chulipinho"),
          Text("Check out my GitHub profile:"),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    launch('https://github.com/chulipinho');
                  },
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 46, 46, 46),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('GitHub',
                            style:
                                TextStyle(color: Colors.white, fontSize: 24)),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/icons/github.png'))),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    launch(
                        'https://www.linkedin.com/in/fellipe-luz-souza-machado-32aa1122a/');
                  },
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                      color: Color(0xff2867B2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Linkedin',
                            style:
                                TextStyle(color: Colors.white, fontSize: 24)),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/icons/linkedin.png'))),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Text(
              "Since I don't have anything else to show on this screen, I'll just leave here a poem for my girlfriend:"),
          Text('''
Have you heard the news today?
Have you washed your face today?
Did you manage to buy that smile
or you just wiped the pain away?

I have not heard the news today
nor have I washed my face today
Now I bare a genuine smile
because she wiped my pain away

Have she heard the news today?
Have she washed her face today?

I assure she heard the news
Because she washed my face today
'''),
        ],
      ),
    );
  }
}
