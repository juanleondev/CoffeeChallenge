import 'package:coffee_challenge/app/modules/home/components/swipe_detector.dart';
import 'package:coffee_challenge/app/modules/home/controllers/home_controller.dart';
import 'package:coffee_challenge/app/modules/home/models/coffee_model.dart';
import 'package:coffee_challenge/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoffeeList extends StatefulWidget {
  final List<String> names;
  final List<double> prices;
  CoffeeList({@required this.names, @required this.prices});
  @override
  _CoffeeListState createState() => _CoffeeListState();
}

class _CoffeeListState extends State<CoffeeList> {
  double initialSize;
  int pivot = 0;
  int animationVelocity;
  final HomeController homeController = Get.find();
  @override
  void initState() {
    initialSize = 50;
    animationVelocity = homeController.animationVelocity;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        ...List.generate(
          12,
          (index) => AnimatedPositioned(
            duration: Duration(milliseconds: animationVelocity),
            top: getTopPosition(pivot, index),
            child: AnimatedOpacity(
              duration: Duration(milliseconds: animationVelocity),
              opacity: getOpacity(pivot, index),
              child: AnimatedContainer(
                duration: Duration(milliseconds: animationVelocity),
                curve: Curves.linear,
                width: getSize(pivot, index),
                height: getSize(pivot, index),
                child: Hero(
                  tag: 'assets/${index + 1}.png',
                  child: Image.asset(
                    'assets/${index + 1}.png',
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SwipeDetector(
            child: Container(
              color: Colors.transparent,
              height: MediaQuery.of(context).size.height - 200,
              width: MediaQuery.of(context).size.width,
            ),
            onTap: () {
              Get.toNamed(Routes.COFFEE_INFORMATION,
                  arguments: CoffeeModel(
                      path: 'assets/${pivot + 3}.png',
                      name: widget.names[pivot + 2],
                      price: widget.prices[pivot + 2]));
            },
            onSwipeUp: () {
              print(pivot);
              if (pivot != 9) {
                setState(() {
                  pivot++;
                  initialSize -= 50;
                });
                if (pivot == 1) homeController.changeBackground();
              }
            },
            onSwipeDown: () {
              if (pivot >= 1) {
                setState(() {
                  pivot--;
                  initialSize += 50;
                });
                if (pivot == 0) homeController.changeBackground();
              }
            },
          ),
        ),
        ...List.generate(
            widget.names.length,
            (index) => AnimatedPositioned(
                duration: Duration(milliseconds: animationVelocity),
                top: getTextTopPosition(pivot),
                left: getTextLeftPosition(pivot, index),
                child: SizedBox(
                  width: 140,
                  child: AnimatedOpacity(
                    opacity: getTextOpacity(pivot, index),
                    duration: Duration(milliseconds: animationVelocity),
                    child: Text(
                      widget.names[index],
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                          fontSize: 28,
                          color: Colors.brown[900],
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                ))),
        ...List.generate(
            widget.prices.length,
            (index) => AnimatedPositioned(
                duration: Duration(milliseconds: animationVelocity),
                top: getTextTopPosition(pivot) + 80,
                child: SizedBox(
                  width: 140,
                  child: AnimatedOpacity(
                    opacity: getTextOpacity(pivot, index),
                    duration: Duration(milliseconds: animationVelocity),
                    child: Text(
                      widget.prices[index].toStringAsFixed(2) + ' €',
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                          fontSize: 28,
                          color: Colors.brown[900],
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                )))
      ],
    );
  }

  double getTextLeftPosition(int pivot, int index) {
    final double width = MediaQuery.of(context).size.width;
    if (pivot == 0) {
      if (pivot + 3 == index) return (width / 2) - 70;
      if (pivot + 3 > index)
        return -150;
      else
        return width + 150;
    }
    if (pivot + 2 == index) return (width / 2) - 70;
    if (pivot + 2 > index)
      return -150;
    else
      return width + 150;
  }

  double getTextTopPosition(int pivot) {
    if (pivot == 0)
      return -110;
    else
      return 80;
  }

  double getTextOpacity(int pivot, int index) {
    if (pivot == 0) {
      if (pivot + 3 == index)
        return 1;
      else
        return 0;
    }
    if (pivot + 2 == index)
      return 1;
    else
      return 0;
  }

  double getOpacity(int pivot, int index) {
    if (index == 3 && pivot == 0) return 1;

    if (index < pivot) return 0;
    if (index == pivot)
      return 0.5;
    else
      return 1;
  }

  double getSize(int pivot, int index) {
    double width = MediaQuery.of(context).size.width;
    if (pivot == index) return width - 320;
    if (pivot + 1 == index) return width - 150;
    if (pivot + 2 == index) return width - 50;
    if (index < pivot)
      return width - 400;
    else
      return 800;
  }

  double getTopPosition(int pivot, int index) {
    double height = MediaQuery.of(context).size.height;
    if (pivot == 0 && index == 3) return height * 0.9;

    if (pivot == index) return height * 0.35;

    if (pivot + 1 == index) return height * 0.38;

    if (pivot + 2 == index) return height * 0.47;

    if (pivot > index) return height * 0.4;
    if (pivot < index) return MediaQuery.of(context).size.height;
  }
}
