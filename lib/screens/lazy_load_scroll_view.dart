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
  final int itemPerPage = 10;
  late int page;
  bool isLoadingItem = false;
  bool hasMore = true;
  bool isSuccess = true;

  @override
  void initState() {
    page = 1;
    _loadMoreItem();
    super.initState();
  }

  Future<void> _loadMoreItem() async {
    //print('loadMore' + page.toString());
    if (hasMore) {
      if (!isLoadingItem) {
        setState(() {
          isLoadingItem = true;
        });
        //print('text' + page.toString());
        //TODO: Kiểm tra điều kiện để load (Hết item hoặc đang load)
        final result = await MockResponsetory.mock(page, itemPerPage);
        //TODO: handle response
        //successful
        //error
        //hasMore
        //no more Item
        if (result.isSuccess) {
          setState(() {
            verticalData.addAll(result.data);
            hasMore = result.hasMore;
            isSuccess = result.isSuccess;
            hasMore ? page++ : page;
            isLoadingItem = false;
          });
        } else {
          setState(() {
            isSuccess = result.isSuccess;
          });
        }
      }
    }
  }

  Future<void> _onRefresh() async {
    if (mounted) {
      setState(() {
        isLoadingItem = false;
        isSuccess = true;
      });
      _loadMoreItem();
    }
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
        child: Stack(
          children: [
            ListView.builder(
              itemCount: verticalData.length + 2,
              itemBuilder: (context, position) {
                return (position == verticalData.length)
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Offstage(
                            offstage: (verticalData.isNotEmpty && !isSuccess)
                                ? false
                                : true,
                            child: TextButton(
                              onPressed: _onRefresh,
                              child: const Text(
                                'Error, Tap To Reload',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                          Opacity(
                            opacity: (verticalData.isNotEmpty &&
                                    isLoadingItem &&
                                    isSuccess)
                                ? 1.0
                                : 0.0,
                            child: const CircularProgressIndicator(),
                          ),
                        ],
                      )
                    : (position == verticalData.length + 1)
                        ? Offstage(
                            offstage: hasMore,
                            child: const Center(
                              child: Text(
                                'No More Item',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          )
                        : DemoItem(verticalData[position]);
              },
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Offstage(
                    offstage: verticalData.isNotEmpty,
                    child: const Text(
                      'This List Is Empty',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Offstage(
                    offstage:
                        (verticalData.isEmpty && isLoadingItem && isSuccess)
                            ? false
                            : true,
                    child: const CircularProgressIndicator(),
                  ),
                  Offstage(
                    offstage:
                        (verticalData.isEmpty && !isSuccess) ? false : true,
                    child: TextButton(
                      onPressed: _onRefresh,
                      child: const Text(
                        'Error, Tap To Reload',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
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
