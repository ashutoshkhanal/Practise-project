import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
                foregroundDecoration: BoxDecoration(color: Colors.black26),
                height: 400,
                child: Image.asset('images/lcd.jpg', fit: BoxFit.cover)),
            SingleChildScrollView(
              padding: const EdgeInsets.only(top: 26.0, bottom: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 250),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "ANIMAL",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      const SizedBox(width: 16.0),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Text(
                          "Wild Animal",
                          style: TextStyle(color: Colors.white, fontSize: 13.0),
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        color: Colors.white,
                        icon: Icon(Icons.play_arrow),
                        onPressed: () {},
                      ),
                      IconButton(
                        color: Colors.white,
                        icon: Icon(Icons.pause),
                        onPressed: () {},
                      )
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const SizedBox(height: 20.0),
                        SizedBox(
                          width: double.infinity,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            color: Colors.orange,
                            textColor: Colors.white,
                            child: Text(
                              "Play Sound",
                              style: TextStyle(fontWeight: FontWeight.normal),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 15.0,
                              horizontal: 15.0,
                            ),
                            onPressed: () {},
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        Text(
                          "Description".toUpperCase(),
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 14.0),
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ratione architecto autem quasi nisi iusto eius ex dolorum velit! Atque, veniam! Atque incidunt laudantium eveniet sint quod harum facere numquam molestias?",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 14.0),
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ratione architecto autem quasi nisi iusto eius ex dolorum velit! Atque, veniam! Atque incidunt laudantium eveniet sint quod harum facere numquam molestias?",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 14.0),
                        ),
                        Text(
                          "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ratione architecto autem quasi nisi iusto eius ex dolorum velit! Atque, veniam! Atque incidunt laudantium eveniet sint quod harum facere numquam molestias?",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 14.0),
                        ),
                        Text(
                          "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ratione architecto autem quasi nisi iusto eius ex dolorum velit! Atque, veniam! Atque incidunt laudantium eveniet sint quod harum facere numquam molestias?",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 14.0),
                        ),
                        const SizedBox(height: 30.0),
                        Text(
                          "Gallery".toUpperCase(),
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 14.0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
