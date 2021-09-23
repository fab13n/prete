_Prête_ design notes
====================
 
Prête is:

1. my first RoR project
2. a web application allowing friends, association members etc. to keep track of stuff they borrow from each other:
     * What's available for borrowing in the community
     * Where are your currently borrowed goods, and when are they due back if applicable
     * What have you borrowed and when do you have to give it back.

The MVP will only deal with goods borrowed among active members, and will leave the responsibility of registering
the goods to their respective owners. However, in a further step, it will be useful to register people and goods
which don't correspond to registered accounts, in order to help users keep track, and in order to entice
friends-of-users into the app. This will come with tricky privacy questions.

ORM
---

We have `goods` with a description (text + image) and an owner, and `loans`, associating a good with a borrower,
a due return date and users (borrower and/or owner) optional notes.