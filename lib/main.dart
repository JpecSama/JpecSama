import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app.dart';

Future<void> main() async {
  await Supabase.initialize(
      url: 'https://tutsgtrbfpdvsxzyoqkk.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InR1dHNndHJiZnBkdnN4enlvcWtrIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjE2NzA3OTksImV4cCI6MjAzNzI0Njc5OX0.tKn31L4GMM_x9qVGPCM-6KmAUmSdwyv9qFJF0vUnRSA',
      debug: true);
  await Hive.initFlutter();
  runApp(const MyApp());
}

final supabase = Supabase.instance.client;
