module Post::Operation
  class Update < Trailblazer::Operation
    class Present < Trailblazer::Operation
      step :model!
      step Contract::Build(constant: Post::Contract::Create)

      def model!(options, params:, **)
        options['model'] = Post.find(params[:id])
      end
    end

    step Nested(Present)
    step :assign_current_user!
    step Contract::Validate(key: :post)
    step Contract::Persist()

    def assign_current_user!(options, **)
      options[:params][:post][:updated_by] = options['current_user'][:id]
    end
  end
end
