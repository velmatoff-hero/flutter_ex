import 'package:flutter/material.dart';
import 'package:flutter_ex/bloc/user_state.dart';
import 'package:flutter_ex/bloc/user_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      if (state is UserEmptyState) {
        return Center(
          child: Text(
            'No data received. Press button "Load"',
            style: TextStyle(fontSize: 20.0),
          ),
        );
      }
      if (state is UserLoadingState) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is UserLoadedState) {
        return ListView.builder(
          itemCount: state.loadedUser.length,
          itemBuilder: (context, index) => Container(
            color: index % 2 == 0 ? Colors.white : Colors.blue[50],
            child: ListTile(
              leading: Text(
                'ID: ${state.loadedUser[index].id}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              title: Column(
                children: [
                  Text(
                    '${state.loadedUser[index].name}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Email: ${state.loadedUser[index].email}',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                      Text('Tel: ${state.loadedUser[index].phone}')
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }
      if (state is UserErrorState) {
        return Center(
          child: Text(
            "Error",
            style: TextStyle(fontSize: 20),
          ),
        );
      }
      return CircularProgressIndicator();
    });
  }
}
