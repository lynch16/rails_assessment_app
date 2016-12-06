# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [users have many skills] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes)
- [Skill belongs to a Workshop] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
- [Members have many Workshops, through Skills] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
- [user_skill.skill_level] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
- [User has devise validations & doesn't allow numbers in name, Workshop validates presence and uniqueness of name, Skill validates presence of name] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
- [User.search_by URL: /users/search_by or Skill.experts(skill) shown within table in /workshops/:id] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
- [workshop/:id/edit, Skill & workshop/:id/users/:id/edit, Skill & UserSkill] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item)
- [Devise] Include signup (how e.g. Devise)
- [Devise] Include login (how e.g. Devise)
- [Devise] Include logout (how e.g. Devise)
- [Devise/OmniAuth(Google & Slack)] Include third party signup/login (how e.g. Devise/OmniAuth)
- [users/:id/workshops] Include nested resource show or index (URL e.g. users/2/recipes)
- [workshops/:id/edit includes nested 'new' Skill form] Include nested resource "new" form (URL e.g. recipes/1/ingredients)
- [All forms display errors. see form referenced above] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
