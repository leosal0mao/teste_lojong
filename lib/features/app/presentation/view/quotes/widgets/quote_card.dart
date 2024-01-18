import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:teste_lojong/core/constants/colors.dart';

import '../../../widgets/custom_button.dart';

class QuoteCard extends StatelessWidget {
  final String quote;
  final String quoteAuthor;

  const QuoteCard({
    super.key,
    required this.quote,
    required this.quoteAuthor,
  });

  @override
  Widget build(BuildContext context) {
    Widget svgBackground = SvgPicture.asset(
      'assets/images/@3x.svg',
    );
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.startGradientColor,
                    AppColors.endGradientColor,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 8,
                    spreadRadius: 2,
                    offset: const Offset(0, 3),
                  ),
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              child: FittedBox(
                fit: BoxFit.fill,
                child: svgBackground,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    quote,
                    style: TextStyle(
                      color: AppColors.quotesTextColor,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    quoteAuthor,
                    style: TextStyle(
                      color: AppColors.quotesTextColor,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.only(
                      left: size.width / 15,
                      right: size.width / 15,
                    ),
                    child: CustomButton(
                      buttonTextColor: AppColors.white,
                      buttonColor: AppColors.quotesTextColor,
                      buttonIcon: Icons.share,
                      iconColor: AppColors.white,
                      buttonText: 'Compartilhar',
                      onTap: () async {
                        await Clipboard.setData(ClipboardData(text: quote))
                            .then((_) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(seconds: 3),
                              content: Text(
                                  'Citação copiada para a área de transferência'),
                            ),
                          );
                        });
                        // copied successfully
                      },
                    ),
                  ),
                ]),
          )
        ],
      ),
    );
  }
}
