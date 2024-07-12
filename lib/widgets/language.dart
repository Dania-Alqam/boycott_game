import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../locale_provider.dart';

class CustomDropDownWidget extends StatefulWidget {
  const CustomDropDownWidget({
    Key? key,
    required this.provider,
  }) : super(key: key);

  final LocaleProvider provider;

  @override
  _CustomDropDownWidgetState createState() => _CustomDropDownWidgetState();
}

class _CustomDropDownWidgetState extends State<CustomDropDownWidget> {
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  bool _isDropdownOpen = false;

  void _toggleDropdown() {
    if (_isDropdownOpen) {
      _closeDropdown();
    } else {
      _openDropdown();
    }
  }

  void _openDropdown() {
    final overlay = Overlay.of(context)!;
    _overlayEntry = _createOverlayEntry();
    overlay.insert(_overlayEntry!);
    _isDropdownOpen = true;
  }

  void _closeDropdown() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    _isDropdownOpen = false;
  }

  OverlayEntry _createOverlayEntry() {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final Size size = renderBox.size;
    final Offset offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Positioned(
        width:
            size.width * 1.5, // Adjust the multiplier to set the desired width
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0.0, size.height),
          child: Material(
            color: Colors.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: L10n.all.map<Widget>((locale) {
                return GestureDetector(
                  onTap: () {
                    widget.provider.setLocale(locale);
                    _closeDropdown();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      L10n.getLanguageName(locale),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        onTap: _toggleDropdown,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          // decoration: BoxDecoration(
          //   border: Border.all(color: Colors.white),
          //   borderRadius: BorderRadius.circular(4.0),
          // ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                L10n.getLanguageName(widget.provider.locale),
                style: const TextStyle(color: Colors.white),
              ),
              const Icon(Icons.arrow_drop_down, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
