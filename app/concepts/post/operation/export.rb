require 'csv'
module Post::Operation::Export
  class CsvData < Trailblazer::Operation
    step :get_posts
    step :to_csv_text!

    def get_posts(options, **)
      options[:posts] = Post.all.order('created_at DESC')
    end

    def to_csv_text!(options, **)
      headers = Constants::POST_CSV_HEADER
      options[:csv_text] =  CSV.generate(headers: true) do |csv|
                              csv << headers
                              options[:posts].each do |post|
                                csv << headers.map{ |attr| post.send(attr) }
                              end
                            end
    end
  end

  class Format < Trailblazer::Operation
    step :get_csv_format!

    def get_csv_format!(options, **)
      headers = Constants::POST_CSV_FORMAT_HEADER
      options[:csv_format] =  CSV.generate(headers:true) do |csv|
                              csv << headers
                            end
    end
  end
end
