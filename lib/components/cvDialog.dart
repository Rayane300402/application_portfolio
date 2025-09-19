import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/theme/theme.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

Future<void> showCVDialog(BuildContext context) async {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: AppTheme.primaryGreen,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _DownloadButton(
                label: 'Software Developer CV',
                assetPath: 'assets/CV/softwareDev.pdf',
              ),
              const SizedBox(height: 20),
              _DownloadButton(
                label: 'Mobile Developer CV',
                assetPath: 'assets/CV/mobileDev.pdf',
              ),
            ],
          ),
        ),
      );
    },
  );
}

class _DownloadButton extends StatelessWidget {
  final String label;
  final String assetPath;

  const _DownloadButton({
    super.key,
    required this.label,
    required this.assetPath,
  });

  Future<void> _savePdfToDevice(BuildContext context) async {
    try {
      final bytes = await rootBundle.load(assetPath);
      final Uint8List data = bytes.buffer.asUint8List();

      final fileName = label.replaceAll(" ", "_");

      final path = await FileSaver.instance.saveFile(
          name: fileName,
          bytes: data,
          mimeType: MimeType.pdf
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Saved to Downloads! $path'), backgroundColor: AppTheme.primaryGreen,),
      );

      Navigator.of(context).pop(); // Close the dialog
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error saving file')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.textWhite,
        foregroundColor: AppTheme.primaryGreen,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      onPressed: () => _savePdfToDevice(context),
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}
