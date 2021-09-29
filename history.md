* User accounts (https://carsonrcole.com/blog/posts/rolling-your-own-authentication-in-rails-5):
    * enable bcrypt in Gemfile + `bundle`
    * Generate index `rails generate controller Home index`
    * Generate and migrate `users` table: `rails generate scaffold User email:uniq password:digest && rails db:migrate`
    * Add a model validator `validates :email, uniqueness: true`
    * Generate sessions. Only controller, no need for a UI `rails generate controller sessions new create destroy`
    * Modify login (session/new) page and controller(sessions/{create,destroy}). `sessions` seems to be a magic Ruby word
      that persists in memory (disk? DB?) Answers this way: [https://www.justinweiss.com/articles/how-rails-sessions-work/]
      `session` is indeed special, stored by default in cookies, can be moved in memcache or in legit DB. It's setup in
      `config/anvironments/*.rb:config.cache_store`, and it's different in Rails < 5.0.
    * Force redirection to login/signup when not logged in, by tuning `application_controller.rb`; also, provide
      an always-accessible `current_user` method.
    * Exempt `sessions_controller` and parts of `users_controller` from session checking.
    * Display logged in user in `home#index`.

* My components: goods, loans and person.
    * goods have a owner, a name and a text description; images will be added later.
        * `rails generate scaffold Good name:string description:string owner:references`
        * `rails db:migrate`
    * Complete owner association:
        * `models/user has_many: :goods`
        * `models/good belongs_to :user`
    * Loans:
        * `ails generate scaffold Loan user:references good:references borrowed_at:datetime due_at:datetime owner_notes:string borrower_notes:string`
        * `User has_many :loans`
        * `Good has_many :loans`
        * Change foreign key fields into `collection_select` in `_form.erb`
        * Change `text_field` into `text_area` in the same
        * `rails db:migrate`
    * Persons: out of MVP scope, potentially linked to a user account, carries first_name last_name and email 
      (transferred from User).
  
  * Tune API:
    * Loans need a return date `returned_at`, initially null.
        * `rails generate migration add_returned_at_to_loans returned_at:datetime`
        * `rails db:migrate`
        * rajouter le bon champ dans `_form.html.erb`, `_loan.json.jbuilder`, `index.html.erb`
    * Need some HTML on the index page:
        * Remove `if current_user` cruft, we're redirected unless logged in
        * Links to other index pages
    * Create an API to set `returned_at`:
        * Add an entry point in `application.html.erb` to insert JavaScript and CSS in it
        * In loans index, change the rendering of `returned_at`: propose an action to return it now if nil
        * In `loans_controller`, change `returned_at=true` into the current datetime before processing an update.
