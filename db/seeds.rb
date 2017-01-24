['registered', 'banned', 'moderator', 'admin','group_approved','group_pending_approval'].each do |role|
  Role.find_or_create_by({name: role})
end

admin_user = {email:  'chatounce98@gmail.com',
              password_confirmation: 'chatounce@',
              password:  'chatounce@',
              first_name: "Admin",
              last_name:  "Admin",
              user_name:  "Administrator",
              bio: "Admin is the super user",
              is_female: false,
              :confirmed_at => DateTime.now
            }
admin_user.skip_confirmation!
admin_user  = Role.where(name: 'admin').first.users.build(admin_user)
admin_user.save!
