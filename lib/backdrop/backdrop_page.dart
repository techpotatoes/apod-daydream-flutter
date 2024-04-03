import 'package:apod_daydream/backdrop/backdrop_clock.dart';
import 'package:apod_daydream/model/apod.dart';
import 'package:apod_daydream/repo/apod_repo.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BackdropPage extends StatefulWidget {
  const BackdropPage({required Key key}) : super(key: key);

  @override
  _BackdropPageState createState() => _BackdropPageState();
}

class _BackdropPageState extends State<BackdropPage> {
  late ApodRepository apodRepository;
  late BackdropClock backdropClock;

  @override
  void initState() {
    super.initState();
    apodRepository = RestfulApodRepository();
    backdropClock = BackdropClock();
  }

  @override
  void dispose() {
    super.dispose();
    backdropClock.close();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder<Apod>(
      future: apodRepository.getApod(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Stack(fit: StackFit.expand, children: <Widget>[
            _apodImageWidget(snapshot.data!.hdurl),
            _apodInfoWidget(snapshot.data!.title, snapshot.data!.explanation),
          ]);
        } else
          return Stack(fit: StackFit.expand, children: <Widget>[
            _temporaryImageWidget(),
            _apodInfoWidget("Astronomy picture of the day",
                "A different astronomy and space science related image is featured each day, along with a brief explanation."),
          ]);
      },
    ));
  }

  Widget _apodInfoWidget(String title, String explanation) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Wrap(
        children: <Widget>[
          Container(
            color: Colors.black38,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Flexible(
                          flex: 6,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 12),
                                    child: Text(
                                      title,
                                      style:
                                          Theme.of(context).textTheme.headline2,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                explanation,
                                maxLines: 10,
                                style: Theme.of(context).textTheme.headline3,
                              ),
                            ],
                          )),
                      Flexible(
                          flex: 2,
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  StreamBuilder(
                                      stream: backdropClock.minuteStream.stream,
                                      builder: (BuildContext context,
                                          AsyncSnapshot<String> snapshot) {
                                        if (snapshot.hasData) {
                                          return Text(
                                            snapshot.data!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1,
                                          );
                                        } else {
                                          return Text("--:--",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline3);
                                        }
                                      }),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    "Photo by NASA APOD",
                                    style:
                                        Theme.of(context).textTheme.headline3,
                                  ),
                                ],
                              )
                            ],
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  CachedNetworkImage _apodImageWidget(String imageUrl) {
    return CachedNetworkImage(
        fit: BoxFit.cover,
        placeholder: (context, url) => _temporaryImageWidget(),
        imageUrl: imageUrl);
  }

  Image _temporaryImageWidget() {
    return Image(
        fit: BoxFit.cover, image: AssetImage('assets/astronomy.jpg'));
  }
}
