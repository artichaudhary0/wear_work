import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wear_work/utils/colors.dart';

import '../browse_maid_profile_screen/browse_maid_profile_screen.dart';

class BrowseMaidSearchScreen extends StatefulWidget {
  const BrowseMaidSearchScreen({super.key});

  @override
  State<BrowseMaidSearchScreen> createState() => _BrowseMaidSearchScreenState();
}

class _BrowseMaidSearchScreenState extends State<BrowseMaidSearchScreen> {
  final TextEditingController searchController = TextEditingController();
  bool isShowUsers = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Form(
          child: TextFormField(
            controller: searchController,
            decoration: InputDecoration(
              hintText: 'Search for a user...',
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: const BorderSide(
                  color: AppColors.borderColor,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: const BorderSide(
                  color: AppColors.borderColor,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: const BorderSide(
                  color: AppColors.borderColor,
                ),
              ),
            ),
            onFieldSubmitted: (String _) {
              setState(() {
                isShowUsers = true;
              });
            },
          ),
        ),
      ),
      body: Column(
        children: [

          const Divider(),
          const SizedBox(height: 10,),
          isShowUsers
              ? FutureBuilder(
                  future: FirebaseFirestore.instance
                      .collection('users')
                      .where(
                        'username',
                        isGreaterThanOrEqualTo: searchController.text,
                      )
                      .get(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return Expanded(
                      child: ListView.builder(
                        itemCount: (snapshot.data! as dynamic).docs.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>  BrowseMaidProfileScreen(
                                    uid: (snapshot.data! as dynamic).docs[index]['uid'],
                                    ),
                              ),
                            ),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                  (snapshot.data! as dynamic).docs[index]
                                      ['photoUrl'],
                                ),
                                radius: 16,
                              ),
                              title: Text(
                                (snapshot.data! as dynamic).docs[index]
                                    ['username'],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                )
              : FutureBuilder(
                  future: FirebaseFirestore.instance
                      .collection('posts')
                      .orderBy('datePublish')
                      .get(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return Expanded(
                      child: MasonryGridView.count(
                        crossAxisCount: 3,
                        itemCount: (snapshot.data! as dynamic).docs.length,
                        itemBuilder: (context, index) => Container(
                          height: 200,
                          width: 200,
                          child: Image.network(
                            (snapshot.data! as dynamic).docs[index]['photoUrl'],
                            fit: BoxFit.cover,
                          ),
                        ),
                        mainAxisSpacing: 8.0,
                        crossAxisSpacing: 8.0,
                      ),
                    );
                  },
                ),
        ],
      ),
    );
  }
}
