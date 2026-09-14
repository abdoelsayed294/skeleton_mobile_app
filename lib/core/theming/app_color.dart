import 'package:flutter/material.dart';

class AppColorsLight {
  AppColorsLight._();

  // Brand / Primary
  static const Color primary = Color(0xFF1E88E5);
  static const Color primaryGradientStart = Color(0xFF1E88E5);
  static const Color primaryGradientEnd = Color(0xFF7DD3FC);

  // Backgrounds & surfaces
  static const Color background = Color(0xFFF0F7FC);
  static const Color scaffoldGradientStart = Color(0xFFEAF3FA);
  static const Color scaffoldGradientEnd = Color(0xFFFFFFFF);
  static const Color surface = Color(0xFFFFFFFF);

  // Text
  static const Color textPrimary = Color(0xFF0F2942);
  static const Color textSecondary = Color(0xFF627D98);
  static const Color textMuted = Color(0xFF94A3B8);

  // Borders / dividers
  static const Color border = Color(0xFFE2EDF6);
  static const Color borderLight = Color(0xFFF1F5F9);
  static const Color borderSubtle = Color(0xFFF8FAFC);

  // Info / blue tints
  static const Color infoBg = Color(0xFFEFF6FF);
  static const Color infoBgAlt = Color(0xFFF0F9FF);
  static const Color avatarBg = Color(0xFFE0F2FE);

  // Feedback - success (green)
  static const Color success = Color(0xFF059669);
  static const Color successDark = Color(0xFF047857);
  static const Color successBg = Color(0xFFECFDF5);
  static const Color successBorder = Color(0xFFA7F3D0);

  // Feedback - error / danger (rose/red)
  static const Color error = Color(0xFFE11D48);
  static const Color errorAlt = Color(0xFFF43F5E);
  static const Color errorBg = Color(0xFFFFF1F2);
  static const Color errorBgAlt = Color(0xFFFFE4E6);
  static const Color errorBorder = Color(0xFFFECDD3);

  // Feedback - warning (amber)
  static const Color warning = Color(0xFFD97706);
  static const Color warningAlt = Color(0xFFF59E0B);
  static const Color warningBg = Color(0xFFFEF3C7);

  // Category / accent tags (payment methods, report types, nav bar, etc.)
  static const Color accentOrange = Color(0xFFF97316);
  static const Color accentGreen = Color(0xFF059669);
  static const Color accentPurple = Color(0xFF7C3AED);
  static const Color accentPink = Color(0xFFEC4899);

  // Fixed-dark hero card background (stays the same across both themes)
  static const Color heroCardBackground = Color(0xFF101B2D);
}

class AppColorsDark {
  AppColorsDark._();

  // Brand / Primary (accent cyan)
  static const Color primary = Color(0xFF00D2FF);
  static const Color primaryAlt = Color(0xFF22D3EE);
  static const Color primaryGradientStart = Color(0xFF06B6D4);
  static const Color primaryGradientEnd = Color(0xFF2563EB);

  // Backgrounds & surfaces
  static const Color background = Color(0xFF070D15);
  static const Color scaffoldBg = Color(0xFF0B131E);
  static const Color surface = Color(0xFF111C2B);

  // Text
  static const Color textPrimary = Color(0xFFF8FAFC);
  static const Color textSecondary = Color(0xFF94A3B8);
  static const Color textMuted = Color(0xFF64748B);

  // Borders / dividers
  static const Color border = Color(0xFF1E293B);

  // Feedback - success (green)
  static const Color success = Color(0xFF34D399);
  static const Color successBg = Color(0x99022C22); // rgba(2,44,34,0.6)
  static const Color successBorder = Color(0x4D10B981); // rgba(16,185,129,0.3)

  // Feedback - error / danger (rose)
  static const Color error = Color(0xFFFB7185);
  static const Color errorAlt = Color(0xFFF43F5E);
  static const Color errorBg = Color(0x994C0519); // rgba(76,5,25,0.6)
  static const Color errorBorder = Color(0x66F43F5E); // rgba(244,63,94,0.4)

  // Feedback - warning (amber)
  static const Color warning = Color(0xFFFBBF24);
  static const Color warningAlt = Color(0xFFF59E0B);
  static const Color warningBorder = Color(0x66781F0F); // approx rgba(120,53,15,0.4)

  // Category / accent tags (payment methods, report types, nav bar, etc.)
  static const Color accentOrange = Color(0xFFF97316);
  static const Color accentGreen = Color(0xFF059669);
  static const Color accentPurple = Color(0xFF7C3AED);
  static const Color accentPink = Color(0xFFEC4899);

  // Fixed-dark hero card background (stays the same across both themes)
  static const Color heroCardBackground = Color(0xFF101B2D);
}
