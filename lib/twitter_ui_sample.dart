import 'package:flutter/material.dart';

class TwitterUiSample extends StatelessWidget {
  const TwitterUiSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'タロウ@柴犬',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: const [
              TweetTile(),
              Divider(),
              TweetTile(),
              Divider(),
              TweetTile(),
              Divider(),
              TweetTile(),
              Divider(),
              TweetTile(),
              Divider(),
              TweetTile(),
              Divider(),
              TweetTile(),
              Divider(),
              TweetTile(),
              Divider(),
              TweetTile(),
              Divider(),
              TweetTile(),
              Divider(),
              TweetTile(),
              Divider(),
              TweetTile(),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}

class TweetTile extends StatelessWidget {
  const TweetTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            backgroundImage: NetworkImage(
                'https://3.bp.blogspot.com/-WjyQjOk_DN0/XKWREY4UbrI/AAAAAAABSNs/OIuk3y34aLgcYxQrCztbAt8Qo0vqrWkWQCLcBGAs/s800/dog_shibainu_brown.png'),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Text('タロウ＠柴犬'),
                  SizedBox(width: 8),
                  Text('2022/06/14'),
                ],
              ),
              const SizedBox(height: 4),
              const Text('吾輩は犬である'),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.chat_bubble_outline),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.repeat_outlined),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_border),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.send_time_extension_outlined),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
