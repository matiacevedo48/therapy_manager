ActiveAdmin.register User do

  permit_params :admin, :email, :username, :photo_url

  index do
    column :email
    column :username
    column :photo_url
    actions
  end



end
