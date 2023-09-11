import 'package:flutter/material.dart';
import 'package:madenati/constants/carsousel_items.dart';
import 'package:madenati/ui/widgets/carousel_slider_widget.dart';
import '../../../models/gridmodel.dart';
import '../../widgets/appbar_widget.dart';
import '../../widgets/grid_widget.dart';
import '../../widgets/separator_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            defaultAppBar(context: context, title: 'الرئيسية', isHome: true),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                carousel(items: images),
                const SizedBox(
                  height: 10,
                ),
                separator(),
                const SizedBox(
                  height: 10,
                ),
                useActionGridView(context)
              ],
            ),
          ),
        ));
  }

  Widget useActionGridView(context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      childAspectRatio: 1 / 1.10,
      children: gridList.map((item) {
        return gridItem(
            context: context,
            nav: item.nav!,
            image: item.image!,
            title: item.title!);
      }).toList(),
    );
  }
}
