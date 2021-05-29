import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_quiz/userModel.dart';

class Comments extends StatefulWidget {
  @override
  _CommentsState createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _coments;
  Firestore db = Firestore.instance;
  postComment() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print(_coments);

      try {
        Firestore.instance.collection('comments').add({
          'creation_date': DateTime.now(),
          'userName': UserDetails().username,
          'comments': _coments,
        });
      } catch (e) {}
    }
  }

  List<String> _comments = [];
  void _addComment(String val) {
    setState(() {
      _comments.add(val);
      postComment();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                size: ScreenUtil().setSp(25),
                color: Color(0xff0000ff),
              ),
            ),
          ),
          title: Padding(
            padding:  EdgeInsets.only(top:17.h),
            child: Text('Feedback', style: TextStyle(
                                fontSize: ScreenUtil().setSp(24),
                                color: Color(0xff0000ff)),),
          ),
          centerTitle: true,
        ),
      ),
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Color(0xff0000ff), Color(0xffafeeee)])),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 40.h,
                ),
                Expanded(
                  child: StreamBuilder(
                    stream: db
                        .collection('comments')
                        .orderBy('creation_date', descending: true)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                            child: Text(
                          'Add the comments',
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(40),
                              color: Colors.white),
                        ));
                      }
                      return ListView.builder(
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (context, index) => CustomComment(
                          comments: snapshot.data.documents[index]['comments'],
                          name: snapshot.data.documents[index]['userName'],
                        ),
                      );
                    },
                  ),
                ),
                TextFormField(
                    onFieldSubmitted: (String submittedStr) {
                      _addComment(submittedStr);
                    },
                    onSaved: (input) => _coments = input,
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () => _addComment(_coments),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          width: 60.w,
                          height: 10.h,
                          child: Center(
                              child: Text(
                            'post',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.italic,
                                fontSize: ScreenUtil().setSp(13)),
                          )),
                        ),
                      ),
                      contentPadding: const EdgeInsets.all(20),
                      hintText: "Add coments",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                          fontSize: ScreenUtil().setSp(13),
                          color: Colors.black),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomComment extends StatefulWidget {
  final String comments, name;
  CustomComment({@required this.comments, this.name});
  @override
  _CustomCommentState createState() =>
      _CustomCommentState(this.comments, this.name);
}

class _CustomCommentState extends State<CustomComment> {
  final String comments, name;
  _CustomCommentState(this.comments, this.name);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12)),
          width: 250.w,
          height: 60.h,
          child: ConstrainedBox(
            constraints: BoxConstraints(
                minWidth: 70.w,
                maxWidth: 120.w,
                minHeight: 40.h,
                maxHeight: 70.h),
            child: Padding(
              padding: EdgeInsets.only(left: 18.w, top: 10.h),
              child: ListTile(
                subtitle: Padding(
                  padding: EdgeInsets.only(bottom: 18.h),
                  child: Text(
                    'by   ' + name,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: ScreenUtil().setSp(15)),
                  ),
                ),
                title: Padding(
                  padding: EdgeInsets.only(left: 1.w, bottom: 10.h),
                  child: Text(
                    comments,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: ScreenUtil().setSp(18),
                      color: Color(0xFF394AA3),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
