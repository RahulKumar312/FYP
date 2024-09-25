import 'package:flutter/material.dart';
import 'package:servant_industry_hiring/ui/common/app_strings.dart';
import 'package:servant_industry_hiring/ui/common/uihelper/text_helper.dart';
import 'package:servant_industry_hiring/ui/views/wallet/wallet_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../common/apihelpers/apihelper.dart';
import '../../../common/app_colors.dart';
import '../../../common/ui_helpers.dart';
import '../../../common/uihelper/snakbar_helper.dart';
import 'analysis_model.dart';

class Analysis extends StackedView<AnalysisModel> {
  const Analysis({super.key});

  @override
  Widget builder(
    BuildContext context,
    AnalysisModel viewModel,
    Widget? child,
  ) {
    return FutureBuilder(
      future: data(viewModel),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              SfCartesianChart(
                  primaryXAxis: const CategoryAxis(),
                  borderWidth: 4,
                  plotAreaBorderWidth: 0,
                  title: ChartTitle(
                      text: "Orders",
                      textStyle: text_helper.customstyle(
                          poppins, kcDarkGreyColor, fontSize12, context, true)),
                  primaryYAxis:
                      const NumericAxis(minimum: 0, maximum: 20, interval: 5),
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: <CartesianSeries>[
                    ColumnSeries<ChartData, String>(
                        dataSource: snapshot.data,
                        xValueMapper: (ChartData data, _) => data.x,
                        yValueMapper: (ChartData data, _) => data.y,
                        name: "Orders",
                        color: getColorWithOpacity(amber, 1))
                  ]),
            ],
          );
        } else if (snapshot.hasError) {
          return const Icon(
            Icons.error,
            color: kcDarkGreyColor,
          );
        } else {
          return displaysimpleprogress(context);
        }
      },
    );
  }

  Future<List<ChartData>> data(AnalysisModel viewModel) async {
    List a = await ApiHelper.allbookingbysid(
        viewModel.sharedpref.readString('phone'));
    Map d = {};
    for (var value in a) {
      if (d.containsKey(value['date'].toString().substring(0, 10))) {
        d[value['date'].toString().substring(0, 10)] =
            d[value['date'].toString().substring(0, 10)] + 1;
      } else {
        d[value['date'].toString().substring(0, 10)] = 0;
      }
    }

    List<ChartData> ch = [];

    d.forEach((key, val) {
      ChartData c = ChartData(key, double.parse(val.toString()));
      ch.add(c);
    });

    return ch;
  }

  @override
  AnalysisModel viewModelBuilder(
    BuildContext context,
  ) =>
      AnalysisModel();
}
