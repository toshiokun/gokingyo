module ApplicationHelper
	def full_title(page_title)
    	base_title = "Sil-地域子育て情報コミュニティ"
    	if page_title.empty?
      		base_title
    	else
      		"#{base_title} | #{page_title}"
    	end
  	end

  	def nl2br(str)
		str.gsub(/\r\n|\r|\n/, "<br />").html_safe
	end
end
