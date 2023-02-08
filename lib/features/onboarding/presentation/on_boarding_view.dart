import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView(
      {super.key,
      required this.image,
      required this.title,
      required this.content});
  final String image;
  final String title;
  final String content;
  @override
  Widget build(BuildContext context) {
    return 
      
       Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              image,
              width: MediaQuery.of(context).size.width,
              height: 300,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(color: Theme.of(context).cardColor),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                content,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline2!.copyWith(
                    fontWeight: FontWeight.normal,
                    color: Theme.of(context).cardColor.withOpacity(0.5)),
              ),
            ),
          ],
        ),
      
    );
  }
}
