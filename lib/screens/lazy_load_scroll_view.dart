import 'package:flutter/material.dart';
import 'package:flutter_widget_app/constants/mock.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class MyLazyLoadScrollView extends StatefulWidget {
  static const String routeName = '/lazy-load-scroll-view';

  const MyLazyLoadScrollView({Key? key}) : super(key: key);

  @override
  _LazyLoadScrollViewState createState() => _LazyLoadScrollViewState();
}

class _LazyLoadScrollViewState extends State<MyLazyLoadScrollView> {
  List<int> verticalData = [];
  final int increment = 10;
  bool isLoadingItem = false;

  @override
  void initState() {
    _loadMoreItem();
    super.initState();
  }

  Future<void> _loadMoreItem() async {
    setState(() {
      isLoadingItem = true;
    });

    await MockReponsetory.mock();

    verticalData.addAll(
        List.generate(increment, (index) => verticalData.length + index));

    if (mounted) {
      setState(() {
        isLoadingItem = false;
      });

      final snackBar = SnackBar(
        content: const Text('Loading Item Successful'),
        action: SnackBarAction(
          label: 'Cloce',
          onPressed: () {},
        ),
        duration: const Duration(seconds: 1),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Future<void> _onRefresh() async {
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      verticalData = [];
      verticalData.addAll(
          List.generate(increment, (index) => verticalData.length + index));
    });

    final snackBar = SnackBar(
      content: const Text('Reload Page Successful'),
      action: SnackBarAction(
        label: 'Cloce',
        onPressed: () {},
      ),
      duration: const Duration(seconds: 1),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lazy Load Scroll View'),
      ),
      body: LazyLoadScrollView(
        isLoading: isLoadingItem,
        onEndOfPage: () => _loadMoreItem(),
        child: Scrollbar(
          child: RefreshIndicator(
            onRefresh: _onRefresh,
            child: ListView(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Vertical ListView',
                    textAlign: TextAlign.center,
                  ),
                ),
                verticalData.isEmpty
                    ? Column(
                        children: const [
                          SizedBox(
                            height: 30,
                          ),
                          Center(
                            child: Text(
                              'This List Is Empty',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w300,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: verticalData.length,
                        itemBuilder: (context, position) {
                          return DemoItem(position);
                        },
                      ),
                Opacity(
                  opacity: isLoadingItem ? 1 : 0,
                  child: Column(
                    children: const [
                      SizedBox(
                        height: 30,
                      ),
                      Center(child: CircularProgressIndicator()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DemoItem extends StatelessWidget {
  final int position;

  const DemoItem(
    this.position, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    color: Colors.grey,
                    height: 40.0,
                    width: 40.0,
                  ),
                  const SizedBox(width: 8.0),
                  Text("Item $position"),
                ],
              ),
              const Text("This is the item in list demo LazyLoadScrollView"),
            ],
          ),
        ),
      ),
    );
  }
}
