import 'package:flutter/material.dart';
import 'package:madenati/ui/widgets/carousel.dart';
import '../../../models/gridmodel.dart';
import '../../widgets/interface_components.dart';
import '../../widgets/grid_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> images = [
      carsoulItem(
          image: 'assets/volunteering.png',
          title: 'تطوع',
          text:
              'قام أحد فرق التطوع في مدينة إربد بإزالة النفايات على طريق الواصل بين منطقة أيدون و الحصن'),
      carsoulItem(
          image: 'assets/Grid4.png',
          title: 'اعادة التدوير',
          text:
              'الحكومة الالمانية تعلن عن تبنيها شراء النفايات الالكترونية من المملكة الاردنية'),
    ];
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
                  height: 5,
                ),
                separator(),
                const SizedBox(
                  height: 5,
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
