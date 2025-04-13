import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_scanner/util/app_colors.dart';

class PageLayout extends StatelessWidget {
  final Widget child;
  final String title;
  final String? subtitle;
  final List<Widget>? appBarActions;
  final PreferredSizeWidget? appBarBottom;
  final Widget? drawer;
  final Color? backgroundColor;
  final Widget? titleWidget;
  final Widget? floatingActionButton;

  const PageLayout({
    super.key,
    required this.title,
    required this.child,
    this.subtitle,
    this.appBarActions,
    this.appBarBottom,
    this.drawer,
    this.titleWidget,
    this.backgroundColor,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? Colors.white,
      appBar: AppBarLayout(
        title,
        subtitle: subtitle,
        appBarActions: appBarActions,
        appBarBottom: appBarBottom,
      ),
      drawer: drawer,
      body: SafeArea(
        child: Container(
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: child,
        ),
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}

class AppBarLayout extends AppBar {
  final String myTitle;
  final String? subtitle;
  final List<Widget>? appBarActions;
  final PreferredSizeWidget? appBarBottom;
  AppBarLayout(
    this.myTitle, {
    this.subtitle,
    this.appBarActions,
    this.appBarBottom,
    super.key,
  }) : super(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.elliptical(20, 10),
              bottomLeft: Radius.elliptical(20, 10),
            ),
          ),
          toolbarHeight: subtitle == null ? null : 80,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                myTitle,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              ...subtitle == null
                  ? []
                  : [
                      const SizedBox(height: 5),
                      Text(
                        subtitle,
                        style: TextStyle(
                          color: Colors.white.withOpacity(.8),
                          fontSize: 15,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
            ],
          ),
          leading: (Get.key.currentState?.canPop() ?? false)
              ? IconButton(
                  // backgroundColor: AppColors.pinkPrimary,
                  // radius: 5,
                  // minRadius: 7,
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    // size: 12,
                  ),
                )
              : const SizedBox.shrink(),
          centerTitle: true,
          backgroundColor: AppColors.pinkPrimary.shade700,
          actions: appBarActions,
          bottom: appBarBottom,
          foregroundColor: Colors.white,
        );
}
