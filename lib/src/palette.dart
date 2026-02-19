import 'package:flutter/material.dart';

abstract final class AppPalette {
  // Light Mode
  static const background = Color(0xFFFAFAFA);
  static const foreground = Color(0xFF0A0A0B);
  static const card = Color(0xFFFFFFFF);
  static const primary = Color(0xFF8B5CF6);
  static const primaryGlow = Color(0xFF8B5CF6);
  static const destructive = Color(0xFFEF4444);
  static const success = Color(0xFF16A34A);
  static const warning = Color(0xFFF59E0B);
  static const info = Color(0xFF0EA5E9);

  // Dark Mode
  static const darkBackground = Color(0xFF020617);
  static const darkForeground = Color(0xFFF8FAFC);
  static const darkCard = Color(0xFF1E293B);
  static const darkPrimary = Color(0xFF8B5CF6);
  static const darkPrimaryGlow = Color(0xFF8B5CF6);
  static const darkDestructive = Color(0xFF7F1D1D);
  static const darkSuccess = Color(0xFF15803D);
  static const darkWarning = Color(0xFFB45309);
  static const darkInfo = Color(0xFF0284C7);
}
