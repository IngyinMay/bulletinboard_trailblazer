module Post::Operation
  class Filter < Trailblazer::Operation
    step :filter_posts!

    def filter_posts!(options, params:, **)
      case params[:filter_by]
      when '1'
          options[:model] = Post.all.order("created_at DESC")
      when '2'
          options[:model] = Post.where(created_by: options[:current_user_id]).order("created_at DESC")
      when '3'
          options[:model] = Post.where.not(created_by: options[:current_user_id]).order("created_at DESC")
      end
      options[:last_filter_by] = params[:filter_by]
    end

    class Search < Trailblazer::Operation
      step :search_posts!

      def search_posts!(options, params:, **)
        options[:model] = Post.where("title LIKE :title or description LIKE :desc", {:title => "%#{params[:search_keyword]}%", :desc => "%#{params[:search_keyword]}%"})
        options[:last_search_keyword] = params[:search_keyword]
      end
    end
  end
end
