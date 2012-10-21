module PostsHelper
	def link_helper(post)
		if post.link == false
			return post.title
		else
			if post.url.starts_with?('http://') || post.url.starts_with?('https://')
				return link_to post.title, post.url
			else
				return link_to post.title, 'http://' + post.url
			end			
		end
	end
end

