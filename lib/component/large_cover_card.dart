import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class LargeCoverCard extends StatelessWidget {
  const LargeCoverCard({
    Key key,
  }) : super(key: key);

  final String _imageUrl =
      "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2736271132,1515322104&fm=26&gp=0.jpg";
  final String _title =
      "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2736271132,1515322104&fm=26&gp=0.jpg";
  final String _subtitle =
      "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2736271132,1515322104&fm=26&gp=0.jpg";

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.only(
        left: 8,
        right: 8,
        bottom: 8.0,
      ),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: CachedNetworkImage(
              imageUrl: _imageUrl,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                child: Container(
                  color: Colors.grey[300],
                ),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.grey[300],
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        _title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        _subtitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black38,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 30,
                  height: 30,
                  child: IconButton(
                    icon: Icon(
                      Icons.more_vert,
                      color: Colors.grey[500],
                    ),
                    onPressed: () {
                      print("object");
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
