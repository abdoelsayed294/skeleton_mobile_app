import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// Greeting shown to the user on the home screen
  ///
  /// In en, this message translates to:
  /// **'Good morning'**
  String get goodMorning;

  /// Label showing today's sales
  ///
  /// In en, this message translates to:
  /// **'Today\'s Sales'**
  String get todaySales;

  /// Label showing today's orders
  ///
  /// In en, this message translates to:
  /// **'Today\'s Orders'**
  String get todayOrders;

  /// Label showing purchases
  ///
  /// In en, this message translates to:
  /// **'Purchases'**
  String get purchases;

  /// Label showing net profit
  ///
  /// In en, this message translates to:
  /// **'Net Profit'**
  String get netProfit;

  /// Unit showing the number of orders
  ///
  /// In en, this message translates to:
  /// **'orders'**
  String get orders;

  /// Title of the sales overview section
  ///
  /// In en, this message translates to:
  /// **'Sales Overview'**
  String get salesOverview;

  /// Filter option for today
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// Filter option for the current week
  ///
  /// In en, this message translates to:
  /// **'Week'**
  String get week;

  /// Filter option for the current month
  ///
  /// In en, this message translates to:
  /// **'Month'**
  String get month;

  /// Label showing total revenue for today
  ///
  /// In en, this message translates to:
  /// **'Total Revenue Today'**
  String get totalRevenueToday;

  /// Subtitle for the sales chart
  ///
  /// In en, this message translates to:
  /// **'Revenue over time'**
  String get revenueOverTime;

  /// Egyptian pound currency abbreviation
  ///
  /// In en, this message translates to:
  /// **'EGP'**
  String get currencyEgp;

  /// Sales chart time label
  ///
  /// In en, this message translates to:
  /// **'8AM'**
  String get chartTime8Am;

  /// Sales chart time label
  ///
  /// In en, this message translates to:
  /// **'10AM'**
  String get chartTime10Am;

  /// Sales chart time label
  ///
  /// In en, this message translates to:
  /// **'12PM'**
  String get chartTime12Pm;

  /// Sales chart time label
  ///
  /// In en, this message translates to:
  /// **'2PM'**
  String get chartTime2Pm;

  /// Sales chart time label
  ///
  /// In en, this message translates to:
  /// **'4PM'**
  String get chartTime4Pm;

  /// Sales chart time label
  ///
  /// In en, this message translates to:
  /// **'6PM'**
  String get chartTime6Pm;

  /// Text indicating comparison with yesterday
  ///
  /// In en, this message translates to:
  /// **'vs yesterday'**
  String get vsYesterday;

  /// Title of the top selling products section
  ///
  /// In en, this message translates to:
  /// **'Top Selling Products'**
  String get topSellingProducts;

  /// Button used to view all products
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get viewAll;

  /// Title of the low stock section
  ///
  /// In en, this message translates to:
  /// **'Low Stock'**
  String get lowStock;

  /// Label referring to items or products
  ///
  /// In en, this message translates to:
  /// **'Items'**
  String get items;

  /// Button used to manage items
  ///
  /// In en, this message translates to:
  /// **'Manage'**
  String get manage;

  /// No description provided for @totalProducts.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get totalProducts;

  /// No description provided for @outOfStock.
  ///
  /// In en, this message translates to:
  /// **'Out of Stock'**
  String get outOfStock;

  /// No description provided for @inStock.
  ///
  /// In en, this message translates to:
  /// **'In Stock'**
  String get inStock;

  /// No description provided for @minimumStock.
  ///
  /// In en, this message translates to:
  /// **'min'**
  String get minimumStock;

  /// No description provided for @sort.
  ///
  /// In en, this message translates to:
  /// **'Sort'**
  String get sort;

  /// No description provided for @unitsSold.
  ///
  /// In en, this message translates to:
  /// **'units sold'**
  String get unitsSold;

  /// No description provided for @pitaBreadBundle.
  ///
  /// In en, this message translates to:
  /// **'Pita Bread Bundle'**
  String get pitaBreadBundle;

  /// No description provided for @sunflowerCookingOil.
  ///
  /// In en, this message translates to:
  /// **'Sunflower Cooking Oil'**
  String get sunflowerCookingOil;

  /// No description provided for @egyptianWhiteRice.
  ///
  /// In en, this message translates to:
  /// **'Egyptian White Rice 5kg'**
  String get egyptianWhiteRice;

  /// No description provided for @refinedSugar.
  ///
  /// In en, this message translates to:
  /// **'Refined Sugar 1kg'**
  String get refinedSugar;

  /// No description provided for @tomatoPaste.
  ///
  /// In en, this message translates to:
  /// **'Tomato Paste 400g'**
  String get tomatoPaste;

  /// No description provided for @redLentils.
  ///
  /// In en, this message translates to:
  /// **'Red Lentils 1kg'**
  String get redLentils;

  /// No description provided for @liptonTea.
  ///
  /// In en, this message translates to:
  /// **'Lipton Black Tea 100 bags'**
  String get liptonTea;

  /// No description provided for @left.
  ///
  /// In en, this message translates to:
  /// **'left'**
  String get left;

  /// No description provided for @aiAssistant.
  ///
  /// In en, this message translates to:
  /// **'AI Assistant'**
  String get aiAssistant;

  /// No description provided for @connectedToStore.
  ///
  /// In en, this message translates to:
  /// **'Connected to your store'**
  String get connectedToStore;

  /// No description provided for @askMode.
  ///
  /// In en, this message translates to:
  /// **'Ask'**
  String get askMode;

  /// No description provided for @listenMode.
  ///
  /// In en, this message translates to:
  /// **'Listen'**
  String get listenMode;

  /// No description provided for @responseMode.
  ///
  /// In en, this message translates to:
  /// **'Response'**
  String get responseMode;

  /// No description provided for @howCanHelp.
  ///
  /// In en, this message translates to:
  /// **'How can I help you?'**
  String get howCanHelp;

  /// No description provided for @assistantHint.
  ///
  /// In en, this message translates to:
  /// **'Tap the mic or choose a question below'**
  String get assistantHint;

  /// No description provided for @tryAsking.
  ///
  /// In en, this message translates to:
  /// **'TRY ASKING'**
  String get tryAsking;

  /// No description provided for @typeQuestion.
  ///
  /// In en, this message translates to:
  /// **'Or type your question...'**
  String get typeQuestion;

  /// No description provided for @holdToSpeak.
  ///
  /// In en, this message translates to:
  /// **'Hold to speak'**
  String get holdToSpeak;

  /// No description provided for @assistantQuestionSales.
  ///
  /// In en, this message translates to:
  /// **'What did I sell today?'**
  String get assistantQuestionSales;

  /// No description provided for @assistantQuestionProducts.
  ///
  /// In en, this message translates to:
  /// **'How much did I make today?'**
  String get assistantQuestionProducts;

  /// No description provided for @assistantQuestionRestock.
  ///
  /// In en, this message translates to:
  /// **'Which products sold the most?'**
  String get assistantQuestionRestock;

  /// No description provided for @assistantQuestionInventory.
  ///
  /// In en, this message translates to:
  /// **'What do I need to restock?'**
  String get assistantQuestionInventory;

  /// Home navigation item
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// Reports navigation item
  ///
  /// In en, this message translates to:
  /// **'Reports'**
  String get reports;

  /// Inventory navigation item
  ///
  /// In en, this message translates to:
  /// **'Inventory'**
  String get inventory;

  /// Profile navigation item
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @storeDashboard.
  ///
  /// In en, this message translates to:
  /// **'Store Dashboard'**
  String get storeDashboard;

  /// No description provided for @searchProducts.
  ///
  /// In en, this message translates to:
  /// **'Search products...'**
  String get searchProducts;

  /// No description provided for @allCategory.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get allCategory;

  /// No description provided for @drinksCategory.
  ///
  /// In en, this message translates to:
  /// **'Drinks'**
  String get drinksCategory;

  /// No description provided for @foodCategory.
  ///
  /// In en, this message translates to:
  /// **'Food'**
  String get foodCategory;

  /// No description provided for @snacksCategory.
  ///
  /// In en, this message translates to:
  /// **'Snacks'**
  String get snacksCategory;

  /// No description provided for @householdCategory.
  ///
  /// In en, this message translates to:
  /// **'Household'**
  String get householdCategory;

  /// No description provided for @allProducts.
  ///
  /// In en, this message translates to:
  /// **'All Products'**
  String get allProducts;

  /// No description provided for @unitsInStock.
  ///
  /// In en, this message translates to:
  /// **'units in stock'**
  String get unitsInStock;

  /// No description provided for @bakeryCategory.
  ///
  /// In en, this message translates to:
  /// **'Bakery'**
  String get bakeryCategory;

  /// No description provided for @groceryCategory.
  ///
  /// In en, this message translates to:
  /// **'Grocery'**
  String get groceryCategory;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
