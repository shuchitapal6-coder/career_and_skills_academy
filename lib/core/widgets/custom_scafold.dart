import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/app_colors.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;

  final String? title;
  final bool centerTitle;
  final bool showAppBar;
  final bool showBackButton;
  final bool safeArea;
  final bool isLoading;

  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final Widget? drawer;
  final Widget? endDrawer;
  final Widget? bottomSheet;
  final PreferredSizeWidget? appBar;
  final List<Widget>? actions;

  final Color? backgroundColor;
  final Color? appBarColor;

  final EdgeInsetsGeometry? padding;

  final VoidCallback? onBackPressed;
  final Future<bool> Function()? onWillPop;

  final Widget? loadingWidget;

  final bool resizeToAvoidBottomInset;
  final bool extendBodyBehindAppBar;

  final bool showMenuButton;
  final Color? menuIconColor;
  final bool showLanguageSwitcher;

  final Widget Function()? titleBuilder;

  final bool useBackgroundGradient;
  final bool useAppBarGradient;
  final bool useBottomNavigationGradient;

  final String? backgroundImage;
  final BoxFit backgroundImageFit;
  final Alignment backgroundImageAlignment;
  final double backgroundImageOpacity;

  const CustomScaffold({
    super.key,
    required this.body,
    this.title,
    this.centerTitle = true,
    this.showAppBar = true,
    this.showBackButton = true,
    this.safeArea = true,
    this.isLoading = false,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.drawer,
    this.endDrawer,
    this.bottomSheet,
    this.appBar,
    this.actions,
    this.backgroundColor,
    this.appBarColor,
    this.padding,
    this.onBackPressed,
    this.onWillPop,
    this.loadingWidget,
    this.resizeToAvoidBottomInset = true,
    this.extendBodyBehindAppBar = false,
    this.showMenuButton = false,
    this.menuIconColor,
    this.showLanguageSwitcher = true,
    this.titleBuilder,
    this.useBackgroundGradient = false,
    this.useAppBarGradient = false,
    this.useBottomNavigationGradient = false,
    this.backgroundImage,
    this.backgroundImageFit = BoxFit.cover,
    this.backgroundImageAlignment = Alignment.center,
    this.backgroundImageOpacity = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    Widget content = Padding(
      padding: padding ?? EdgeInsets.zero,
      child: body,
    );

    if (safeArea) {
      content = SafeArea(
        child: content,
      );
    }

    Widget bodyContent;

    if (backgroundImage != null) {
      bodyContent = Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            backgroundImage!,
            fit: backgroundImageFit,
            alignment: backgroundImageAlignment,
          ),

          if (backgroundImageOpacity < 1.0)
            Container(
              color: theme.scaffoldBackgroundColor.withOpacity(
                1 - backgroundImageOpacity,
              ),
            ),

          content,
        ],
      );
    } else if (useBackgroundGradient) {
      bodyContent = Container(
        decoration: const BoxDecoration(
          gradient: AppColors.mainBgGradient,
        ),
        child: content,
      );
    } else {
      bodyContent = Container(
        color: backgroundColor ?? theme.scaffoldBackgroundColor,
        child: content,
      );
    }

    PreferredSizeWidget? finalAppBar;

    if (showAppBar) {
      if (appBar != null) {
        finalAppBar = appBar;
      } else {
        finalAppBar = AppBar(
          elevation: 0,
          centerTitle: centerTitle,
          automaticallyImplyLeading: false,
          surfaceTintColor: Colors.transparent,
          backgroundColor: useAppBarGradient
              ? Colors.transparent
              : appBarColor ??
              theme.appBarTheme.backgroundColor,

          leading: showMenuButton
              ? Builder(
            builder: (context) => IconButton(
              icon: Icon(
                Icons.menu_rounded,
                color: menuIconColor ??
                    theme.iconTheme.color,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          )
              : showBackButton
              ? IconButton(
            onPressed: onBackPressed ??
                    () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
            icon:   Icon(
              Icons.arrow_back_sharp,color: AppColors.white,
            ),
          )
              : null,

          title: titleBuilder != null
              ? titleBuilder!()
              : title != null
              ? Text(
            title!,
            style: theme.textTheme.titleLarge?.copyWith(color: AppColors.white),
          )
              : null,

          actions: actions,
        );
      }

      if (useAppBarGradient && appBar == null) {
        finalAppBar = PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Container(
            decoration: const BoxDecoration(
              gradient: AppColors.mainBgGradient,
            ),
            child: finalAppBar,
          ),
        );
      }
    }

    Widget? finalBottomNavigation;

    if (bottomNavigationBar != null) {
      if (useBottomNavigationGradient) {
        finalBottomNavigation = Container(
          decoration: const BoxDecoration(
            gradient: AppColors.mainBgGradient,
          ),
          child: bottomNavigationBar,
        );
      } else {
        finalBottomNavigation = bottomNavigationBar;
      }
    }

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: isDark
          ? SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor:
        theme.scaffoldBackgroundColor,
      )
          : SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor:
        theme.scaffoldBackgroundColor,
      ),
      child: WillPopScope(
        onWillPop: onWillPop,
        child: Stack(
          children: [
            Scaffold(
              extendBodyBehindAppBar: extendBodyBehindAppBar,
              resizeToAvoidBottomInset:
              resizeToAvoidBottomInset,

              backgroundColor: backgroundImage != null ||
                  useBackgroundGradient
                  ? Colors.transparent
                  : backgroundColor ??
                  theme.scaffoldBackgroundColor,

              drawer: drawer,
              endDrawer: endDrawer,

              floatingActionButton:
              floatingActionButton,

              bottomNavigationBar:
              finalBottomNavigation,

              bottomSheet: bottomSheet,

              appBar: finalAppBar,

              body: bodyContent,
            ),

            if (isLoading)
              Positioned.fill(
                child: Container(
                  color: Colors.black.withOpacity(0.35),
                  child: Center(
                    child: loadingWidget ??
                        Container(
                          padding:
                          const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: theme.cardColor,
                            borderRadius:
                            BorderRadius.circular(20),
                          ),
                          child:
                          CircularProgressIndicator(
                            color:
                            theme.colorScheme.primary,
                          ),
                        ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}