// colors.dart
import 'package:flutter/material.dart';

/// Primary color - used for main interactive elements such as AppBar, FAB, and active icons.
/// Secondary color - used for secondary actions, accents, and highlighting less prominent elements.
/// Primary button color - used for primary actions like "Submit" or "Confirm".
/// Secondary button color - used for secondary actions like "Cancel" or "Back".
/// Warning Color - used to indicate warnings or cautionary messages within the app.
/// Warning Icon color - specifically for warning icons to ensure they stand out against light backgrounds.
/// Main background color - for screens, providing a clean and light backdrop for content.
/// SectionColor - used for section headers or distinct sections within a screen to differentiate content areas.
/// LimeColor - highlight color used for emphasizing important information or actions within the app.
/// Neutral grey color - used for borders, dividers, and less prominent text to maintain visual hierarchy.
/// LinkColor - used for hyperlinks and interactive text elements to signify clickable items.
/// OnBackgroundColor - primary text color ensuring high readability against light backgrounds.
/// ErrorColor - used to indicate errors or destructive actions, such as form validation errors.

/// =========================
/// 🎨 Light Theme Colors
/// =========================
const Color kLightPrimaryColor = Color(0xFF1DE9B6);
const Color kLightSecondaryColor = Color(0xFF3D5AFE);
const Color kLightPrimaryButtonColor = kLightPrimaryColor;
const Color kLightSecondaryButtonColor = Color(0xFFA5E1D5);
const Color kLightFABColor = Color.fromARGB(255, 217, 227, 225);
const Color kLightWarningColor = Color(0xFFF9E79F);
const Color kLightWarningIconColor = Colors.orange;
const Color kLightBackgroundColor = Color(0xFFFFFFFF);
const Color kLightCardBackgroundColor = Color(0xFFFFFFFF);
const Color kLightappbarBackgroundColor = kLightPrimaryColor;
const Color kLightSectionColor = Color(0xFFE3F2FD);
const Color kLightLimeColor = Color(0xFFE8F5E9);
const Color kLightGreyColor = Color(0xFF9E9E9E);
const Color kLightLinkColor = kLightPrimaryColor;
const Color kLightOnBackgroundColor = Color(0xFF616161);
const Color kLightErrorColor = Color(0xFFFF6F61);

const Color kVibrantTeal = Color(0xFF1DE9B6);
const Color kLightIndigo = Color(0xFF3D5AFE);
const Color kCoralButton = Color(0xFFFF6F61);
const Color kLightTealButton = Color(0xFFA5E1D5);
const Color kTealLink = kLightPrimaryColor;
const Color kLightYellowWarning = Color(0xFFF9E79F);
const Color kSoftLightGray = Color(0xFFBDBDBD);

/// =========================
/// 🌙 Dark Theme Colors
/// =========================
const Color kDarkPrimaryColor = Color(0xFF1DE9B6);
const Color kDarkSecondaryColor = Color(0xFF3D5AFE);
const Color kDarkPrimaryButtonColor = kDarkPrimaryColor;
const Color kDarkSecondaryButtonColor = Color(0xFFA5E1D5);
const Color kDarkFABColor = Color(0xFFA5E1D5);
const Color kDarkWarningColor = Color(0xFFF9E79F);
const Color kDarkWarningIconColor = Colors.orange;
const Color kDarkBackgroundColor = Color(0xFF2F4F4F);
const Color kDarkCardBackgroundColor = Color.fromARGB(255, 120, 186, 186);
const Color kDarkappbarBackgroundColor = Color.fromARGB(255, 61, 106, 106);
const Color kDarkSectionColor = Colors.purpleAccent;
const Color kDarkLimeColor = Color.fromARGB(255, 28, 42, 50);
const Color kDarkGreyColor = Colors.grey;
const Color kDarkLinkColor = kDarkPrimaryColor;
const Color kDarkOnBackgroundColor = Color(0xFFF1F1F1);
const Color kDarkErrorColor = Color(0xFFFF6F61);
const Color kDarkSlateGray = Color(0xFF2F4F4F);
const Color kDarkSoftLightGray = Color(0xFF424242);
