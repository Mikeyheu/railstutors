module ApplicationHelper
	def link_helper(post)
		if post.link == false
			return post.title
		else
			if post.url.starts_with?('http://') || post.url.starts_with?('https://')
				return link_to " #{post.title} <span class='external' ><i class='icon-external-link'></i></span>".html_safe, post.url, target: "_blank"
			else
				return link_to " #{post.title} <span class='external' ><i class='icon-external-link'></i></span>".html_safe, 'http://' + post.url, target: "_blank"
			end			
		end
	end
end
