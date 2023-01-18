import 'package:flutter/material.dart';

const String linkServerName = "http://amer.ddns.net/learn/";
const String linkSignUp = linkServerName + "auth/signup.php";
const String linkLogin = linkServerName + "auth/login.php";
//http://localhost:8080/learn/auth/signup.php
//notes
const String linkAdd = linkServerName + "notes/add.php";
const String linkEdit = linkServerName + "notes/edit.php";
const String linkRemove = linkServerName + "notes/remove.php";
const String linkView = linkServerName + "notes/view.php";
const String linkImage = linkServerName + "notes/images/";
const cPhysics = BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics());
