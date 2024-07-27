class ReviewService {
//   Apprentice 1 → 4 hours → Apprentice 2
// Apprentice 2 → 8 hours → Apprentice 3
// Apprentice 3 → 1 day → Apprentice 4
// Apprentice 4 → 2 days → Guru 1
// Guru 1 → 1 week → Guru 2
// Guru 2 → 2 weeks → Master
// Master → 1 month → Enlightened
// Enlightened → 4 months → Burned
  Duration getDurationAccordingToLevel(int level) {
    if (level == 0) {
      return const Duration(hours: 4);
    }
    if (level == 1) {
      return const Duration(hours: 8);
    }
    if (level == 2) {
      return const Duration(days: 1);
    }
    if (level == 3) {
      return const Duration(days: 2);
    }
    if (level == 4) {
      return const Duration(days: 7);
    }
    if (level == 5) {
      return const Duration(days: 14);
    }
    if (level == 6) {
      return const Duration(days: 31);
    }
    if (level == 7) {
      return const Duration(days: 4 * 31);
    }
    return const Duration(days: 365);
  }
}
