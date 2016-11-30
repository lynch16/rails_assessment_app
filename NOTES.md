-add fields_with_errors class to forms
-Add description to skills
-Add third column to user_skills - Skill level (1,2,3) for notice, intermediate, expert.  Only Experts are allowed to sign off other users on skills **only experts can train someone on a skill**
-Need to create validation to check names for invalid data.

Add officer functions
  -will want is_officer? helper method
  -teach skill to user

Need to create admin controller
  -allow admin to create new users and workshops
-create scope methods to build reports for admin: Most Skilled User, Most learned skill, average # of allowed_workshops



Set restrictions
  1. Admins can manage users, workshops, and skills except delete users
  2. Officers can view workshops, skills, and profiles, edit their workshop and own profile and skill levels they are experts on, manage skills within their workshop.
  3. Users can view workshops, skills, and profiles and edit only their own profile and skill levels on skills they are experts on.

-add revoke / restore methods to users
