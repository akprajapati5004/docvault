import 'package:flutter/material.dart';
import 'package:docvault/utils/app_colors.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Page 1 — Bank-Grade Security illustration
// Lock icon inside concentric rings with floating shield badges
// ─────────────────────────────────────────────────────────────────────────────
class SecurityIllustration extends StatefulWidget {
  const SecurityIllustration({super.key});

  @override
  State<SecurityIllustration> createState() => _SecurityIllustrationState();
}

class _SecurityIllustrationState extends State<SecurityIllustration>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _float;
  late final Animation<double> _ringPulse;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    _float = Tween<double>(begin: -8, end: 8).animate(
      CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut),
    );
    _ringPulse = Tween<double>(begin: 0.97, end: 1.03).animate(
      CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _ctrl,
      builder: (_, __) {
        return Transform.translate(
          offset: Offset(0, _float.value),
          child: SizedBox(
            width: 280,
            height: 280,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Outer faint ring
                Transform.scale(
                  scale: _ringPulse.value,
                  child: Container(
                    width: 260,
                    height: 260,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.accentLavender.withValues(alpha: 0.35),
                        width: 1.5,
                      ),
                    ),
                  ),
                ),

                // Mid ring
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.primaryLight.withValues(alpha: 0.18),
                      width: 1.5,
                    ),
                  ),
                ),

                // White card background
                Container(
                  width: 160,
                  height: 160,
                  decoration: BoxDecoration(
                    color: AppColors.surfaceWhite,
                    borderRadius: BorderRadius.circular(32),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.shadowColor,
                        blurRadius: 40,
                        offset: const Offset(0, 16),
                      ),
                      BoxShadow(
                        color: AppColors.shadowColor.withValues(alpha: 0.06),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: _LockIcon(size: 64),
                  ),
                ),

                // Floating pink shield — top right
                Positioned(
                  top: 30,
                  right: 18,
                  child: Transform.translate(
                    offset: Offset(-_float.value * 0.6, _float.value * 0.4),
                    child: _FloatingBadge(
                      color: AppColors.accentPink.withValues(alpha: 0.9),
                      size: 44,
                      child: const Icon(
                        Icons.shield_outlined,
                        color: Colors.white,
                        size: 22,
                      ),
                    ),
                  ),
                ),

                // Floating lavender shield — bottom left
                Positioned(
                  bottom: 42,
                  left: 22,
                  child: Transform.translate(
                    offset: Offset(_float.value * 0.5, -_float.value * 0.3),
                    child: _FloatingBadge(
                      color: AppColors.accentLavender.withValues(alpha: 0.85),
                      size: 36,
                      child: const Icon(
                        Icons.verified_user_outlined,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _LockIcon extends StatelessWidget {
  const _LockIcon({required this.size});
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.primaryLight, AppColors.primary],
        ),
        borderRadius: BorderRadius.circular(size * 0.28),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.35),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: const Icon(Icons.lock_rounded, color: Colors.white, size: 32),
    );
  }
}

class _FloatingBadge extends StatelessWidget {
  const _FloatingBadge({
    required this.color,
    required this.size,
    required this.child,
  });
  final Color color;
  final double size;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.4),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Center(child: child),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Page 2 — Smart OCR Scanning illustration
// Phone mockup with scanning animation + floating labels
// ─────────────────────────────────────────────────────────────────────────────
class OcrIllustration extends StatefulWidget {
  const OcrIllustration({super.key});

  @override
  State<OcrIllustration> createState() => _OcrIllustrationState();
}

