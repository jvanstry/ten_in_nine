FactoryGirl.define do
  factory :admin, class: User do
    name 'admin_guy'
    password  'some_pw'
    password_confirmation 'some_pw'
  end

  factory :project do
    name 'test_proj'
    github_url 'some_url'
    description 'some things'
    thumbnail_url 'some_other_url'
  end
end