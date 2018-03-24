import 'package:flutter/material.dart';
import 'package:page_transformer/data.dart';
import 'package:page_transformer/intro_page_item.dart';
import 'package:page_transformer/page_transformer.dart';

class IntroPageView extends StatelessWidget {

  IntroPageView({
    this.viewportFraction = 0.85,
    this.height = 500.0
  });

  final double viewportFraction;
  final double height;



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new SizedBox.fromSize(
          size: new Size.fromHeight(height),
          child: new PageTransformer(
            pageViewBuilder: (context, visibilityResolver) {
              return new PageView.builder(
                controller: new PageController(viewportFraction: viewportFraction),
                itemCount: sampleItems.length,
                itemBuilder: (context, index) {
                  final item = sampleItems[index];
                  final pageVisibility =
                      visibilityResolver.resolvePageVisibility(index);

                  return new IntroPageItem(
                    item: item,
                    pageVisibility: pageVisibility,
                    handleOnTap: ()=>print("on tap working"),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
