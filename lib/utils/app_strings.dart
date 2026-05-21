/// Central string constants for the entire DocVault application.
/// Every user-visible text must come from here — no hardcoded strings in UI files.
class AppStrings {
  AppStrings._();

  // ── App ────────────────────────────────────────────────────────────────────
  static const String appName    = 'DocVault';
  static const String appTagline = 'Your documents, secured.';
  static const String appVersion = 'v1.0.0';

  // ── Splash ─────────────────────────────────────────────────────────────────
  static const String splashTagline  = appTagline;
  static const String splashSecured  = 'SECURED BY AES-256';

  // ── Onboarding ─────────────────────────────────────────────────────────────
  static const String onboardingSkip = 'Skip';
  static const String onboardingNext = 'Next';
  static const String onboardingGetStarted = 'Get Started';

  // Page 1 — Security
  static const String onboarding1Title    = 'Bank-Grade Security';
  static const String onboarding1Subtitle =
      'Your sensitive documents are encrypted with military-grade AES-256 technology.';

  // Page 2 — OCR
  static const String onboarding2Title    = 'Smart OCR Scanning';
  static const String onboarding2Subtitle =
      'Automatically extract text and metadata from any physical document in seconds.';

  // Page 3 — Access
  static const String onboarding3Title    = 'Access Anywhere';
  static const String onboarding3Subtitle =
      'Sync your encrypted library across all your devices seamlessly and securely.';

  // ── Auth — Login ───────────────────────────────────────────────────────────
  static const String loginTitle          = 'Welcome back';
  static const String loginSubtitle       = 'Sign in to your account';
  static const String loginEmail          = 'Email address';
  static const String loginPassword       = 'Password';
  static const String loginForgotPassword = 'Forgot password?';
  static const String loginButton         = 'Sign In';
  static const String loginNoAccount      = "Don't have an account?";
  static const String loginSignUp         = 'Sign Up';

  // ── Auth — Register ────────────────────────────────────────────────────────
  static const String registerTitle           = 'Create account';
  static const String registerSubtitle        = 'Start securing your documents';
  static const String registerName            = 'Full name';
  static const String registerEmail           = 'Email address';
  static const String registerPassword        = 'Password';
  static const String registerConfirmPassword = 'Confirm password';
  static const String registerButton          = 'Create Account';
  static const String registerHaveAccount     = 'Already have an account?';
  static const String registerSignIn          = 'Sign In';

  // ── Dashboard ──────────────────────────────────────────────────────────────
  static const String dashboardTitle            = 'My Documents';
  static const String dashboardGreetingMorning  = 'Good morning';
  static const String dashboardGreetingAfternoon= 'Good afternoon';
  static const String dashboardGreetingEvening  = 'Good evening';
  static const String dashboardRecentDocs       = 'Recent Documents';
  static const String dashboardAllDocs          = 'All Documents';
  static const String dashboardNoDocs           = 'No documents yet';
  static const String dashboardNoDocsHint       = 'Upload or scan a document to get started';

  // ── Category ───────────────────────────────────────────────────────────────
  static const String categoryTitle  = 'Categories';
  static const String categoryEmpty  = 'No categories found';
  static const String categoryAdd    = 'Add Category';
  static const String categoryEdit   = 'Edit Category';
  static const String categoryDelete = 'Delete Category';

  // ── Document View ──────────────────────────────────────────────────────────
  static const String documentViewTitle       = 'Document';
  static const String documentViewShare       = 'Share';
  static const String documentViewDelete      = 'Delete';
  static const String documentViewDownload    = 'Download';
  static const String documentViewExtractText = 'Extract Text';

  // ── Upload ─────────────────────────────────────────────────────────────────
  static const String uploadTitle    = 'Upload Document';
  static const String uploadSubtitle = 'Choose a file from your device';
  static const String uploadButton   = 'Browse Files';
  static const String uploadDragHint = 'or drag and drop here';
  static const String uploadSuccess  = 'Document uploaded successfully';
  static const String uploadFailed   = 'Upload failed. Please try again.';

  // ── Scanner ────────────────────────────────────────────────────────────────
  static const String scannerTitle   = 'Scan Document';
  static const String scannerHint    = 'Point camera at document';
  static const String scannerCapture = 'Capture';
  static const String scannerRetake  = 'Retake';
  static const String scannerUsePhoto= 'Use Photo';

  // ── OCR ────────────────────────────────────────────────────────────────────
  static const String ocrTitle      = 'Extract Text';
  static const String ocrProcessing = 'Extracting text…';
  static const String ocrSuccess    = 'Text extracted successfully';
  static const String ocrFailed     = 'Could not extract text';
  static const String ocrEmpty      = 'No text found in document';
  static const String ocrCopy       = 'Copy Text';

  // ── Search ─────────────────────────────────────────────────────────────────
  static const String searchHint      = 'Search documents…';
  static const String searchEmpty     = 'No results found';
  static const String searchEmptyHint = 'Try a different keyword';

  // ── Trash ──────────────────────────────────────────────────────────────────
  static const String trashTitle             = 'Trash';
  static const String trashEmpty             = 'Trash is empty';
  static const String trashRestore           = 'Restore';
  static const String trashDeletePermanently = 'Delete Permanently';
  static const String trashEmptyAll          = 'Empty Trash';

  // ── Settings ───────────────────────────────────────────────────────────────
  static const String settingsTitle          = 'Settings';
  static const String settingsAccount        = 'Account';
  static const String settingsTheme          = 'Appearance';
  static const String settingsSecurity       = 'Security';
  static const String settingsEncryption     = 'Encryption';
  static const String settingsNotifications  = 'Notifications';
  static const String settingsAbout          = 'About';
  static const String settingsLogout         = 'Log Out';
  static const String settingsLogoutConfirm  = 'Are you sure you want to log out?';

  // ── Common ─────────────────────────────────────────────────────────────────
  static const String commonOk             = 'OK';
  static const String commonCancel         = 'Cancel';
  static const String commonConfirm        = 'Confirm';
  static const String commonDelete         = 'Delete';
  static const String commonEdit           = 'Edit';
  static const String commonSave           = 'Save';
  static const String commonRetry          = 'Retry';
  static const String commonClose          = 'Close';
  static const String commonBack           = 'Back';
  static const String commonNext           = 'Next';
  static const String commonDone           = 'Done';
  static const String commonLoading        = 'Loading…';
  static const String commonError          = 'Something went wrong';
  static const String commonNoInternet     = 'No internet connection';
  static const String commonSuccessGeneric = 'Done!';
}