class _OcrIllustrationState extends State<OcrIllustration>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _scanLine;
  late final Animation<double> _fadeChip;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
    _scanLine = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut),
    );
    _fadeChip = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.0), weight: 30),
      TweenSequenceItem(tween: ConstantTween(1.0), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.0), weight: 20),
    ]).animate(_ctrl);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _ctrl,
      builder: (_, __) {
        return SizedBox(
          width: 260,
          height: 300,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // White document behind phone
              Positioned(
                top: 0,
                right: 10,
                child: Transform.rotate(
                  angle: 0.08,
                  child: Container(
                    width: 160,
                    height: 210,
                    decoration: BoxDecoration(
                      color: AppColors.surfaceWhite,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.shadowColor,
                          blurRadius: 20,
                          offset: const Offset(4, 8),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Fake logo block
                          Container(
                            width: 48,
                            height: 12,
                            decoration: BoxDecoration(
                              color: AppColors.primary.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          const SizedBox(height: 12),
                          // Fake text lines
                          ...List.generate(5, (i) => Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Container(
                              width: i == 2 ? 80 : double.infinity,
                              height: 8,
                              decoration: BoxDecoration(
                                color: AppColors.textSecondary.withValues(alpha: 0.12),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // Phone mockup body
              Positioned(
                bottom: 0,
                left: 0,
                child: _PhoneMockup(
                  scanProgress: _scanLine.value,
                ),
              ),

              // "PROCESSING..." chip — top right of phone
              Positioned(
                top: 80,
                right: 0,
                child: Opacity(
                  opacity: _fadeChip.value,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withValues(alpha: 0.35),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Text(
                      'PROCESSING...',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
              ),

              // "Text Extracted ✓" chip — bottom left
              Positioned(
                bottom: 54,
                left: 0,
                child: Opacity(
                  opacity: (1 - _fadeChip.value).clamp(0.0, 1.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 7),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceWhite,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.shadowColor,
                          blurRadius: 10,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: AppColors.accentGreen,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 6),
                        const Text(
                          'Text Extracted',
                          style: TextStyle(
                            color: AppColors.accentGreen,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _PhoneMockup extends StatelessWidget {
  const _PhoneMockup({required this.scanProgress});
  final double scanProgress;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 230,
      decoration: BoxDecoration(
        color: AppColors.textPrimary,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.3),
            blurRadius: 30,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: Stack(
          children: [
            // Screen content
            Positioned.fill(
              child: Container(
                margin: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(7, (i) => Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Container(
                        width: i == 3 ? 60 : double.infinity,
                        height: 7,
                        decoration: BoxDecoration(
                          color: AppColors.textSecondary.withValues(alpha: 0.25),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    )),
                  ),
                ),
              ),
            ),

            // Animated green scan line
            Positioned(
              left: 6,
              right: 6,
              top: 6 + (scanProgress * (230 - 12 - 40)),
              child: Container(
                height: 2,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.accentGreen.withValues(alpha: 0),
                      AppColors.accentGreen,
                      AppColors.accentGreen.withValues(alpha: 0),
                    ],
                  ),
                ),
              ),
            ),

            // Scan glow
            Positioned(
              left: 6,
              right: 6,
              top: 6 + (scanProgress * (230 - 12 - 40)) - 10,
              child: Container(
                height: 24,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.accentGreen.withValues(alpha: 0),
                      AppColors.accentGreen.withValues(alpha: 0.08),
                      AppColors.accentGreen.withValues(alpha: 0),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Page 3 — Access Anywhere illustration
// Cloud sync icon with floating device cards
// ─────────────────────────────────────────────────────────────────────────────
class AccessIllustration extends StatefulWidget {
  const AccessIllustration({super.key});

  @override
  State<AccessIllustration> createState() => _AccessIllustrationState();
}

class _AccessIllustrationState extends State<AccessIllustration>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _float;
  late final Animation<double> _pulse;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    _float = Tween<double>(begin: -7, end: 7).animate(
      CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut),
    );
    _pulse = Tween<double>(begin: 0.95, end: 1.05).animate(
      CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _ctrl,
      builder: (_, __) {
        return SizedBox(
          width: 280,
          height: 280,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Central cloud/sync badge
              Transform.scale(
                scale: _pulse.value,
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [AppColors.primaryLight, AppColors.primary],
                    ),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.4),
                        blurRadius: 24,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.cloud_done_rounded,
                    color: Colors.white,
                    size: 36,
                  ),
                ),
              ),

              // Dashed connection lines (painted)
              CustomPaint(
                size: const Size(280, 280),
                painter: _ConnectionLinesPainter(),
              ),

              // Floating device card — top
              Positioned(
                top: 10,
                child: Transform.translate(
                  offset: Offset(0, _float.value * 0.8),
                  child: _DeviceCard(
                    icon: Icons.smartphone_rounded,
                    label: 'Mobile',
                  ),
                ),
              ),

              // Floating device card — bottom left
              Positioned(
                bottom: 20,
                left: 10,
                child: Transform.translate(
                  offset: Offset(-_float.value * 0.5, _float.value * 0.6),
                  child: _DeviceCard(
                    icon: Icons.laptop_rounded,
                    label: 'Desktop',
                  ),
                ),
              ),

              // Floating device card — bottom right
              Positioned(
                bottom: 20,
                right: 10,
                child: Transform.translate(
                  offset: Offset(_float.value * 0.5, _float.value * 0.6),
                  child: _DeviceCard(
                    icon: Icons.tablet_rounded,
                    label: 'Tablet',
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _DeviceCard extends StatelessWidget {
  const _DeviceCard({required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.surfaceWhite,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: AppColors.primary, size: 18),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: AppColors.accentGreen,
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}

class _ConnectionLinesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.accentLavender.withValues(alpha: 0.5)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width / 2, size.height / 2);

    // To top card
    _drawDashedLine(canvas, paint, center, Offset(size.width / 2, 60));
    // To bottom-left
    _drawDashedLine(canvas, paint, center, Offset(70, size.height - 60));
    // To bottom-right
    _drawDashedLine(canvas, paint, center, Offset(size.width - 70, size.height - 60));
  }

  void _drawDashedLine(
      Canvas canvas, Paint paint, Offset start, Offset end) {
    const dashLength = 6.0;
    const gapLength = 4.0;
    final dx = end.dx - start.dx;
    final dy = end.dy - start.dy;
    final dist = (end - start).distance;
    final steps = dist / (dashLength + gapLength);
    for (int i = 0; i < steps; i++) {
      final t0 = i * (dashLength + gapLength) / dist;
      final t1 = (i * (dashLength + gapLength) + dashLength) / dist;
      canvas.drawLine(
        Offset(start.dx + dx * t0, start.dy + dy * t0),
        Offset(start.dx + dx * t1.clamp(0, 1), start.dy + dy * t1.clamp(0, 1)),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(_ConnectionLinesPainter old) => false;
}