# JpecSama

## Getting Started

```
flutter run -d web-server --web-hostname localhost --web-port 3000
```


```
alter table flashcard
add column user_id uuid references auth.users(id) on delete cascade;
```

```
create policy "Enable delete for users based on user_id"
on "public"."flashcard"
as PERMISSIVE
for DELETE
to public
using (
  (select auth.uid()) = user_id
);
```

```
create policy "Enable flashcard ALL for users based on user_id"
on "public"."flashcard"
as PERMISSIVE
for ALL
to public
using (
  (select auth.uid()) = user_id
);
```

```
alter policy "ALL for flashcard_answer"
on "public"."flashcard_answer"
to authenticated
using (
  (( SELECT auth.uid() AS uid) IN ( SELECT f.user_id
   FROM flashcard f
  WHERE (f.id = flashcard_answer.flashcard_id)))
);
```


https://jisho.org/search/%23kanji%20%E8%8A%9D

https://jisho.org/api/v1/search/words?keyword=jlpt-n5&page=2

https://tatoeba.org/fr/downloads


https://www.tanoshiijapanese.com/dictionary/entry_details.cfm?entry_id=22293





## Workmanager

https://pub.dev/packages/workmanager

To add in `main.dart`
```
  Workmanager().initialize(callbackDispatcher, isInDebugMode: kDebugMode);
  Workmanager().registerPeriodicTask(
    "1",
    "checkReviewsTask",
    frequency: const Duration(hours: 1),
  );
```

Create an entry point:
```
@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    print('callbackDispatcher');
    await Supabase.initialize(
      url: supabaseUrl,
      anonKey: supabaseKey,
      debug: kDebugMode,
    );
    final supabaseClient = SupabaseClient(supabaseUrl, supabaseKey);

      await NotificationService.initNotifications();
      ...
  });
}

```
NB: The workmanager runs on a separate isolate from the main flutter isolate. Ensure to initialize all dependencies inside the Workmanager().executeTask.


