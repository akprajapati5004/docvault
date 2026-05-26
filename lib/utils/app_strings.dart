/// Central string constants for the entire DocVault application.
class AppStrings {
  AppStrings._();

  // ── App ────────────────────────────────────────────────────────────────────
  static const String appName    = 'DocVault';
  static const String appTagline = 'Your documents, secured.';
  static const String appVersion = 'v1.0.0';

  // ── Splash ─────────────────────────────────────────────────────────────────
  static const String splashTagline = appTagline;
  static const String splashSecured = 'SECURED BY AES-256';

  // ── Onboarding ─────────────────────────────────────────────────────────────
  static const String onboardingSkip       = 'Skip';
  static const String onboardingNext       = 'Next';
  static const String onboardingGetStarted = 'Get Started';

  static const String onboarding1Title    = 'Bank-Grade Security';
  static const String onboarding1Subtitle =
      'Your sensitive documents are encrypted with military-grade AES-256 technology.';

  static const String onboarding2Title    = 'Smart OCR Scanning';
  static const String onboarding2Subtitle =
      'Automatically extract text and metadata from any physical document in seconds.';

  static const String onboarding3Title    = 'Access Anywhere';
  static const String onboarding3Subtitle =
      'Sync your encrypted library across all your devices seamlessly and securely.';

  // ── Auth — Shared header ───────────────────────────────────────────────────
  static const String authAppSubtitleLogin    = 'Access your secure digital vault';
  static const String authAppSubtitleRegister = 'Create your secure digital vault';

  // ── Auth — Login ───────────────────────────────────────────────────────────
  static const String loginEmailLabel        = 'Email Address';
  static const String loginEmailHint         = 'name@company.com';
  static const String loginPasswordLabel     = 'Password';
  static const String loginPasswordHint      = '••••••••';
  static const String loginForgotPassword    = 'Forgot Password?';
  static const String loginButton            = 'Sign In';
  static const String loginDivider           = 'OR SECURE UNLOCK';
  static const String loginBiometricLabel    = 'Sign in with Biometrics';
  static const String loginBiometricCaption  = 'FAST & SECURE ACCESS';
  static const String loginNoAccount         = 'New to DocVault?';
  static const String loginCreateAccount     = 'Create an Account';
  static const String loginAes               = 'AES-256 Encryption';
  static const String loginPrivacy           = 'Privacy Policy';

  // ── Auth — Register ────────────────────────────────────────────────────────
  static const String registerNameLabel          = 'Full Name';
  static const String registerNameHint           = 'John Doe';
  static const String registerEmailLabel         = 'Email Address';
  static const String registerEmailHint          = 'john@example.com';
  static const String registerPasswordLabel      = 'Password';
  static const String registerPasswordHint       = '••••••••';
  static const String registerConfirmLabel       = 'Confirm';
  static const String registerConfirmHint        = '••••••••';
  static const String registerSecurityNote       =
      'Your data is secured with AES-256 military-grade encryption. '
      'Documents are encrypted before they even leave your device.';
  static const String registerButton            = 'Create Account';
  static const String registerHaveAccount       = 'Already have an account?';
  static const String registerSignIn            = 'Sign In';
  static const String registerGdpr              = 'GDPR & ISO 27001 Compliant Architecture';
  static const String registerTermsPrefix       = 'By signing up, you agree to our ';
  static const String registerTermsLink         = 'Terms of Service';
  static const String registerCopyright         = '© 2024 DocVault Inc. All rights reserved.';

  // ── Dashboard ──────────────────────────────────────────────────────────────
  static const String dashboardTitle             = 'My Documents';
  static const String dashboardGreetingMorning   = 'Good morning';
  static const String dashboardGreetingAfternoon = 'Good afternoon';
  static const String dashboardGreetingEvening   = 'Good evening';
  static const String dashboardRecentDocs        = 'Recent Documents';
  static const String dashboardAllDocs           = 'All Documents';
  static const String dashboardNoDocs            = 'No documents yet';
  static const String dashboardNoDocsHint        = 'Upload or scan a document to get started';

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
  static const String uploadSuccess  = 'Document uploaded successfully';
  static const String uploadFailed   = 'Upload failed. Please try again.';

  // ── Scanner ────────────────────────────────────────────────────────────────
  static const String scannerTitle    = 'Scan Document';
  static const String scannerHint     = 'Point camera at document';
  static const String scannerCapture  = 'Capture';
  static const String scannerRetake   = 'Retake';
  static const String scannerUsePhoto = 'Use Photo';

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
  static const String settingsTitle         = 'Settings';
  static const String settingsAccount       = 'Account';
  static const String settingsTheme         = 'Appearance';
  static const String settingsSecurity      = 'Security';
  static const String settingsEncryption    = 'Encryption';
  static const String settingsNotifications = 'Notifications';
  static const String settingsAbout         = 'About';
  static const String settingsLogout        = 'Log Out';
  static const String settingsLogoutConfirm = 'Are you sure you want to log out?';

  // ── Validation ─────────────────────────────────────────────────────────────
  static const String validationEmailEmpty    = 'Email address is required';
  static const String validationEmailInvalid  = 'Enter a valid email address';
  static const String validationPasswordEmpty = 'Password is required';
  static const String validationPasswordShort = 'Password must be at least 8 characters';
  static const String validationNameEmpty     = 'Full name is required';
  static const String validationConfirmEmpty  = 'Please confirm your password';
  static const String validationConfirmMatch  = 'Passwords do not match';

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