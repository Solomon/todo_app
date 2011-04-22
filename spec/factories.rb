Factory.define :user do |user|
	user.email					"example@todoapp.com"
	user.password				"foobar"
	user.password_confirmation	"foobar"
end

Factory.sequence :email do |n|
	"person-#{n}@example.com"
end

Factory.define :list do |list|
	list.name "My List"
	list.association :user
end