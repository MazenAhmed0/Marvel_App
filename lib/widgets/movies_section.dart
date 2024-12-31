import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../screens/movie_screen.dart';

class MoviesSection extends StatelessWidget {
  List names = [
    "Deadpool vs Wolverine",
    "Thor Love And Thunder",
    "Spider Man 3",
    "Iron Man 3"
  ];

  List images = [
    "assets/images/deadpool.jpg",
    "assets/images/Thor Love And Thunder.jpg",
    "assets/images/spiderman3.jpg",
    "assets/images/ironman3.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 500,
            autoPlay: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            aspectRatio: 16 / 9,
            enableInfiniteScroll: true,
            enlargeCenterPage: true,
            viewportFraction: 0.65,
          ),
          items: [
            for (int index = 0; index < names.length; index++)
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(6),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MovieScreen(
                                    name: names[index], image: images[index])));
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(images[index],
                            height: 300, width: 300, fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "PG-13",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            Text(
                              "4.8",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Action",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    names[index],
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )
                ],
              )
          ],
        ),
      ],
    );
  }
}
