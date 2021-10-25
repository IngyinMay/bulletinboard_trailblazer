module Post::Operation
  class Index < Trailblazer::Operation
    step :get_post_list

    def get_post_list(options, **)
      current_user = options[:current_user]
      options['model'] = if current_user
                           Post.all.order('created_at DESC')
                         else
                           Post.where(public_flag: true).order('created_at DESC')
                         end
    end
  end
end
