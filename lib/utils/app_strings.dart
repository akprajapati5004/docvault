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
  static const String onboarding1Title     = 'Bank-Grade Security';
  static const String onboarding1Subtitle  = 'Your sensitive documents are encrypted with military-grade AES-256 technology.';
  static const String onboarding2Title     = 'Smart OCR Scanning';
  static const String onboarding2Subtitle  = 'Automatically extract text and metadata from any physical document in seconds.';
  static const String onboarding3Title     = 'Access Anywhere';
  static const String onboarding3Subtitle  = 'Sync your encrypted library across all your devices seamlessly and securely.';

  // ── Auth ───────────────────────────────────────────────────────────────────
  static const String authAppSubtitleLogin    = 'Access your secure digital vault';
  static const String authAppSubtitleRegister = 'Create your secure digital vault';
  static const String loginEmailLabel         = 'Email Address';
  static const String loginEmailHint          = 'name@company.com';
  static const String loginPasswordLabel      = 'Password';
  static const String loginPasswordHint       = '••••••••';
  static const String loginForgotPassword     = 'Forgot Password?';
  static const String loginButton             = 'Sign In';
  static const String loginDivider            = 'OR SECURE UNLOCK';
  static const String loginBiometricLabel     = 'Sign in with Biometrics';
  static const String loginBiometricCaption   = 'FAST & SECURE ACCESS';
  static const String loginNoAccount          = 'New to DocVault?';
  static const String loginCreateAccount      = 'Create an Account';
  static const String loginAes                = 'AES-256 Encryption';
  static const String loginPrivacy            = 'Privacy Policy';
  static const String registerNameLabel       = 'Full Name';
  static const String registerNameHint        = 'John Doe';
  static const String registerEmailLabel      = 'Email Address';
  static const String registerEmailHint       = 'john@example.com';
  static const String registerPasswordLabel   = 'Password';
  static const String registerPasswordHint    = '••••••••';
  static const String registerConfirmLabel    = 'Confirm';
  static const String registerConfirmHint     = '••••••••';
  static const String registerSecurityNote    = 'Your data is secured with AES-256 military-grade encryption. Documents are encrypted before they even leave your device.';
  static const String registerButton         = 'Create Account';
  static const String registerHaveAccount    = 'Already have an account?';
  static const String registerSignIn         = 'Sign In';
  static const String registerGdpr           = 'GDPR & ISO 27001 Compliant Architecture';
  static const String registerTermsPrefix    = 'By signing up, you agree to our ';
  static const String registerTermsLink      = 'Terms of Service';
  static const String registerCopyright      = '© 2024 DocVault Inc. All rights reserved.';

  // ── Validation ─────────────────────────────────────────────────────────────
  static const String validationEmailEmpty    = 'Email address is required';
  static const String validationEmailInvalid  = 'Enter a valid email address';
  static const String validationPasswordEmpty = 'Password is required';
  static const String validationPasswordShort = 'Password must be at least 8 characters';
  static const String validationNameEmpty     = 'Full name is required';
  static const String validationConfirmEmpty  = 'Please confirm your password';
  static const String validationConfirmMatch  = 'Passwords do not match';

  // ── Bottom Nav ─────────────────────────────────────────────────────────────
  static const String navHome       = 'Home';
  static const String navCategories = 'Categories';
  static const String navSearch     = 'Search';
  static const String navSettings   = 'Settings';

  // ── Home screen ────────────────────────────────────────────────────────────
  static const String homeGoodMorning   = 'Good morning,';
  static const String homeGoodAfternoon = 'Good afternoon,';
  static const String homeGoodEvening   = 'Good evening,';
  static const String homeRecentDocs    = 'Recent Documents';
  static const String homeViewAll       = 'View All';
  static const String homeAllDocs       = 'All Documents';
  static const String homeEncrypted     = 'ENCRYPTED';
  static const String homeFilterAll     = 'All Docs';
  static const String homeFilterPersonal= 'Personal';
  static const String homeFilterFinance = 'Finance';
  static const String homeFilterMedical = 'Medical';
  static const String homeSearchHint    = 'Search documents, tags, or contents...';

  // ── Document tags ──────────────────────────────────────────────────────────
  static const String tagIdentity = 'IDENTITY';
  static const String tagHealth   = 'HEALTH';
  static const String tagLegal    = 'LEGAL';
  static const String tagAction   = 'ACTION';

  // ── Categories screen ──────────────────────────────────────────────────────
  static const String categoriesTitle      = 'Categories';
  static const String categoriesSubtitle   = 'Organize your digital vault';
  static const String categoriesCreateNew  = 'Create New';
  static const String categoriesFilterHint = 'Filter categories...';
  static const String categoriesPersonal   = 'Personal';
  static const String categoriesWork       = 'Work';
  static const String categoriesFinancial  = 'Financial';
  static const String categoriesLegal      = 'Legal';
  static const String categoriesMedical    = 'Medical';
  static const String categoriesTrash      = 'Trash';
  static const String categoriesTrashNote  = 'Items here will be permanently deleted after 30 days.';
  static const String categoriesRecentUpdates = '2 RECENT UPDATES';
  static const String vaultAnalytics       = 'VAULT ANALYTICS';
  static const String analyticsTotalStorage = 'Total Storage';
  static const String analyticsEncryptedFiles = 'Encrypted Files';
  static const String analyticsSharedFolders = 'Shared Folders';

  // ── Search screen ──────────────────────────────────────────────────────────
  static const String searchHint         = 'Search documents, tags, or contents...';
  static const String searchFilterPdfs   = 'PDFs';
  static const String searchFilterImages = 'Images';
  static const String searchFilterLast30 = 'Last 30 Days';
  static const String searchResults      = 'Search Results';
  static const String searchItemsFound   = 'ITEMS FOUND';
  static const String searchEmpty        = 'No results found';
  static const String searchEmptyHint    = 'Try a different keyword';

  // ── Settings screen ────────────────────────────────────────────────────────
  static const String settingsProLabel      = 'PRO';
  static const String settingsProTitle      = 'Document Holder PRO';
  static const String settingsProSubtitle   = 'Active since January 2024 • Enterprise Security Enabled';
  static const String settingsProfile       = 'Profile';
  static const String settingsProfileSub    = 'Personal information and identity';
  static const String settingsSecurity      = 'Security & Privacy';
  static const String settingsSecuritySub   = 'Encryption, Biometrics, Vault';
  static const String settingsCloudSync     = 'Cloud Sync';
  static const String settingsCloudSyncSub  = 'Backup your vault to secure cloud';
  static const String settingsCloudSyncOn   = 'On';
  static const String settingsNotifications = 'Notifications';
  static const String settingsNotifSub      = 'Alerts, Expiry, Activity';
  static const String settingsHelp          = 'Help & Support';
  static const String settingsHelpSub       = 'FAQs, Contact support';
  static const String settingsAbout         = 'About';
  static const String settingsAboutSub      = 'Version 2.4.1 (Build 890)';
  static const String settingsSignOut       = 'Sign Out';

  // ── OCR / Upload / Scanner ─────────────────────────────────────────────────
  static const String ocrTitle       = 'Extract Text';
  static const String ocrProcessing  = 'Extracting text…';
  static const String ocrSuccess     = 'Text extracted successfully';
  static const String ocrFailed      = 'Could not extract text';
  static const String ocrCopy        = 'Copy Text';
  static const String uploadTitle    = 'Upload Document';
  static const String uploadSubtitle = 'Choose a file from your device';
  static const String uploadButton   = 'Browse Files';
  static const String uploadSuccess  = 'Document uploaded successfully';
  static const String uploadFailed   = 'Upload failed. Please try again.';
  static const String scannerTitle   = 'Scan Document';
  static const String scannerCapture = 'Capture';

  // ── Common ─────────────────────────────────────────────────────────────────
  static const String commonOk      = 'OK';
  static const String commonCancel  = 'Cancel';
  static const String commonDelete  = 'Delete';
  static const String commonEdit    = 'Edit';
  static const String commonSave    = 'Save';
  static const String commonRetry   = 'Retry';
  static const String commonLoading = 'Loading…';
  static const String commonError   = 'Something went wrong';
  static const String itemsSuffix   = ' items';
}