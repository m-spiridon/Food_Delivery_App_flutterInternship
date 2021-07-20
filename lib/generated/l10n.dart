// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Search...`
  String get searchBarHintText {
    return Intl.message(
      'Search...',
      name: 'searchBarHintText',
      desc: '',
      args: [],
    );
  }

  /// `Recipes`
  String get recipesScreenAppBarTitle {
    return Intl.message(
      'Recipes',
      name: 'recipesScreenAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `{time} minutes`
  String recipeCardTimeToCook(Object time) {
    return Intl.message(
      '$time minutes',
      name: 'recipeCardTimeToCook',
      desc: '',
      args: [time],
    );
  }

  /// `Blog`
  String get blogDiscoverTitle {
    return Intl.message(
      'Blog',
      name: 'blogDiscoverTitle',
      desc: '',
      args: [],
    );
  }

  /// `Recipe`
  String get recipeDiscoverTitle {
    return Intl.message(
      'Recipe',
      name: 'recipeDiscoverTitle',
      desc: '',
      args: [],
    );
  }

  /// `Simple suppers`
  String get simpleSuppers {
    return Intl.message(
      'Simple suppers',
      name: 'simpleSuppers',
      desc: '',
      args: [],
    );
  }

  /// `Best of the seasons`
  String get bestOfTheSeasons {
    return Intl.message(
      'Best of the seasons',
      name: 'bestOfTheSeasons',
      desc: '',
      args: [],
    );
  }

  /// `New to the shop`
  String get newToTheShop {
    return Intl.message(
      'New to the shop',
      name: 'newToTheShop',
      desc: '',
      args: [],
    );
  }

  /// `$`
  String get currency {
    return Intl.message(
      '\$',
      name: 'currency',
      desc: '',
      args: [],
    );
  }

  /// `Our producers`
  String get ourProducersTitle {
    return Intl.message(
      'Our producers',
      name: 'ourProducersTitle',
      desc: '',
      args: [],
    );
  }

  /// `View all`
  String get viewAllBtnText {
    return Intl.message(
      'View all',
      name: 'viewAllBtnText',
      desc: '',
      args: [],
    );
  }

  /// `Your delivery slot`
  String get deliverySlotTitle {
    return Intl.message(
      'Your delivery slot',
      name: 'deliverySlotTitle',
      desc: '',
      args: [],
    );
  }

  /// `Shelf life:`
  String get productShelfTime {
    return Intl.message(
      'Shelf life:',
      name: 'productShelfTime',
      desc: '',
      args: [],
    );
  }

  /// `days`
  String get productDays {
    return Intl.message(
      'days',
      name: 'productDays',
      desc: '',
      args: [],
    );
  }

  /// `Produced in:`
  String get productProducedIn {
    return Intl.message(
      'Produced in:',
      name: 'productProducedIn',
      desc: '',
      args: [],
    );
  }

  /// `Add to basket`
  String get productAddBtn {
    return Intl.message(
      'Add to basket',
      name: 'productAddBtn',
      desc: '',
      args: [],
    );
  }

  /// `Wraps`
  String get productWraps {
    return Intl.message(
      'Wraps',
      name: 'productWraps',
      desc: '',
      args: [],
    );
  }

  /// `Payment on delivery`
  String get paymentOnDelivery {
    return Intl.message(
      'Payment on delivery',
      name: 'paymentOnDelivery',
      desc: '',
      args: [],
    );
  }

  /// `Complete order`
  String get completeOrder {
    return Intl.message(
      'Complete order',
      name: 'completeOrder',
      desc: '',
      args: [],
    );
  }

  /// `Hello `
  String get hello {
    return Intl.message(
      'Hello ',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your address`
  String get noAdress {
    return Intl.message(
      'Please enter your address',
      name: 'noAdress',
      desc: '',
      args: [],
    );
  }

  /// `Your bonuses`
  String get bonuses {
    return Intl.message(
      'Your bonuses',
      name: 'bonuses',
      desc: '',
      args: [],
    );
  }

  /// `Buy our food for $20 dollars per 1 check and get $1 dollar. The bonus will increase with every 5 orders`
  String get bonusInfo {
    return Intl.message(
      'Buy our food for \$20 dollars per 1 check and get \$1 dollar. The bonus will increase with every 5 orders',
      name: 'bonusInfo',
      desc: '',
      args: [],
    );
  }

  /// `Give us a call`
  String get callMe {
    return Intl.message(
      'Give us a call',
      name: 'callMe',
      desc: '',
      args: [],
    );
  }

  /// `For any suggestions, inquiries or any other reason, you can give us a call from Monday to Sunday, 9am - 9pm`
  String get callInfo {
    return Intl.message(
      'For any suggestions, inquiries or any other reason, you can give us a call from Monday to Sunday, 9am - 9pm',
      name: 'callInfo',
      desc: '',
      args: [],
    );
  }

  /// `Our number: `
  String get callNumber {
    return Intl.message(
      'Our number: ',
      name: 'callNumber',
      desc: '',
      args: [],
    );
  }

  /// `Ingredients`
  String get recipeIngredients {
    return Intl.message(
      'Ingredients',
      name: 'recipeIngredients',
      desc: '',
      args: [],
    );
  }

  /// `Cooking instructions`
  String get recipeInstructions {
    return Intl.message(
      'Cooking instructions',
      name: 'recipeInstructions',
      desc: '',
      args: [],
    );
  }

  /// `Serves makes:`
  String get recipeServesMakes {
    return Intl.message(
      'Serves makes:',
      name: 'recipeServesMakes',
      desc: '',
      args: [],
    );
  }

  /// `items`
  String get recipeItems {
    return Intl.message(
      'items',
      name: 'recipeItems',
      desc: '',
      args: [],
    );
  }

  /// `Add all items`
  String get recipeAddAllItems {
    return Intl.message(
      'Add all items',
      name: 'recipeAddAllItems',
      desc: '',
      args: [],
    );
  }

  /// `Your details`
  String get profileDetailsScreenAppBarTitle {
    return Intl.message(
      'Your details',
      name: 'profileDetailsScreenAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Personal details`
  String get categoryPersonalDetails {
    return Intl.message(
      'Personal details',
      name: 'categoryPersonalDetails',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get optionName {
    return Intl.message(
      'Name',
      name: 'optionName',
      desc: '',
      args: [],
    );
  }

  /// `Contact details`
  String get optionContactDetails {
    return Intl.message(
      'Contact details',
      name: 'optionContactDetails',
      desc: '',
      args: [],
    );
  }

  /// `Change your password`
  String get optionChangePassword {
    return Intl.message(
      'Change your password',
      name: 'optionChangePassword',
      desc: '',
      args: [],
    );
  }

  /// `Delivery information`
  String get categoryDeliveryInfo {
    return Intl.message(
      'Delivery information',
      name: 'categoryDeliveryInfo',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get optionAddress {
    return Intl.message(
      'Address',
      name: 'optionAddress',
      desc: '',
      args: [],
    );
  }

  /// `Delivery address`
  String get deliveryAddress {
    return Intl.message(
      'Delivery address',
      name: 'deliveryAddress',
      desc: '',
      args: [],
    );
  }

  /// `Default payment option`
  String get categoryDefaultPaymentOption {
    return Intl.message(
      'Default payment option',
      name: 'categoryDefaultPaymentOption',
      desc: '',
      args: [],
    );
  }

  /// `Email preferences`
  String get categoryEmailPreferences {
    return Intl.message(
      'Email preferences',
      name: 'categoryEmailPreferences',
      desc: '',
      args: [],
    );
  }

  /// `Receive newsletters`
  String get optionReceiveNewsletters {
    return Intl.message(
      'Receive newsletters',
      name: 'optionReceiveNewsletters',
      desc: '',
      args: [],
    );
  }

  /// `items`
  String get items {
    return Intl.message(
      'items',
      name: 'items',
      desc: '',
      args: [],
    );
  }

  /// `details`
  String get details {
    return Intl.message(
      'details',
      name: 'details',
      desc: '',
      args: [],
    );
  }

  /// `Hi`
  String get Hi {
    return Intl.message(
      'Hi',
      name: 'Hi',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Shopping list`
  String get shoppingList {
    return Intl.message(
      'Shopping list',
      name: 'shoppingList',
      desc: '',
      args: [],
    );
  }

  /// `Your orders`
  String get yourOrders {
    return Intl.message(
      'Your orders',
      name: 'yourOrders',
      desc: '',
      args: [],
    );
  }

  /// `View`
  String get view {
    return Intl.message(
      'View',
      name: 'view',
      desc: '',
      args: [],
    );
  }

  /// `You havn't made any orders yet :(`
  String get noOrders {
    return Intl.message(
      'You havn`t made any orders yet :(',
      name: 'noOrders',
      desc: '',
      args: [],
    );
  }

  /// `Why not create one?`
  String get createOne {
    return Intl.message(
      'Why not create one?',
      name: 'createOne',
      desc: '',
      args: [],
    );
  }

  /// `Your total price: `
  String get totalPrice {
    return Intl.message(
      'Your total price: ',
      name: 'totalPrice',
      desc: '',
      args: [],
    );
  }

  /// `Login Failure`
  String get loginFailure {
    return Intl.message(
      'Login Failure',
      name: 'loginFailure',
      desc: '',
      args: [],
    );
  }

  /// `Logging In...`
  String get loggingIn {
    return Intl.message(
      'Logging In...',
      name: 'loggingIn',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signUp {
    return Intl.message(
      'Sign up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email address`
  String get invalidEmail {
    return Intl.message(
      'Please enter a valid email address',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Invalid log in details`
  String get invalidLogIn {
    return Intl.message(
      'Invalid log in details',
      name: 'invalidLogIn',
      desc: '',
      args: [],
    );
  }

  /// `You have entered an invalid username or password`
  String get enteredInvalidLogIn {
    return Intl.message(
      'You have entered an invalid username or password',
      name: 'enteredInvalidLogIn',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Invalid password. It must contain 1 capital letter, 1 digit and 1 special character`
  String get invalidPassword {
    return Intl.message(
      'Invalid password. It must contain 1 capital letter, 1 digit and 1 special character',
      name: 'invalidPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid UK postcode`
  String get validPostCode {
    return Intl.message(
      'Please enter a valid UK postcode',
      name: 'validPostCode',
      desc: '',
      args: [],
    );
  }

  /// `Forgotten password?`
  String get forgotPassword {
    return Intl.message(
      'Forgotten password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `First time here?`
  String get firstTime {
    return Intl.message(
      'First time here?',
      name: 'firstTime',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get login {
    return Intl.message(
      'Log in',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Postcode`
  String get postcode {
    return Intl.message(
      'Postcode',
      name: 'postcode',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get isHaveAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'isHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Create an new account`
  String get createNewAccount {
    return Intl.message(
      'Create an new account',
      name: 'createNewAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign up with email`
  String get signUpWithEmail {
    return Intl.message(
      'Sign up with email',
      name: 'signUpWithEmail',
      desc: '',
      args: [],
    );
  }

  /// `Register Failure`
  String get registerFailure {
    return Intl.message(
      'Register Failure',
      name: 'registerFailure',
      desc: '',
      args: [],
    );
  }

  /// `Registering...`
  String get registering {
    return Intl.message(
      'Registering...',
      name: 'registering',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Log in for a more personalised account`
  String get logInForMoreFunctional {
    return Intl.message(
      'Log in for a more personalised account',
      name: 'logInForMoreFunctional',
      desc: '',
      args: [],
    );
  }

  /// `Sign up now`
  String get signUpNow {
    return Intl.message(
      'Sign up now',
      name: 'signUpNow',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get addBtnText {
    return Intl.message(
      'Add',
      name: 'addBtnText',
      desc: '',
      args: [],
    );
  }

  /// `Recipe ideas`
  String get recipeIdeas {
    return Intl.message(
      'Recipe ideas',
      name: 'recipeIdeas',
      desc: '',
      args: [],
    );
  }

  /// `Order Summary`
  String get orderSummaryScreenAppBarTitle {
    return Intl.message(
      'Order Summary',
      name: 'orderSummaryScreenAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Delivery slot`
  String get categoryDeliverySlot {
    return Intl.message(
      'Delivery slot',
      name: 'categoryDeliverySlot',
      desc: '',
      args: [],
    );
  }

  /// `Payment details`
  String get categoryPaymentDetails {
    return Intl.message(
      'Payment details',
      name: 'categoryPaymentDetails',
      desc: '',
      args: [],
    );
  }

  /// `Driver instructions`
  String get optionDriverInstructions {
    return Intl.message(
      'Driver instructions',
      name: 'optionDriverInstructions',
      desc: '',
      args: [],
    );
  }

  /// `Optional message for your Farmdropper`
  String get optionDriverInstructionsHint {
    return Intl.message(
      'Optional message for your Farmdropper',
      name: 'optionDriverInstructionsHint',
      desc: '',
      args: [],
    );
  }

  /// `Basket total`
  String get basketTotal {
    return Intl.message(
      'Basket total',
      name: 'basketTotal',
      desc: '',
      args: [],
    );
  }

  /// `Delivery`
  String get delivery {
    return Intl.message(
      'Delivery',
      name: 'delivery',
      desc: '',
      args: [],
    );
  }

  /// `Add a promo code or gift card`
  String get addPromoCodeOrGiftCard {
    return Intl.message(
      'Add a promo code or gift card',
      name: 'addPromoCodeOrGiftCard',
      desc: '',
      args: [],
    );
  }

  /// `Pay`
  String get payButtonText {
    return Intl.message(
      'Pay',
      name: 'payButtonText',
      desc: '',
      args: [],
    );
  }

  /// `Add {currency}{amount} to get free delivery`
  String addToGetFreeDelivery(Object currency, Object amount) {
    return Intl.message(
      'Add $currency$amount to get free delivery',
      name: 'addToGetFreeDelivery',
      desc: '',
      args: [currency, amount],
    );
  }

  /// `You might also like`
  String get youMightLikeScreenAppBarTitle {
    return Intl.message(
      'You might also like',
      name: 'youMightLikeScreenAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Before you go`
  String get youMightLikeBeforeYouGoCategory {
    return Intl.message(
      'Before you go',
      name: 'youMightLikeBeforeYouGoCategory',
      desc: '',
      args: [],
    );
  }

  /// `Because you like...`
  String get youMightLikeBecauseYouLikeCategory {
    return Intl.message(
      'Because you like...',
      name: 'youMightLikeBecauseYouLikeCategory',
      desc: '',
      args: [],
    );
  }

  /// `Continue to checkout`
  String get youMightLikeContinueButtonText {
    return Intl.message(
      'Continue to checkout',
      name: 'youMightLikeContinueButtonText',
      desc: '',
      args: [],
    );
  }

  /// `Hi there!`
  String get hiThere {
    return Intl.message(
      'Hi there!',
      name: 'hiThere',
      desc: '',
      args: [],
    );
  }

  /// `Rename List`
  String get renameList {
    return Intl.message(
      'Rename List',
      name: 'renameList',
      desc: '',
      args: [],
    );
  }

  /// `Delete List`
  String get deleteList {
    return Intl.message(
      'Delete List',
      name: 'deleteList',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Add all`
  String get addAll {
    return Intl.message(
      'Add all',
      name: 'addAll',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `All products for {recipe} added to your cart`
  String toastMsgForAllItemsProduct(Object recipe) {
    return Intl.message(
      'All products for $recipe added to your cart',
      name: 'toastMsgForAllItemsProduct',
      desc: '',
      args: [recipe],
    );
  }

  /// `{product} added to your cart`
  String toastMsgForSingleProduct(Object product) {
    return Intl.message(
      '$product added to your cart',
      name: 'toastMsgForSingleProduct',
      desc: '',
      args: [product],
    );
  }

  /// `1 item in order`
  String get singleItemInOrder {
    return Intl.message(
      '1 item in order',
      name: 'singleItemInOrder',
      desc: '',
      args: [],
    );
  }

  /// `{numOfItems} items in order`
  String fewItemsInOrder(Object numOfItems) {
    return Intl.message(
      '$numOfItems items in order',
      name: 'fewItemsInOrder',
      desc: '',
      args: [numOfItems],
    );
  }

  /// `Checkout`
  String get checkout {
    return Intl.message(
      'Checkout',
      name: 'checkout',
      desc: '',
      args: [],
    );
  }

  /// `Your basket is empty`
  String get cartIsEmpty {
    return Intl.message(
      'Your basket is empty',
      name: 'cartIsEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Delivery calculated at checkout`
  String get deliveryCalculatedAtCheckout {
    return Intl.message(
      'Delivery calculated at checkout',
      name: 'deliveryCalculatedAtCheckout',
      desc: '',
      args: [],
    );
  }

  /// `Sub-total`
  String get subTotal {
    return Intl.message(
      'Sub-total',
      name: 'subTotal',
      desc: '',
      args: [],
    );
  }

  /// `Reset password`
  String get resetPasswordTitle {
    return Intl.message(
      'Reset password',
      name: 'resetPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter your phone number and we will send you a code back`
  String get resetPasswordSubtitle {
    return Intl.message(
      'Enter your phone number and we will send you a code back',
      name: 'resetPasswordSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your number`
  String get resetPasswordNullWarning {
    return Intl.message(
      'Please enter your number',
      name: 'resetPasswordNullWarning',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid number in +380XXXXXXXXX format`
  String get resetPasswordInvalidWarning {
    return Intl.message(
      'Please enter a valid number in +380XXXXXXXXX format',
      name: 'resetPasswordInvalidWarning',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get sendBtnText {
    return Intl.message(
      'Send',
      name: 'sendBtnText',
      desc: '',
      args: [],
    );
  }

  /// `Verification Code`
  String get verificationCodeTitle {
    return Intl.message(
      'Verification Code',
      name: 'verificationCodeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter the code that we've just sent you`
  String get verificationCodeSubtitle {
    return Intl.message(
      'Enter the code that we\'ve just sent you',
      name: 'verificationCodeSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the code`
  String get verificationCodeNullWarning {
    return Intl.message(
      'Please enter the code',
      name: 'verificationCodeNullWarning',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a 6-digit code`
  String get verificationCodeInvalidWarning {
    return Intl.message(
      'Please enter a 6-digit code',
      name: 'verificationCodeInvalidWarning',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirmBtnText {
    return Intl.message(
      'Confirm',
      name: 'confirmBtnText',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPasswordTitle {
    return Intl.message(
      'New Password',
      name: 'newPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter your new password`
  String get newPasswordSubtitle {
    return Intl.message(
      'Enter your new password',
      name: 'newPasswordSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a new password`
  String get newPasswordNullWarning {
    return Intl.message(
      'Please enter a new password',
      name: 'newPasswordNullWarning',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get backBtnText {
    return Intl.message(
      'Back',
      name: 'backBtnText',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skipBtnText {
    return Intl.message(
      'Skip',
      name: 'skipBtnText',
      desc: '',
      args: [],
    );
  }

  /// `Select this slot`
  String get selectSlotBtnText {
    return Intl.message(
      'Select this slot',
      name: 'selectSlotBtnText',
      desc: '',
      args: [],
    );
  }

  /// `Email address`
  String get email {
    return Intl.message(
      'Email address',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Product from `
  String get productsFrom {
    return Intl.message(
      'Product from ',
      name: 'productsFrom',
      desc: '',
      args: [],
    );
  }

  /// `Add shopping list`
  String get addShoppingList {
    return Intl.message(
      'Add shopping list',
      name: 'addShoppingList',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get title {
    return Intl.message(
      'Title',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Create`
  String get create {
    return Intl.message(
      'Create',
      name: 'create',
      desc: '',
      args: [],
    );
  }

  /// `Explore our range`
  String get productsScreenTitle {
    return Intl.message(
      'Explore our range',
      name: 'productsScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your Order`
  String get yourOrder {
    return Intl.message(
      'Your Order',
      name: 'yourOrder',
      desc: '',
      args: [],
    );
  }

  /// `Accepted`
  String get accepted {
    return Intl.message(
      'Accepted',
      name: 'accepted',
      desc: '',
      args: [],
    );
  }

  /// `Prepared`
  String get prepared {
    return Intl.message(
      'Prepared',
      name: 'prepared',
      desc: '',
      args: [],
    );
  }

  /// `Ready`
  String get ready {
    return Intl.message(
      'Ready',
      name: 'ready',
      desc: '',
      args: [],
    );
  }

  /// `Delivered`
  String get delivered {
    return Intl.message(
      'Delivered',
      name: 'delivered',
      desc: '',
      args: [],
    );
  }

  /// `Loading`
  String get errorStateLoading {
    return Intl.message(
      'Loading',
      name: 'errorStateLoading',
      desc: '',
      args: [],
    );
  }

  /// `Ops, an error occurred.`
  String get errorState {
    return Intl.message(
      'Ops, an error occurred.',
      name: 'errorState',
      desc: '',
      args: [],
    );
  }

  /// `You don’t have any favourites yet:( `
  String get noFavorites {
    return Intl.message(
      'You don’t have any favourites yet:( ',
      name: 'noFavorites',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Your approximate delivery time:`
  String get approximateDeliveryTime {
    return Intl.message(
      'Your approximate delivery time:',
      name: 'approximateDeliveryTime',
      desc: '',
      args: [],
    );
  }

  /// `Best time for food`
  String get bestTime {
    return Intl.message(
      'Best time for food',
      name: 'bestTime',
      desc: '',
      args: [],
    );
  }

  /// `Delivery details`
  String get deliveryDetails {
    return Intl.message(
      'Delivery details',
      name: 'deliveryDetails',
      desc: '',
      args: [],
    );
  }

  /// `Reset your password`
  String get resetYourPassword {
    return Intl.message(
      'Reset your password',
      name: 'resetYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Order Confirmation`
  String get orderConfirmation {
    return Intl.message(
      'Order Confirmation',
      name: 'orderConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Thanks for your order`
  String get thanksForYourOrder {
    return Intl.message(
      'Thanks for your order',
      name: 'thanksForYourOrder',
      desc: '',
      args: [],
    );
  }

  /// `'Your order will be prepared and delivered soon. The courier will call you in 5 minutes.'`
  String get courierCall {
    return Intl.message(
      '\'Your order will be prepared and delivered soon. The courier will call you in 5 minutes.\'',
      name: 'courierCall',
      desc: '',
      args: [],
    );
  }

  /// `Order details:`
  String get orderDetails {
    return Intl.message(
      'Order details:',
      name: 'orderDetails',
      desc: '',
      args: [],
    );
  }

  /// `Date:`
  String get date {
    return Intl.message(
      'Date:',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Paid:`
  String get paid {
    return Intl.message(
      'Paid:',
      name: 'paid',
      desc: '',
      args: [],
    );
  }

  /// `Delivery time:`
  String get deliveryTime {
    return Intl.message(
      'Delivery time:',
      name: 'deliveryTime',
      desc: '',
      args: [],
    );
  }

  /// `The email confirmation will be sent to`
  String get emailConfirmation {
    return Intl.message(
      'The email confirmation will be sent to',
      name: 'emailConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Need help with anything?`
  String get needHelp {
    return Intl.message(
      'Need help with anything?',
      name: 'needHelp',
      desc: '',
      args: [],
    );
  }

  /// `Track order`
  String get trackOrder {
    return Intl.message(
      'Track order',
      name: 'trackOrder',
      desc: '',
      args: [],
    );
  }

  /// `Order Tracking`
  String get orderTracking {
    return Intl.message(
      'Order Tracking',
      name: 'orderTracking',
      desc: '',
      args: [],
    );
  }

  /// `Order number:`
  String get orderNumber {
    return Intl.message(
      'Order number:',
      name: 'orderNumber',
      desc: '',
      args: [],
    );
  }

  /// `Order accepted`
  String get orderAccepted {
    return Intl.message(
      'Order accepted',
      name: 'orderAccepted',
      desc: '',
      args: [],
    );
  }

  /// `Preparing order`
  String get preparingOrder {
    return Intl.message(
      'Preparing order',
      name: 'preparingOrder',
      desc: '',
      args: [],
    );
  }

  /// `Ready to go`
  String get readyToGo {
    return Intl.message(
      'Ready to go',
      name: 'readyToGo',
      desc: '',
      args: [],
    );
  }

  /// `Order delivered`
  String get orderDelivered {
    return Intl.message(
      'Order delivered',
      name: 'orderDelivered',
      desc: '',
      args: [],
    );
  }

  /// `Delivery information`
  String get deliveryInfo {
    return Intl.message(
      'Delivery information',
      name: 'deliveryInfo',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}