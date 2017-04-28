<!-- -User
  -name
  -email
  -password
  -has a journal
  -has many activities
  -has many entries through journal

-Journal
  -name
  -belongs to a user
  -has many entires -->

<!-- -Entry
  -belongs to a user through journal -->
  <!-- -has many activities through users...
  -completed, dependent on activities
  -duration, dependent on activities
  -notes -->


<!-- -Activity
  -name
  -daily goal for activity
  -belongs to a user
  -belongs to entry through user -->

-User creates daily activities (exercising, meditating, reading, deep work)
<!-- -Journal has many entries.
-Entries comment daily on individual users activities. completed or not, how long doing activity, notes on that days activity.
-I'm thinking I need a journal that has a name.
-Then entries that belong to a journal. But the entries are just checkmarks on preexisting things that the user has set up.
-So i would want a user to sign up, be asked what daily activities they want to be held accountable for. that would create a users daily_activities.
-A daily_activity model would have a name, boolean of true or false for that day, and a notes
-How would you then regenerate a individual users daily_activities.
-Maybe it would just be part of the user model...
-A user creates their own daily_activities, daily_activities have a name and description. A user has a journal. A journal has many entries. An entry is a checkbox for each of the current user's daily activities, and for how long, and any additional notes. -->
-might make a instance method to handle creating a new instance of an entry
<!-- -Have a model for Events. A user creates their events, it has a name, duration.
-A user creates their Event. An event has a name. An Event has many entries. An Entry has name which is event_name_entry, a duration, date, and a note, and belongs to one Journal and one User. A Journal has belongs to a User, and has a name, and has many entries. -->

<!-- -"rails g model Journal user:references name" (creates association, creates index, helps with queries, best for inner joins)
-dependent: :destroy -->
-probably want entry to be nested under journal, and user to be alone
-When a user signs up, they get redirected to 'journal/new' and are instructed to create a Journal. Once they create a Journal they are redirected to 'user/show' where they are shown their Accountability Activities, an option to create more Activities, their last entry with an option to see previous entries, a button to create a new entry, which will redirect them to 'entry/new' where they can create a new entry, and a DailyAccount, on submit the new entry will be appended to the DOM, and the option to to keep adding DailyAccounts will still be there.
-OK i can't figure out why error messages won't show up but i'm moving past it. It seems that the field with errors won't show up when there's an error
-I want to create a method in the Entry model that generates a certain number of activity accounts, the number of daily_activities that a user has.
-might want a method 'add_entry_to_journal'. We want to be able to create a complete entry, with all of it's completed daily_activities.

TODO:
[] Be able to create an entry with daily activity accounts being shown
[x] on entry show page, have form to create a new DailyActivity.
    [] make the form correct, need a boolean option for completeion, and need options from collection for daily_activity
[] add more daily_activities to an entry via AJAX  
[] Display a user's journal with all the entries
