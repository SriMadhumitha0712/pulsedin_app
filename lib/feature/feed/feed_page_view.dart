import 'package:data/entity/feed/feed_response_entity.dart';
import 'package:domain/model/feeds_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulsedin_app/base/base_page.dart';
import 'package:pulsedin_app/di/feed_module.dart';
import 'package:pulsedin_app/feature/feed/feed_page_view_model.dart';
import 'package:pulsedin_app/generated/l10n.dart';
import 'package:pulsedin_app/molecules/colour_resourse.dart';
import 'package:pulsedin_app/molecules/custom_scaffold.dart';
import 'package:pulsedin_app/molecules/custom_text.dart';
import 'package:pulsedin_app/molecules/image_resourse.dart';
import 'package:pulsedin_app/utils/app_stream_builder.dart';
import 'package:pulsedin_app/utils/extensions.dart';
import 'package:pulsedin_app/utils/resource.dart';
import 'package:pulsedin_app/utils/status.dart';
import 'package:responsive_builder/responsive_builder.dart';

class FeedPageView extends BasePageViewWidget<FeedPageViewModel> {
  const FeedPageView(ProviderBase providerBase, {Key? key})
      : super(providerBase, key: key);

  @override
  Widget build(BuildContext context, FeedPageViewModel model) {
    return CustomScaffold(
        body: ScreenTypeLayout.builder(
      desktop: (BuildContext context) => const _WebLayout(),
      mobile: (BuildContext context) => const _MobileLayout(),
      tablet: (BuildContext context) => const _MobileLayout(),
    ));
  }
}

class _WebLayout extends StatelessWidget {
  const _WebLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read(feedModuleProvider);
    return Column(children: [
      Stack(
        children: [
          Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              gradient: RadialGradient(
                colors: [
                  ColorResource.blue,
                  ColorResource.navyBlue,
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: 132, right: 16, bottom: 11),
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        ImageResourses.feedLogo,
                      ),
                      fit: BoxFit.scaleDown),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 120),
            child: TextContainer(),
          ),
        ],
      ),
      Column(
        children: [
          Container(
            constraints: const BoxConstraints(maxWidth: 480),
            child: AppStreamBuilder<Resource<FeedResponseEntity>>(
              initialData: Resource.loading(),
              stream: viewModel.feedData,
              dataBuilder: (context, feed) {
                if (feed?.status != Status.SUCCESS) {
                  return Container();
                }
                if (viewModel.feed.isEmpty) {
                  return Container();
                }
                return ListView.builder(
                  itemCount: viewModel.feed.length,
                  itemBuilder: (context, index) {
                    return index >= viewModel.feed.length
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 12),
                            child: Post(indexs: index),
                          );
                  },
                );
              },
            ),
          ),
        ],
      ),
    ]);
  }
}

class _RightPanel extends StatelessWidget {
  const _RightPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read(feedModuleProvider);
    //int selectedIndex = 0;
    return Column(children: [
      Stack(
        children: [
          Container(
            height: 120,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              gradient: RadialGradient(
                colors: [
                  ColorResource.blue,
                  ColorResource.navyBlue,
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: 132, right: 16, bottom: 11),
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        ImageResourses.feedLogo,
                      ),
                      fit: BoxFit.scaleDown),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 90),
            child: TextContainer(),
          ),
        ],
      ),
      AppStreamBuilder<Resource<FeedResponseEntity>>(
          initialData: Resource.loading(),
          stream: viewModel.feedData,
          dataBuilder: (context, feed) {
            if (feed?.status != Status.SUCCESS) {
              return Container();
            }
            if (viewModel.feed.isEmpty) {
              return Container();
            }
            return RefreshIndicator(
              backgroundColor: ColorResource.blue,
              onRefresh: () async {
                viewModel.triggerFeed();
              },
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: viewModel.feed.length,
                  itemBuilder: (context, index) {
                    return index >= viewModel.feed.length
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 12),
                            child: Post(indexs: index),
                          );
                  }),
            );
          })
    ]);
  }
}

class _MobileLayout extends StatelessWidget {
  const _MobileLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _RightPanel();
  }
}

class Post extends StatelessWidget {
  final int indexs;

