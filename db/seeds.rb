# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

categories = Category.create([{name: "Comics"}, {name: "Games"}, {name: "Code"}, {name: "Movies"}, {name: "Cosplay"}, {name: "Random"}])

users = User.create([{ 	username: 'geeklove', 
												email:'geeklove@email.com', 
												password:'geeklove', 
												password_confirmation:'geeklove'}, 
										  { username: 'comicfan', 
												email:'comicfan@mail.com', 
												password:'comicfan', 
												password_confirmation:'comicfan'},
											{  username: 'randomnerd', 
												email:'randomnerd@mail.com', 
												password:'randomnerd', 
												password_confirmation:'randomnerd'},
											{  username: 'cosplayer', 
												email:'cosplayer@mail.com', 
												password:'cosplayer', 
												password_confirmation:'cosplayer'},
											{  username: 'manchild', 
												email:'manchild@mail.com', 
												password:'manchild', 
												password_confirmation:'manchild'}
										 	])

posts = Post.create([

	{title:"What are the best comic books to read?", url:"", link:false, user_id:1, category_id:1},
	{title:"Amazing Powergirl art", url:"http://www.designflavr.com/Breezy-Day-Stanley-Lau-i1514/", link:true, user_id:2, category_id:1},
	{title:"Hot Wonder Woman Costume", url:"http://ugly-halloween-costumes.com/scary/Wonder-Woman/", link:true, user_id:3, category_id:1},

	{title:"Best game ever?", url:"http://www.masseffect.com", link:true, user_id:3, category_id:2},
	{title:"Top 20 games to play", url:"", link:false, user_id:4, category_id:2},
	{title:"Best ios games for kids", url:"", link:false, user_id:5, category_id:2},

	{title:"Ruby on Rails", url:"http://rubyonrails.org/", link:true, user_id:4, category_id:3},
	{title:"Codecademy", url:"http://www.codecademy.com/", link:true, user_id:3, category_id:3},
	{title:"Rails Tutors", url:"http://www.railstutors.com/", link:true, user_id:4, category_id:3},

	{title:"Bladerunner 2?", url:"", link:false, user_id:1, category_id:4},
	{title:"Best Anime Movie Ever?", url:"", link:false, user_id:2, category_id:4},
	{title:"Check this awesome movie out", url:"http://www.empireonline.com/features/50-worst-movies-ever/default.asp?film=1", link:true, user_id:1, category_id:4},
	{title:"Prometheus Sequel", url:"", link:false, user_id:5, category_id:4},

	{title:"Hottest Costume Ever", url:"http://club937.com/best-halloween-costume-couple-ever-ians-pic-of-the-night/", link:true, user_id:5, category_id:5},
	{title:"Epic Costume Fails", url:"http://www.ugo.com/the-goods/long-schlong-the-50-most-epic-fail-halloween-costumes", link:true, user_id:5, category_id:5},
	{title:"Costume Fail", url:"http://pic.epicfail.com/wp-content/uploads/2012/02/costume-fail-looks-like-a-penis.jpg", link:true, user_id:3, category_id:5},

	{title:"Keyboard Cat For President", url:"http://playhimoffkeyboardcat.com/", link:true, user_id:5, category_id:6},
	{title:"Best Site ever???", url:"http://justinbiebertribute.com/", link:true, user_id:2, category_id:6},


	])

comments = Comment.create([

	{content:"The Watchmen is my favorite of all time.", post_id:1, user_id:2},
	{content:"Amazing.", post_id:2, user_id:3},
	{content:"You are evil.", post_id:3, user_id:5},
	{content:"That is sooooo hot!", post_id:3, user_id:1},

	{content:"The ending of ME3 was terrible.", post_id:4, user_id:3},
	{content:"Skyrim although it is a waste of time.", post_id:5, user_id:1},
	{content:"Toca Boca has some awesome ones.", post_id:6, user_id:4},
	{content:"Is Frickin awesome!", post_id:7, user_id:3},

	{content:"Good place to level up on foundations.", post_id:8, user_id:1},
	{content:"Who are these guys?", post_id:9, user_id:2},
	{content:"Best movie ever.", post_id:10, user_id:3},
	{content:"Anything by Miyazaki.", post_id:11, user_id:2},
	{content:"That truly is the best movie ever.", post_id:12, user_id:4},
	{content:"Is this happening?", post_id:13, user_id:2},
	{content:"Speechless.", post_id:14, user_id:4},
	{content:"LOL.", post_id:15, user_id:2},

	{content:"That baby is well hung.", post_id:16, user_id:2},
	{content:"He's got my vote!", post_id:17, user_id:5},

	{content:"Truthier words were never spoken.", post_id:18, user_id:1}

	])


