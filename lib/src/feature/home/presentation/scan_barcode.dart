import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:king_saud_hospital/src/core/enums.dart';
import 'package:king_saud_hospital/src/core/resources/app_strings.dart';
import 'package:king_saud_hospital/src/core/services/index.dart';
import 'package:king_saud_hospital/src/core/widget/appBar.dart';
import 'package:king_saud_hospital/src/feature/home/presentation/controller/QrCode/qrCode_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ScanBarcodeScreen extends StatelessWidget {
  const ScanBarcodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<QrCodeBloc>()..add(const GetQrCodeEvent()),
      child: Scaffold(
        appBar: buildAppBar(
          context: context,
          title: AppStrings.scanTheCodeToEnter.tr(),
        ),
        body: const _ScanBody(),
      ),
    );
  }
}

class _ScanBody extends StatelessWidget {
  const _ScanBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QrCodeBloc, QrCodeState>(
      builder: (context, state) {
        return switch (state.reqState) {
          ReqState.empty => const Text('empty'),
          ReqState.error => const Text('error'),
          ReqState.loading => const Center(
              child: CircularProgressIndicator(),
            ),
          ReqState.success => QrBuilder(
              state: state,
            ),
        };
      },
    );
  }
}

class QrBuilder extends StatelessWidget {
  const QrBuilder({Key? key, required this.state}) : super(key: key);
  final QrCodeState state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (_, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Order id ${state.qrCodes[index].orderId}',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              SizedBox(
                height: 120.h,
                child: GridView.count(
                  crossAxisCount: 1,
                  scrollDirection: Axis.horizontal,
                  children: state.qrCodes[index].tickets
                      .map(
                        (e) => QrImageView(
                          data: e.code,
                          version: QrVersions.auto,
                          size: 250.0.h,
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          );

          /* return QrImageView(
            data: state.qrCodes[0].tickets[0].code,
            version: QrVersions.auto,
            size: 250.0.h,
          );*/
        },
      ),
    );
  }
}
/*
QrImageView(
data: state.qrCodes[0].tickets[0].code,
version: QrVersions.auto,
size: 250.0.h,
),*/
