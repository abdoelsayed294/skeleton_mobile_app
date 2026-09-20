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

  /// Label showing returned sales
  ///
  /// In en, this message translates to:
  /// **'Returns'**
  String get returns;

  /// Label showing the number of items sold
  ///
  /// In en, this message translates to:
  /// **'Items Sold'**
  String get itemsSold;

  /// Short label for stock keeping units
  ///
  /// In en, this message translates to:
  /// **'SKUs'**
  String get stockKeepingUnits;

  /// Title for the profit details screen
  ///
  /// In en, this message translates to:
  /// **'Profit Details'**
  String get profitDetails;

  /// Gross profit metric label
  ///
  /// In en, this message translates to:
  /// **'Gross Profit'**
  String get grossProfit;

  /// Profit margin metric label
  ///
  /// In en, this message translates to:
  /// **'Margin'**
  String get margin;

  /// Revenue metric label
  ///
  /// In en, this message translates to:
  /// **'Revenue'**
  String get revenue;

  /// Expenses metric label
  ///
  /// In en, this message translates to:
  /// **'Expenses'**
  String get expenses;

  /// Net margin label
  ///
  /// In en, this message translates to:
  /// **'Net Margin'**
  String get netMargin;

  /// Year period filter label
  ///
  /// In en, this message translates to:
  /// **'Year'**
  String get year;

  /// Expense breakdown section title
  ///
  /// In en, this message translates to:
  /// **'Expense Breakdown'**
  String get expenseBreakdown;

  /// Expense breakdown subtitle
  ///
  /// In en, this message translates to:
  /// **'Where the money went today'**
  String get moneyWentToday;

  /// Cost of goods sold label
  ///
  /// In en, this message translates to:
  /// **'COGS'**
  String get cogs;

  /// Operations expense label
  ///
  /// In en, this message translates to:
  /// **'Operations'**
  String get operations;

  /// Salaries expense label
  ///
  /// In en, this message translates to:
  /// **'Salaries'**
  String get salaries;

  /// Weekly profit summary section title
  ///
  /// In en, this message translates to:
  /// **'Weekly Profit Summary'**
  String get weeklyProfitSummary;

  /// Weekly profit summary subtitle
  ///
  /// In en, this message translates to:
  /// **'Last 7 days performance'**
  String get last7DaysPerformance;

  /// Weekly total label
  ///
  /// In en, this message translates to:
  /// **'Week Total'**
  String get weekTotal;

  /// Weekly comparison label
  ///
  /// In en, this message translates to:
  /// **'vs Last Week'**
  String get lastWeek;

  /// Scan QR screen title
  ///
  /// In en, this message translates to:
  /// **'Connect to Desktop'**
  String get connectToDesktop;

  /// Scan status label
  ///
  /// In en, this message translates to:
  /// **'Waiting for scan'**
  String get waitingForScan;

  /// QR expiry label
  ///
  /// In en, this message translates to:
  /// **'expires'**
  String get expires;

  /// QR preview title
  ///
  /// In en, this message translates to:
  /// **'Scan QR Code'**
  String get scanQrCode;

  /// QR preview subtitle
  ///
  /// In en, this message translates to:
  /// **'Open your desktop app to scan'**
  String get openDesktopAppToScan;

  /// Desktop device label
  ///
  /// In en, this message translates to:
  /// **'Desktop'**
  String get desktop;

  /// Connection instructions title
  ///
  /// In en, this message translates to:
  /// **'How to connect'**
  String get howToConnect;

  /// Connection instruction one
  ///
  /// In en, this message translates to:
  /// **'Open Skeleton Desktop App'**
  String get openSkeletonDesktopApp;

  /// No description provided for @launchAppOnComputer.
  ///
  /// In en, this message translates to:
  /// **'Launch the app on your Windows or Mac computer'**
  String get launchAppOnComputer;

  /// Connection instruction two
  ///
  /// In en, this message translates to:
  /// **'Go to Connect Mobile'**
  String get goToConnectMobile;

  /// No description provided for @findQrCodeOnDesktop.
  ///
  /// In en, this message translates to:
  /// **'Find the QR code on your desktop screen'**
  String get findQrCodeOnDesktop;

  /// Connection instruction three
  ///
  /// In en, this message translates to:
  /// **'Scan the desktop QR with this app'**
  String get scanDesktopQrWithApp;

  /// No description provided for @pointCameraAtDesktop.
  ///
  /// In en, this message translates to:
  /// **'Point your phone camera at the desktop screen'**
  String get pointCameraAtDesktop;

  /// Open QR scanner button
  ///
  /// In en, this message translates to:
  /// **'Scan Desktop QR Code'**
  String get scanDesktopQrCode;

  /// QR scanner screen title
  ///
  /// In en, this message translates to:
  /// **'Scan QR'**
  String get scanQr;

  /// QR scanner helper text
  ///
  /// In en, this message translates to:
  /// **'Align the QR code inside the frame'**
  String get alignQrInFrame;

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

  /// No description provided for @management.
  ///
  /// In en, this message translates to:
  /// **'Management'**
  String get management;

  /// No description provided for @profileEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get profileEdit;

  /// No description provided for @profileOwnerRole.
  ///
  /// In en, this message translates to:
  /// **'STORE OWNER'**
  String get profileOwnerRole;

  /// No description provided for @profileBranches.
  ///
  /// In en, this message translates to:
  /// **'Branches'**
  String get profileBranches;

  /// No description provided for @profileEmployees.
  ///
  /// In en, this message translates to:
  /// **'Employees'**
  String get profileEmployees;

  /// No description provided for @profileCashiers.
  ///
  /// In en, this message translates to:
  /// **'Cashiers'**
  String get profileCashiers;

  /// No description provided for @profileSuppliers.
  ///
  /// In en, this message translates to:
  /// **'Suppliers'**
  String get profileSuppliers;

  /// No description provided for @storeInformation.
  ///
  /// In en, this message translates to:
  /// **'Store Information'**
  String get storeInformation;

  /// No description provided for @storeName.
  ///
  /// In en, this message translates to:
  /// **'Store Name'**
  String get storeName;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @businessType.
  ///
  /// In en, this message translates to:
  /// **'Business Type'**
  String get businessType;

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

  /// No description provided for @reportsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Overview of your business performance'**
  String get reportsSubtitle;

  /// No description provided for @custom.
  ///
  /// In en, this message translates to:
  /// **'Custom'**
  String get custom;

  /// No description provided for @totalRevenue.
  ///
  /// In en, this message translates to:
  /// **'Total Revenue'**
  String get totalRevenue;

  /// No description provided for @totalOrders.
  ///
  /// In en, this message translates to:
  /// **'Total Orders'**
  String get totalOrders;

  /// No description provided for @notificationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notificationsTitle;

  /// No description provided for @notificationsAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get notificationsAll;

  /// No description provided for @notificationsUnread.
  ///
  /// In en, this message translates to:
  /// **'Unread'**
  String get notificationsUnread;

  /// No description provided for @markAllRead.
  ///
  /// In en, this message translates to:
  /// **'Mark all read'**
  String get markAllRead;

  /// No description provided for @noNotifications.
  ///
  /// In en, this message translates to:
  /// **'You are all caught up'**
  String get noNotifications;

  /// No description provided for @notificationLowStockTitle.
  ///
  /// In en, this message translates to:
  /// **'Low stock alert'**
  String get notificationLowStockTitle;

  /// No description provided for @notificationLowStockBody.
  ///
  /// In en, this message translates to:
  /// **'Some products are below their minimum stock level.'**
  String get notificationLowStockBody;

  /// No description provided for @notificationSaleTitle.
  ///
  /// In en, this message translates to:
  /// **'New sale recorded'**
  String get notificationSaleTitle;

  /// No description provided for @notificationSaleBody.
  ///
  /// In en, this message translates to:
  /// **'A new order was added to today\'s sales.'**
  String get notificationSaleBody;

  /// No description provided for @notificationInventoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Inventory updated'**
  String get notificationInventoryTitle;

  /// No description provided for @notificationInventoryBody.
  ///
  /// In en, this message translates to:
  /// **'Your inventory data was synced successfully.'**
  String get notificationInventoryBody;

  /// No description provided for @justNow.
  ///
  /// In en, this message translates to:
  /// **'Just now'**
  String get justNow;

  /// No description provided for @minutesAgo.
  ///
  /// In en, this message translates to:
  /// **'12 minutes ago'**
  String get minutesAgo;

  /// No description provided for @hourAgo.
  ///
  /// In en, this message translates to:
  /// **'1 hour ago'**
  String get hourAgo;

  /// No description provided for @activityStream.
  ///
  /// In en, this message translates to:
  /// **'Activity Stream'**
  String get activityStream;

  /// No description provided for @unreadUpdates.
  ///
  /// In en, this message translates to:
  /// **'unread updates'**
  String get unreadUpdates;

  /// No description provided for @todaySmall.
  ///
  /// In en, this message translates to:
  /// **'today'**
  String get todaySmall;

  /// No description provided for @readAll.
  ///
  /// In en, this message translates to:
  /// **'Read All'**
  String get readAll;

  /// No description provided for @inventoryAndStock.
  ///
  /// In en, this message translates to:
  /// **'Inventory & Stock'**
  String get inventoryAndStock;

  /// No description provided for @ordersAndSales.
  ///
  /// In en, this message translates to:
  /// **'Orders & Sales'**
  String get ordersAndSales;

  /// No description provided for @notificationToday.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get notificationToday;

  /// No description provided for @notificationTodayCount.
  ///
  /// In en, this message translates to:
  /// **'3 updates'**
  String get notificationTodayCount;

  /// No description provided for @notificationYesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get notificationYesterday;

  /// No description provided for @notificationYesterdayCount.
  ///
  /// In en, this message translates to:
  /// **'2 updates'**
  String get notificationYesterdayCount;

  /// No description provided for @notificationEarlier.
  ///
  /// In en, this message translates to:
  /// **'Earlier'**
  String get notificationEarlier;

  /// No description provided for @notificationEarlierDate.
  ///
  /// In en, this message translates to:
  /// **'Nov 17'**
  String get notificationEarlierDate;

  /// No description provided for @notificationTenMinutesAgo.
  ///
  /// In en, this message translates to:
  /// **'10m ago'**
  String get notificationTenMinutesAgo;

  /// No description provided for @notificationThreeLeft.
  ///
  /// In en, this message translates to:
  /// **'3 left'**
  String get notificationThreeLeft;

  /// No description provided for @notificationQuickReorder.
  ///
  /// In en, this message translates to:
  /// **'Quick Reorder'**
  String get notificationQuickReorder;

  /// No description provided for @notificationPurchaseTitle.
  ///
  /// In en, this message translates to:
  /// **'New Purchase Order Received'**
  String get notificationPurchaseTitle;

  /// No description provided for @notificationPurchaseBody.
  ///
  /// In en, this message translates to:
  /// **'SoundTech Co., Ltd. delivered 50 units of Wireless Earbuds Pro.'**
  String get notificationPurchaseBody;

  /// No description provided for @notificationOneHourAgo.
  ///
  /// In en, this message translates to:
  /// **'1h ago'**
  String get notificationOneHourAgo;

  /// No description provided for @notificationPoNumber.
  ///
  /// In en, this message translates to:
  /// **'PO #8842'**
  String get notificationPoNumber;

  /// No description provided for @notificationFiftyUnits.
  ///
  /// In en, this message translates to:
  /// **'50 Units'**
  String get notificationFiftyUnits;

  /// No description provided for @notificationTargetTitle.
  ///
  /// In en, this message translates to:
  /// **'Daily Target Achieved 🎉'**
  String get notificationTargetTitle;

  /// No description provided for @notificationTargetBody.
  ///
  /// In en, this message translates to:
  /// **'Today\'s sales surpassed EGP 12,000 across branches.'**
  String get notificationTargetBody;

  /// No description provided for @notificationThreeHoursAgo.
  ///
  /// In en, this message translates to:
  /// **'3h ago'**
  String get notificationThreeHoursAgo;

  /// No description provided for @notificationGoal.
  ///
  /// In en, this message translates to:
  /// **'108% of goal'**
  String get notificationGoal;

  /// No description provided for @notificationRevenue.
  ///
  /// In en, this message translates to:
  /// **'EGP 12,480.00'**
  String get notificationRevenue;

  /// No description provided for @notificationPaymentTitle.
  ///
  /// In en, this message translates to:
  /// **'Supplier Payment Due Tomorrow'**
  String get notificationPaymentTitle;

  /// No description provided for @notificationPaymentBody.
  ///
  /// In en, this message translates to:
  /// **'Delta Express Wholesale invoice #INV-1039 (EGP 9,100) due Nov 20.'**
  String get notificationPaymentBody;

  /// No description provided for @notificationPaymentTime.
  ///
  /// In en, this message translates to:
  /// **'4:30 PM'**
  String get notificationPaymentTime;

  /// No description provided for @notificationInvoice.
  ///
  /// In en, this message translates to:
  /// **'Invoice #INV-1039'**
  String get notificationInvoice;

  /// No description provided for @notificationPaymentAmount.
  ///
  /// In en, this message translates to:
  /// **'EGP 9,100.00'**
  String get notificationPaymentAmount;

  /// No description provided for @notificationShiftTitle.
  ///
  /// In en, this message translates to:
  /// **'Cashier Shift Closed'**
  String get notificationShiftTitle;

  /// No description provided for @notificationShiftBody.
  ///
  /// In en, this message translates to:
  /// **'Terminal #2 closed by Ahmed with total cash EGP 4,250.'**
  String get notificationShiftBody;

  /// No description provided for @notificationShiftTime.
  ///
  /// In en, this message translates to:
  /// **'11:00 PM'**
  String get notificationShiftTime;

  /// No description provided for @notificationTerminal.
  ///
  /// In en, this message translates to:
  /// **'Terminal #02'**
  String get notificationTerminal;

  /// No description provided for @notificationOperator.
  ///
  /// In en, this message translates to:
  /// **'Operator: Ahmed'**
  String get notificationOperator;

  /// No description provided for @notificationBackupTitle.
  ///
  /// In en, this message translates to:
  /// **'Weekly Cloud Backup Complete'**
  String get notificationBackupTitle;

  /// No description provided for @notificationBackupBody.
  ///
  /// In en, this message translates to:
  /// **'All sales and inventory records safely backed up.'**
  String get notificationBackupBody;

  /// No description provided for @notificationBackupDate.
  ///
  /// In en, this message translates to:
  /// **'Nov 17'**
  String get notificationBackupDate;

  /// No description provided for @notificationVerified.
  ///
  /// In en, this message translates to:
  /// **'Verified Integrity'**
  String get notificationVerified;

  /// No description provided for @notificationStorage.
  ///
  /// In en, this message translates to:
  /// **'418 MB'**
  String get notificationStorage;

  /// No description provided for @notificationPreferences.
  ///
  /// In en, this message translates to:
  /// **'Notification Preferences'**
  String get notificationPreferences;

  /// No description provided for @notificationPreferencesBody.
  ///
  /// In en, this message translates to:
  /// **'Configure push, SMS & alert thresholds'**
  String get notificationPreferencesBody;

  /// No description provided for @avgOrderValue.
  ///
  /// In en, this message translates to:
  /// **'Avg. Order Value'**
  String get avgOrderValue;

  /// No description provided for @revenueTrend.
  ///
  /// In en, this message translates to:
  /// **'Revenue Trend'**
  String get revenueTrend;

  /// No description provided for @vsPreviousPeriod.
  ///
  /// In en, this message translates to:
  /// **'vs previous period'**
  String get vsPreviousPeriod;

  /// No description provided for @dayMon.
  ///
  /// In en, this message translates to:
  /// **'Mon'**
  String get dayMon;

  /// No description provided for @dayTue.
  ///
  /// In en, this message translates to:
  /// **'Tue'**
  String get dayTue;

  /// No description provided for @dayWed.
  ///
  /// In en, this message translates to:
  /// **'Wed'**
  String get dayWed;

  /// No description provided for @dayThu.
  ///
  /// In en, this message translates to:
  /// **'Thu'**
  String get dayThu;

  /// No description provided for @dayFri.
  ///
  /// In en, this message translates to:
  /// **'Fri'**
  String get dayFri;

  /// No description provided for @daySat.
  ///
  /// In en, this message translates to:
  /// **'Sat'**
  String get daySat;

  /// No description provided for @salesByCategory.
  ///
  /// In en, this message translates to:
  /// **'Sales by Category'**
  String get salesByCategory;

  /// No description provided for @categoryGroceries.
  ///
  /// In en, this message translates to:
  /// **'Groceries'**
  String get categoryGroceries;

  /// No description provided for @categoryBeverages.
  ///
  /// In en, this message translates to:
  /// **'Beverages'**
  String get categoryBeverages;

  /// No description provided for @categoryDairy.
  ///
  /// In en, this message translates to:
  /// **'Dairy'**
  String get categoryDairy;

  /// No description provided for @categoryHousehold.
  ///
  /// In en, this message translates to:
  /// **'Household'**
  String get categoryHousehold;

  /// No description provided for @categoryOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get categoryOther;

  /// No description provided for @detailedReports.
  ///
  /// In en, this message translates to:
  /// **'Detailed Reports'**
  String get detailedReports;

  /// No description provided for @salesReport.
  ///
  /// In en, this message translates to:
  /// **'Sales Report'**
  String get salesReport;

  /// No description provided for @salesReportDesc.
  ///
  /// In en, this message translates to:
  /// **'Revenue, orders and payment methods'**
  String get salesReportDesc;

  /// No description provided for @inventoryReport.
  ///
  /// In en, this message translates to:
  /// **'Inventory Report'**
  String get inventoryReport;

  /// No description provided for @inventoryReportDesc.
  ///
  /// In en, this message translates to:
  /// **'Stock levels and movement history'**
  String get inventoryReportDesc;

  /// No description provided for @profitLossReport.
  ///
  /// In en, this message translates to:
  /// **'Profit & Loss'**
  String get profitLossReport;

  /// No description provided for @profitLossReportDesc.
  ///
  /// In en, this message translates to:
  /// **'Costs, margins and net profit'**
  String get profitLossReportDesc;

  /// No description provided for @taxReport.
  ///
  /// In en, this message translates to:
  /// **'Tax Report'**
  String get taxReport;

  /// No description provided for @taxReportDesc.
  ///
  /// In en, this message translates to:
  /// **'VAT summary for filing'**
  String get taxReportDesc;

  /// No description provided for @exportReport.
  ///
  /// In en, this message translates to:
  /// **'Export Report'**
  String get exportReport;

  /// No description provided for @salesReportsTitle.
  ///
  /// In en, this message translates to:
  /// **'Sales Reports'**
  String get salesReportsTitle;

  /// No description provided for @thisMonth.
  ///
  /// In en, this message translates to:
  /// **'This Month'**
  String get thisMonth;

  /// No description provided for @totalSales.
  ///
  /// In en, this message translates to:
  /// **'Total Sales'**
  String get totalSales;

  /// No description provided for @comparedToLastMonth.
  ///
  /// In en, this message translates to:
  /// **'compared to last month'**
  String get comparedToLastMonth;

  /// No description provided for @avgOrder.
  ///
  /// In en, this message translates to:
  /// **'Avg. Order'**
  String get avgOrder;

  /// No description provided for @ordersLabel.
  ///
  /// In en, this message translates to:
  /// **'Orders'**
  String get ordersLabel;

  /// No description provided for @customers.
  ///
  /// In en, this message translates to:
  /// **'Customers'**
  String get customers;

  /// No description provided for @salesPerformance.
  ///
  /// In en, this message translates to:
  /// **'Sales Performance'**
  String get salesPerformance;

  /// No description provided for @filterDaily.
  ///
  /// In en, this message translates to:
  /// **'Daily'**
  String get filterDaily;

  /// No description provided for @filterWeekly.
  ///
  /// In en, this message translates to:
  /// **'Weekly'**
  String get filterWeekly;

  /// No description provided for @filterMonthly.
  ///
  /// In en, this message translates to:
  /// **'Monthly'**
  String get filterMonthly;

  /// No description provided for @dailyOverview.
  ///
  /// In en, this message translates to:
  /// **'Daily overview'**
  String get dailyOverview;

  /// No description provided for @salesBreakdown.
  ///
  /// In en, this message translates to:
  /// **'Sales Breakdown'**
  String get salesBreakdown;

  /// No description provided for @byPaymentMethod.
  ///
  /// In en, this message translates to:
  /// **'By payment method'**
  String get byPaymentMethod;

  /// No description provided for @paymentCash.
  ///
  /// In en, this message translates to:
  /// **'Cash'**
  String get paymentCash;

  /// No description provided for @paymentCard.
  ///
  /// In en, this message translates to:
  /// **'Card'**
  String get paymentCard;

  /// No description provided for @paymentWallet.
  ///
  /// In en, this message translates to:
  /// **'Wallet'**
  String get paymentWallet;

  /// No description provided for @paymentOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get paymentOther;

  /// No description provided for @recentTransactions.
  ///
  /// In en, this message translates to:
  /// **'Recent Transactions'**
  String get recentTransactions;

  /// No description provided for @seeAll.
  ///
  /// In en, this message translates to:
  /// **'See All'**
  String get seeAll;

  /// No description provided for @exportReportAsPdf.
  ///
  /// In en, this message translates to:
  /// **'Export Report as PDF'**
  String get exportReportAsPdf;

  /// No description provided for @lastSyncedToday.
  ///
  /// In en, this message translates to:
  /// **'Last synced: Today at'**
  String get lastSyncedToday;

  /// No description provided for @productLiptonTea.
  ///
  /// In en, this message translates to:
  /// **'Lipton Leaf Tea 400g'**
  String get productLiptonTea;

  /// No description provided for @productBaladiBread.
  ///
  /// In en, this message translates to:
  /// **'Baladi Bread (Pack 5)'**
  String get productBaladiBread;

  /// No description provided for @productSunflowerOilHayat.
  ///
  /// In en, this message translates to:
  /// **'Hayat Sunflower Oil 1.8L'**
  String get productSunflowerOilHayat;

  /// No description provided for @productHalawaExtraFine.
  ///
  /// In en, this message translates to:
  /// **'Halawa Extra Fine 500g'**
  String get productHalawaExtraFine;

  /// No description provided for @productSafiWater.
  ///
  /// In en, this message translates to:
  /// **'Safi Water 1.5L x6'**
  String get productSafiWater;

  /// No description provided for @totalPurchases.
  ///
  /// In en, this message translates to:
  /// **'TOTAL PURCHASES'**
  String get totalPurchases;

  /// No description provided for @vsLastMonth.
  ///
  /// In en, this message translates to:
  /// **'+ 12.4% vs last month'**
  String get vsLastMonth;

  /// No description provided for @ordersUpper.
  ///
  /// In en, this message translates to:
  /// **'ORDERS'**
  String get ordersUpper;

  /// No description provided for @sourcesUpper.
  ///
  /// In en, this message translates to:
  /// **'SOURCES'**
  String get sourcesUpper;

  /// No description provided for @purchaseCount.
  ///
  /// In en, this message translates to:
  /// **'Purchases'**
  String get purchaseCount;

  /// No description provided for @suppliers.
  ///
  /// In en, this message translates to:
  /// **'Suppliers'**
  String get suppliers;

  /// No description provided for @recentPurchases.
  ///
  /// In en, this message translates to:
  /// **'RECENT PURCHASES'**
  String get recentPurchases;

  /// No description provided for @addPurchase.
  ///
  /// In en, this message translates to:
  /// **'Add Purchase'**
  String get addPurchase;

  /// No description provided for @paid.
  ///
  /// In en, this message translates to:
  /// **'PAID'**
  String get paid;

  /// No description provided for @partial.
  ///
  /// In en, this message translates to:
  /// **'PARTIAL'**
  String get partial;

  /// No description provided for @pending.
  ///
  /// In en, this message translates to:
  /// **'PENDING'**
  String get pending;

  /// No description provided for @itemsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} Items'**
  String itemsCount(Object count);

  /// No description provided for @remainingAmount.
  ///
  /// In en, this message translates to:
  /// **'{amount} remaining'**
  String remainingAmount(Object amount);

  /// No description provided for @dueDate.
  ///
  /// In en, this message translates to:
  /// **'Due {date}'**
  String dueDate(Object date);

  /// No description provided for @freshMarketSupplier.
  ///
  /// In en, this message translates to:
  /// **'Fresh Market Supplier'**
  String get freshMarketSupplier;

  /// No description provided for @alGhazalTrading.
  ///
  /// In en, this message translates to:
  /// **'Al-Ghazal Trading Co.'**
  String get alGhazalTrading;

  /// No description provided for @nileFoodsDistribution.
  ///
  /// In en, this message translates to:
  /// **'Nile Foods Distribution'**
  String get nileFoodsDistribution;

  /// No description provided for @deltaExpressWholesale.
  ///
  /// In en, this message translates to:
  /// **'Delta Express Wholesale'**
  String get deltaExpressWholesale;

  /// No description provided for @kareemGeneralImports.
  ///
  /// In en, this message translates to:
  /// **'Kareem General Imports'**
  String get kareemGeneralImports;

  /// No description provided for @medPharmaSupplies.
  ///
  /// In en, this message translates to:
  /// **'MedPharma Supplies'**
  String get medPharmaSupplies;

  /// No description provided for @editProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfile;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @emailAddress.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get emailAddress;

  /// No description provided for @personalInformation.
  ///
  /// In en, this message translates to:
  /// **'Personal Information'**
  String get personalInformation;

  /// No description provided for @storeBusinessDetails.
  ///
  /// In en, this message translates to:
  /// **'Store & Business Details'**
  String get storeBusinessDetails;

  /// No description provided for @storeAddressPrimaryBranch.
  ///
  /// In en, this message translates to:
  /// **'Store Address / Primary Branch'**
  String get storeAddressPrimaryBranch;

  /// No description provided for @taxCommercialRegNumber.
  ///
  /// In en, this message translates to:
  /// **'Tax / Commercial Reg. Number'**
  String get taxCommercialRegNumber;

  /// No description provided for @securityAccess.
  ///
  /// In en, this message translates to:
  /// **'Security & Access'**
  String get securityAccess;

  /// No description provided for @changePassword.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get changePassword;

  /// No description provided for @lastUpdatedDaysAgo.
  ///
  /// In en, this message translates to:
  /// **'Last updated {days} days ago'**
  String lastUpdatedDaysAgo(Object days);

  /// No description provided for @twoFactorAuthentication.
  ///
  /// In en, this message translates to:
  /// **'Two-Factor Authentication'**
  String get twoFactorAuthentication;

  /// No description provided for @smsAuthenticatorActive.
  ///
  /// In en, this message translates to:
  /// **'SMS & Authenticator App active'**
  String get smsAuthenticatorActive;

  /// No description provided for @saveChanges.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get saveChanges;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @activeBranches.
  ///
  /// In en, this message translates to:
  /// **'{count} Active'**
  String activeBranches(Object count);

  /// No description provided for @memberSince.
  ///
  /// In en, this message translates to:
  /// **'MEMBER SINCE'**
  String get memberSince;

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'STATUS'**
  String get status;

  /// No description provided for @verified.
  ///
  /// In en, this message translates to:
  /// **'Verified'**
  String get verified;

  /// No description provided for @storeOwner.
  ///
  /// In en, this message translates to:
  /// **'STORE OWNER'**
  String get storeOwner;

  /// No description provided for @taxRegistrationNumber.
  ///
  /// In en, this message translates to:
  /// **'CR-904812-EGY'**
  String get taxRegistrationNumber;
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
