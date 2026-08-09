import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Animated status pill shown during pipeline retrieval stages.
enum PipelineStage {
  idle,
  localSearch,
  foundLocal,
  internetSearch,
  downloading,
  indexing,
  complete,
  error,
}

extension PipelineStageX on PipelineStage {
  static PipelineStage fromState(String state) {
    switch (state) {
      case 'local_search':    return PipelineStage.localSearch;
      case 'found_local':     return PipelineStage.foundLocal;
      case 'internet_search': return PipelineStage.internetSearch;
      case 'downloading':     return PipelineStage.downloading;
      case 'indexing':        return PipelineStage.indexing;
      case 'complete':        return PipelineStage.complete;
      case 'error':           return PipelineStage.error;
      default:                return PipelineStage.idle;
    }
  }

  bool get isActive => this != PipelineStage.idle &&
      this != PipelineStage.foundLocal &&
      this != PipelineStage.complete &&
      this != PipelineStage.error;

  bool get isDone => this == PipelineStage.complete || this == PipelineStage.foundLocal;

  Color get color {
    switch (this) {
      case PipelineStage.foundLocal:     return const Color(0xFF00C896);
      case PipelineStage.complete:       return const Color(0xFF00C896);
      case PipelineStage.error:          return const Color(0xFFFF5F6D);
      case PipelineStage.internetSearch: return const Color(0xFF7C5CFC);
      case PipelineStage.downloading:    return const Color(0xFF4FC3F7);
      case PipelineStage.indexing:       return const Color(0xFFFFB300);
      default:                           return const Color(0xFF9E9E9E);
    }
  }

  IconData get icon {
    switch (this) {
      case PipelineStage.foundLocal:     return Icons.library_books_rounded;
      case PipelineStage.complete:       return Icons.check_circle_rounded;
      case PipelineStage.error:          return Icons.error_outline_rounded;
      case PipelineStage.internetSearch: return Icons.travel_explore_rounded;
      case PipelineStage.downloading:    return Icons.cloud_download_rounded;
      case PipelineStage.indexing:       return Icons.auto_awesome_rounded;
      case PipelineStage.localSearch:    return Icons.search_rounded;
      default:                           return Icons.search_rounded;
    }
  }
}

class PipelineStatusWidget extends StatefulWidget {
  const PipelineStatusWidget({
    super.key,
    required this.stage,
    required this.message,
    this.providersSearched = const <String>[],
    this.docsIndexed = 0,
  });

  final PipelineStage stage;
  final String message;
  final List<String> providersSearched;
  final int docsIndexed;

  @override
  State<PipelineStatusWidget> createState() => _PipelineStatusWidgetState();
}

class _PipelineStatusWidgetState extends State<PipelineStatusWidget>
    with TickerProviderStateMixin {
  late AnimationController _pulseController;
  late AnimationController _fadeController;
  late Animation<double> _pulseAnim;
  late Animation<double> _fadeAnim;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    )..forward();
    _pulseAnim = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
    _fadeAnim = CurvedAnimation(parent: _fadeController, curve: Curves.easeOut);
  }

  @override
  void didUpdateWidget(PipelineStatusWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.stage != widget.stage) {
      _fadeController.forward(from: 0);
    }
    if (widget.stage.isActive) {
      if (!_pulseController.isAnimating) _pulseController.repeat(reverse: true);
    } else {
      _pulseController.stop();
    }
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.stage == PipelineStage.idle) return const SizedBox.shrink();

    final Color stageColor = widget.stage.color;
    final IconData stageIcon = widget.stage.icon;

    return FadeTransition(
      opacity: _fadeAnim,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFF0D1117),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: stageColor.withOpacity(0.3), width: 1),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: stageColor.withOpacity(0.08),
              blurRadius: 20,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                // Animated icon with pulse
                AnimatedBuilder(
                  animation: _pulseAnim,
                  builder: (_, __) => Transform.scale(
                    scale: widget.stage.isActive ? _pulseAnim.value : 1.0,
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: stageColor.withOpacity(0.15),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(stageIcon, color: stageColor, size: 18),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.message,
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.1,
                        ),
                      ),
                      if (widget.providersSearched.isNotEmpty) ...<Widget>[
                        const SizedBox(height: 2),
                        Text(
                          '${widget.providersSearched.length} sources searched',
                          style: GoogleFonts.inter(
                            color: Colors.white38,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                // Progress indicator for active states
                if (widget.stage.isActive)
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(stageColor),
                    ),
                  ),
                if (widget.stage.isDone)
                  Icon(Icons.check_circle_rounded, color: stageColor, size: 20),
              ],
            ),

            // Docs indexed badge
            if (widget.docsIndexed > 0) ...<Widget>[
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: stageColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '+${widget.docsIndexed} added to your Local Vault',
                  style: GoogleFonts.inter(
                    color: stageColor,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],

            // Provider chips for internet search stage
            if (widget.stage == PipelineStage.internetSearch &&
                widget.providersSearched.isNotEmpty) ...<Widget>[
              const SizedBox(height: 10),
              Wrap(
                spacing: 6,
                runSpacing: 4,
                children: widget.providersSearched
                    .map((String p) => _ProviderChip(label: _formatProvider(p)))
                    .toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }

  String _formatProvider(String p) {
    const Map<String, String> labels = <String, String>{
      'openalex': 'OpenAlex',
      'arxiv': 'arXiv',
      'semantic_scholar': 'Semantic Scholar',
      'crossref': 'Crossref',
      'core': 'CORE',
      'doaj': 'DOAJ',
      'pubmed': 'PubMed',
      'open_library': 'Open Library',
      'internet_archive': 'Internet Archive',
    };
    return labels[p] ?? p;
  }
}

class _ProviderChip extends StatelessWidget {
  const _ProviderChip({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: const Color(0xFF7C5CFC).withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF7C5CFC).withOpacity(0.3)),
      ),
      child: Text(
        label,
        style: GoogleFonts.inter(
          color: const Color(0xFF7C5CFC),
          fontSize: 10,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

/// Badge showing whether a result came from the vault or internet.
class SourceBadge extends StatelessWidget {
  const SourceBadge({super.key, required this.sourceLabel, this.inVault = false});
  final String sourceLabel;
  final bool inVault;

  @override
  Widget build(BuildContext context) {
    final Color color = inVault ? const Color(0xFF00C896) : const Color(0xFF7C5CFC);
    final IconData icon = inVault ? Icons.library_books_rounded : Icons.public_rounded;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(icon, size: 10, color: color),
        const SizedBox(width: 3),
        Text(
          inVault ? 'Local Vault' : sourceLabel,
          style: GoogleFonts.inter(
            color: color,
            fontSize: 10,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
