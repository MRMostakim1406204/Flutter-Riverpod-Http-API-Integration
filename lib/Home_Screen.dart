// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:riperpod_practise/practice_six/api_services.dart';
// import 'package:riperpod_practise/practice_six/user_model.dart';

// final apiProvider = Provider<APIServices>((ref) => APIServices());

// final userDataProvider = FutureProvider<UserModel?>((ref){
//   return ref.read(apiProvider).getUserData();
// });

// class PracticeSix extends ConsumerWidget {
//   const PracticeSix({super.key});

//   @override
//   Widget build(BuildContext context,WidgetRef ref) {
//     final userData = ref.watch(userDataProvider);
//     return Scaffold(
//       body: userData.when(
//         data: (data){
//           return ListView.builder(

//             itemBuilder: ((context,index){
//             return ListTile(
//               title: Text(data!.name),
//               subtitle: Text(data.email),
//               leading: CircleAvatar(
//                 child: Text(data.id.toString()),
//               ),
//             );
//           }),
//           );
//         },
//       error: ((error,StackTrace)=> Text(error.toString())),
//       loading: ((){
//         return Center(
//           child: CircularProgressIndicator(),
//         );

//       }),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'api_services.dart';
import 'user_model.dart';

final apiProvider = Provider<APIServices>((ref) => APIServices());

final userDataProvider = FutureProvider<List<UserModel>>((ref) {
  return ref.read(apiProvider).getUserData();
});

class PracticeSix extends ConsumerWidget {
  const PracticeSix({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(userDataProvider);
    return Scaffold(
      body: userData.when(
        data: (data) {
          return ListView.builder(
              itemCount: data.length,
              itemBuilder: ((context, index) {
                return ListTile(
                  title:
                      Text("${data[index].firstName} ${data[index].lastName}"),
                  subtitle: Text(data[index].email),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(data[index].avater),
                  ),
                );
              }));
        },
        error: ((error, StackTrace) => Text(error.toString())),
        loading: (() {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }),
      ),
    );
  }
}
