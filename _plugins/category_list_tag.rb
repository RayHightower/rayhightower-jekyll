# Category list tag generator added by RTH 1/9/2013 from http://www.dotnetguy.co.uk/post/2012/06/25/octopress-category-list-plugin/
module Jekyll
  class CategoryListTag < Liquid::Tag
    def render(context)
      html = ""
      categories = context.registers[:site].categories.keys

      # puts "\nFrom the render method #{categories}"

      categories.sort_by(&:downcase).each do |category|  # .sort_by(&:downcase) added by RTH 7/28/2013 to sort iOS tag properly
      # categories.each do |category|  # .sort_by(&:downcase) added by RTH 7/28/2013 to sort iOS tag properly

        # puts "category = #{category} category.class = #{category.class} titlecase = #{category.titlecase}\n"

        posts_in_category = context.registers[:site].categories[category].size
        category_dir = context.registers[:site].config['category_dir']
        category_url = File.join(category_dir, category.gsub(/_|\P{Word}/, '-').gsub(/-{2,}/, '-').downcase)
        html << "<li class='category'><a href='/#{category_url}/'>#{category} (#{posts_in_category})</a></li>\n"
      end
      html
    end
  end
end

Liquid::Template.register_tag('category_list', Jekyll::CategoryListTag)
