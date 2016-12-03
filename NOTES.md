X-add fields_with_errors class to forms
X-Add description to skills
X-Add third column to user_skills - Skill level (1,2,3) for notice, intermediate, expert.  Only Experts are allowed to sign off other users on skills **only experts can train someone on a skill**
X-Need to create validation to check names for invalid data.

Add officer functions
  X-will want is_officer? helper method
  -teach skill to user
    **On Member show page, if current user is officer, add link next to shop name: Teach Skills (need new route and controller method).  This will edit the user but instead of normal edit form, it will only show the shop and skills that they are officers for. Controller method will need @workshop for shop that current user is officer on**

Need to create admin controller
  -allow admin to create new users and workshops
-create scope methods to build reports for admin: Most Skilled User, Most learned skill, average # of allowed_workshops



Set restrictions
  1. Admins can manage users, workshops, and skills except delete users
  2. Officers can view workshops, skills, and profiles, edit their workshop and own profile and skill levels they are experts on, manage skills within their workshop.
  3. Users can view workshops, skills, and profiles and edit only their own profile and skill levels on skills they are experts on.

-add revoke / restore methods to users
