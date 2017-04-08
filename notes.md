-User
  -name
  -email
  -password
  -has a journal
  -has many activities
  -has many entries through journal

-Journal
  -name
  -belongs to a user
  -has many entires

-Entry
  -belongs to a user through journal
  <!-- I need to figure out how to customize an entry to cater to its user. accepts_nested_attributes might be the way to do this. so might need to build another model, user_activities. can i give an option to select which daily activities were completed. for might say here's all your activities, select which ones you accomplished yesterday. -->
  -has many activities through users...
  -completed, dependent on activities
  -duration, dependent on activities
  -notes


-Activity
  -name
  -daily goal for activity
  -belongs to a user
  -belongs to entry through user

-User creates daily activities (exercising, meditating, reading, deep work)
-Journal has many entries.
-Entries comment daily on individual users activities. completed or not, how long doing activity, notes on that days activity.
-I'm thinking I need a journal that has a name.
-Then entries that belong to a journal. But the entries are just checkmarks on preexisting things that the user has set up.
-So i would want a user to sign up, be asked what daily activities they want to be held accountable for. that would create a users daily_activities.
-A daily_activity model would have a name, boolean of true or false for that day, and a notes
-How would you then regenerate a individual users daily_activities.
-Maybe it would just be part of the user model...
-A user creates their own daily_activities, daily_activities have a name and description. A user has a journal. A journal has many entries. An entry is a checkbox for each of the current user's daily activities, and for how long, and any additional notes.
-might make a instance method to handle creating a new instance of an entry
-Have a model for Events. A user creates their events, it has a name, duration.
-A user creates their Event. An event has a name. An Event has many entries. An Entry has name which is event_name_entry, a duration, date, and a note, and belongs to one Journal and one User. A Journal has belongs to a User, and has a name, and has many entries.

-"rails g model Journal user:references name" (creates association, creates index, helps with queries, best for inner joins)
-dependent: :destroy
