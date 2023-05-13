import 'dart:io' show Platform;
import 'package:tamos_family_club/common/language_constants.dart';
import 'package:tamos_family_club/features/attendance/presentation/bloc/attendance_bloc.dart';
import 'package:tamos_family_club/features/attendance/presentation/bloc/attendance_event.dart';
import 'package:tamos_family_club/features/attendance/presentation/bloc/attendance_state.dart';
import 'package:tamos_family_club/features/attendance/presentation/pages/qr_error.dart';
import 'package:tamos_family_club/features/attendance/presentation/pages/qr_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScannerEnter extends StatefulWidget {
  const QrScannerEnter({Key? key}) : super(key: key);

  @override
  State<QrScannerEnter> createState() => _QrScannerEnterState();
}

late AttendanceBloc bloc;

class _QrScannerEnterState extends State<QrScannerEnter> {
  @override
  void initState() {
    bloc = BlocProvider.of<AttendanceBloc>(context);
    // bloc.add(AttendanceEnter());
    // bloc.add(AttendanceExit());
    super.initState();
  }

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;

  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AttendanceBloc, AttendanceState>(
      builder: (context, state) {
        if (state is AttendanceCreating) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is AttendanceTrue) {
          return const QrSuccess();
        } else if (state is AttendanceError) {
          return const QrError();
        } else {
          return Scaffold(
            body: Stack(
              children: [
                QRView(key: qrKey, onQRViewCreated: _onQrViewCreated),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 90),
                  child: Column(
                    children: [
                      const Spacer(flex: 160),
                      SvgPicture.asset(
                        'assets/icons/frame_icon.svg',
                        height: 280,
                        width: 280,
                      ),
                      const Spacer(flex: 70),
                      Text(
                        translation(context).enter_club,
                        style: Theme.of(context).textTheme.headlineMedium,
                        textAlign: TextAlign.center,
                      ),
                      const Spacer(flex: 20),
                      (result != null)
                          ? Text(
                              '${result!.code}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(color: Colors.black),
                              textAlign: TextAlign.center,
                            )
                          : Text(
                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                      const Spacer(flex: 115),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }

  _onQrViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen(
      (scanData) {
        setState(
          () {
            result = scanData;
            if (result?.code == '123') {
              bloc.add(AttendanceEnter());
            } else if (result?.code == '321') {
              bloc.add(AttendanceExit());
            } else {}
          },
        );
      },
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
