import 'package:flutter/material.dart';

/// Centralized iconography mappings for StudyVault.
///
/// Ensures icon consistency across features, navigation, and reusable badges.
abstract final class AppIcons {
  // --- Navigation & Core Shell ---
  static const IconData home = Icons.home_rounded;
  static const IconData homeOutline = Icons.home_outlined;
  static const IconData search = Icons.search_rounded;
  static const IconData searchFilled = Icons.manage_search_rounded;
  static const IconData network = Icons.hub_rounded;
  static const IconData networkOutline = Icons.hub_outlined;
  static const IconData library = Icons.local_library_rounded;
  static const IconData libraryOutline = Icons.local_library_outlined;
  static const IconData settings = Icons.settings_rounded;
  static const IconData settingsOutline = Icons.settings_outlined;

  // --- Academic & Resource Categorization ---
  static const IconData document = Icons.description_rounded;
  static const IconData paper = Icons.article_rounded;
  static const IconData book = Icons.menu_book_rounded;
  static const IconData dataset = Icons.dataset_rounded;
  static const IconData database = Icons.storage_rounded;
  static const IconData code = Icons.terminal_rounded;
  static const IconData pdf = Icons.picture_as_pdf_rounded;

  // --- Badges & Verification ---
  static const IconData verified = Icons.verified_rounded;
  static const IconData peerReviewed = Icons.workspace_premium_rounded;
  static const IconData community = Icons.groups_rounded;
  static const IconData unverified = Icons.help_outline_rounded;
  static const IconData shield = Icons.shield_rounded;
  static const IconData security = Icons.security_rounded;
  static const IconData sparkles = Icons.auto_awesome_rounded;

  // --- Network & P2P Topology ---
  static const IconData peers = Icons.devices_other_rounded;
  static const IconData ipfs = Icons.share_location_rounded;
  static const IconData bandwidth = Icons.speed_rounded;
  static const IconData latency = Icons.timer_outlined;
  static const IconData nodeOnline = Icons.radio_button_checked_rounded;
  static const IconData nodeOffline = Icons.radio_button_off_rounded;
  static const IconData relay = Icons.alt_route_rounded;

  // --- Actions & Controls ---
  static const IconData download = Icons.download_rounded;
  static const IconData upload = Icons.upload_rounded;
  static const IconData share = Icons.share_rounded;
  static const IconData filter = Icons.tune_rounded;
  static const IconData clear = Icons.close_rounded;
  static const IconData delete = Icons.delete_outline_rounded;
  static const IconData refresh = Icons.refresh_rounded;
  static const IconData arrowForward = Icons.arrow_forward_rounded;
  static const IconData chevronRight = Icons.chevron_right_rounded;
  static const IconData copy = Icons.content_copy_rounded;
  static const IconData check = Icons.check_rounded;
  static const IconData bookmark = Icons.bookmark_rounded;
  static const IconData bookmarkBorder = Icons.bookmark_border_rounded;
  static const IconData favorite = Icons.favorite_rounded;
  static const IconData favoriteBorder = Icons.favorite_border_rounded;
  static const IconData profile = Icons.person_rounded;
  static const IconData help = Icons.help_outline_rounded;

  // --- Feedback & Alerts ---
  static const IconData success = Icons.check_circle_rounded;
  static const IconData warning = Icons.warning_amber_rounded;
  static const IconData error = Icons.error_outline_rounded;
  static const IconData info = Icons.info_outline_rounded;
  static const IconData empty = Icons.inbox_rounded;
}
