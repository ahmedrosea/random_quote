import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:test_app/core/utils/app_colors.dart';
import 'package:test_app/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:test_app/features/random_quote/presentation/widgets/quote_content.dart';
import 'package:test_app/core/widgets/error_widget.dart' as error_widget;

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  Future<void> _getRandomQuote() =>
      BlocProvider.of<RandomQuoteCubit>(context).getRandomQuote();

  Widget _buildBodyContent() {
    return BlocBuilder<RandomQuoteCubit, RandomQuoteState>(
      builder: (context, state) {
        if (state is RandomQuoteIsLoading) {
          return Center(
            child: SpinKitCircle(
              color: AppColors.primary,
            ),
          );
        } else if (state is RandomQuoteError) {
          return error_widget.ErrorWidget(
            onPressed: _getRandomQuote,
          );
        } else if (state is RandomQuoteLoaded) {
          return Column(
            children: [
              QuoteContent(quote: state.quote),
              InkWell(
                onTap: () => _getRandomQuote(),
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  margin: const EdgeInsets.symmetric(vertical: 20.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary,
                  ),
                  child: const Icon(
                    Icons.refresh,
                    size: 32.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          );
        } else {
          return Center(
            child: SpinKitCircle(
              color: AppColors.primary,
            ),
          );
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _getRandomQuote();
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text("Quotes"),
    );
    return RefreshIndicator(
      onRefresh: () => _getRandomQuote(),
      child: Scaffold(
        appBar: appBar,
        body: _buildBodyContent(),
      ),
    );
  }
}
