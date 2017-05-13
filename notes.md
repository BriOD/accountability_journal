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
[x] Be able to create an entry with daily activity accounts being shown
[x] on entry show page, have form to create a new DailyActivity.
    [x] make the form correct, need a boolean option for completeion, and need options from collection for daily_activity
[x] Make proper flow of actions. Static home page, when new user signs up, they create daily activities, and a journal.
[x] On Users show page display their journal, with all of it's entries dates as links to the that entry show page    
[x] add more activity_account to an entry via AJAX  
[x] Display a user's journal with all the entries
[] Be able to create more than one Daily_activity upon creating an account.
[x] When getting the "next" of whatever, the problem is that it is based on the id. If we want to get the next entry for a user, the current entry might be 5, and the users next entry might have an id of 12.
[x] Generating the view for the next entry is also difficult because it's not as simple as replacing one piece of data with another. We have to replace a collection of things with a different collection.
[] Instead of displaying all the entries on the users show page, have a bttn that says "show entries" and then use jQuerry the fetch all those entries and add them to the DOM.
[x] Figure out why i get Handlebars error on all other pages other than entries. How do I limit the JS in entries.js to just the entry show page?
    -this was an issue of page specific JS loading on all pages. To fix this I added "<%= javascript_include_tag params[:controller] %>" to application.html.erb in layouts folder. In config/initilaizers/assets.rb I had to add: "Rails.application.config.assets.precompile += %w( journals.js )" for every JS file i need loaded. I also had take out the "require_tree ." in application.js
[] the collection of user.entries seems to be returning all entries, at least when rendering all a users entries on their journal show page
  -nevermind. i was looking at someone elses journal, but still logged in as myself, so it was showing current_users entries 