  const Post({
    Key? key,
    required this.indexs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read(feedModuleProvider);
    Payload payload = viewModel.feed[indexs].post!.payload!;
    return Column(children: [
      Card(
        color: ColorResource.cardlightBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    left: 13,
                    top: 14,
                  ),
                  child: CircleAvatar(
                    radius: 27,
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 12,
                        top: 10,
                        right: 90,
                      ),
                      child: payload.nurse_info != null
                          ? Text(
                              payload.nurse_info!.first_name!,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : const Text('post'),
                    ),
                    Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(
                            top: 10,
                            left: 37,
                          ),
                          child: Image(
                            color: ColorResource.lightAsh,
                            image: AssetImage(
                              ImageResourses.clock,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 10,
                            left: 7,
                          ),
                          // child: Text(
                          //   Jiffy(
                          //     payload.created_at!,
                          //   ).endOf(Units.MINUTE).fromNow(),
                          //   style: const TextStyle(
                          //     color: ColorResource.ash,
                          //   ),
                          // ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 10,
                    left: 100,
                  ),
                  child: IconButton(
                    color: ColorResource.ash,
                    iconSize: 30,
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert_outlined),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: const [
                Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    left: 10,
                    right: 5,
                  ),
                  child: Text('empty'),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
            ),
            Padding(
              padding: const EdgeInsets.only(),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 11,
                    ),
                    child: Image.asset(
                      color: ColorResource.ash,
                      ImageResourses.like,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 5,
                    ),
                    child: Text(
                      '${payload.like_count!} Beats',
                      style: const TextStyle(
                        color: ColorResource.ash,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 9,
                      left: 80,
                    ),
                    child: Text(
                      '${payload.share_count!} Shares',
                      style: const TextStyle(
                        color: ColorResource.ash,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 8,
                    ),
                    child: Image.asset(
                      ImageResourses.dot,
                      width: 5,
                      height: 5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 11,
                    ),
                    child: Text(
                      '${payload.comment_count!} Comments',
                      style: const TextStyle(
                        color: ColorResource.ash,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(),
              child: Divider(
                color: ColorResource.lightGrey,
                thickness: 0.5,
              ),
            ),
            IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 2,
                  bottom: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 12,
                        right: 5,
                      ),
                      child: TextButton.icon(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.only(left: 5),
                          textStyle: const TextStyle(fontSize: 20),
                        ),
                        onPressed: () {},
                        icon: Image.asset(ImageResourses.like,
                            color: ColorResource.ash),
                        label: CustomText(
                          S.of(context).like,
                          fontSize: 14,
                          color: ColorResource.lightGrey,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        right: 28,
                      ),
                      child: VerticalDivider(
                        color: ColorResource.lightGrey,
                        thickness: 0.5,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 10,
                      ),
                      child: TextButton.icon(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.only(left: 5),
                          textStyle: const TextStyle(fontSize: 20),
                        ),
                        onPressed: () {},
                        icon: Image.asset(ImageResourses.comment,
                            color: ColorResource.ash),
                        label: CustomText(
                          S.of(context).comment,
                          fontSize: 14,
                          color: ColorResource.lightGrey,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        right: 10,
                      ),
                      child: VerticalDivider(
                        color: ColorResource.lightGrey,
                        thickness: 0.5,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 9,
                      ),
                      child: TextButton.icon(
                        icon: Image.asset(ImageResourses.share,
                            color: ColorResource.ash),
                        label: CustomText(
                          S.of(context).share,
                          fontSize: 14,
                          color: ColorResource.lightGrey,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    ]);
  }
}

class TextContainer extends StatelessWidget {
  const TextContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  top: 7,
                  left: 7,
                  bottom: 8,
                ),
                child: CircleAvatar(
                  radius: 27,
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    right: 10,
                    top: 10,
                    bottom: 10,
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: const BoxDecoration(
                        color: ColorResource.light,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        )),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 15, top: 20),
                      child: CustomText('Write Something here...',
                          fontWeight: FontWeight.w400,
                          color: ColorResource.ash),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
  // bottomNavigationBar: BottomNavigationBar(
  //               type: BottomNavigationBarType.fixed,
  //               backgroundColor: const Color.fromARGB(255, 255, 255, 255),
  //               selectedItemColor: Colors.blue,
  //               unselectedItemColor: Colors.grey.withOpacity(.60),
  //               unselectedFontSize: 14,
  //               selectedFontSize: 10,
  //               selectedIconTheme: const IconThemeData(
  //                 color: Colors.grey,
  //               ),
  //               selectedLabelStyle:
  //                   const TextStyle(fontWeight: FontWeight.bold),
  //               currentIndex: selectedIndex,
  //               onTap: (int index) {
  //                 selectedIndex = index;
  //               },
  //               items: <BottomNavigationBarItem>[
  //                 BottomNavigationBarItem(
  //                   icon: IconButton(
  //                     icon: const Icon(
  //                       Icons.home_sharp,
  //                       color: Colors.blue,
  //                     ),
  //                     onPressed: () {},
  //                   ),
  //                   label: '',
  //                 ),
  //                 BottomNavigationBarItem(
  //                   icon: IconButton(
  //                     icon: const Icon(Icons.groups),
  //                     onPressed: () {},
  //                   ),
  //                   label: '',
  //                 ),
  //                 BottomNavigationBarItem(
  //                   icon: IconButton(
  //                     icon: const Icon(Icons.notifications),
  //                     onPressed: () {},
  //                   ),
  //                   label: '',
  //                 ),
  //                 BottomNavigationBarItem(
  //                   icon: IconButton(
  //                     icon: const Icon(Icons.person),
  //                     onPressed: () {},
  //                   ),
  //                   label: '',
  //                 ),
  //                 BottomNavigationBarItem(
  //                   icon: IconButton(
  //                     icon: const Icon(Icons.more_vert),
  //                     onPressed: () {
  //                       context.beamToNamed('/login');
  //                     },
  //                   ),
  //                   label: '',
  //                 ),
  //               ],
  //             ));
  //       });