module Models
    class Review
       attr_reader :author_name, :rating, :title, :content, :version

       def initialize(args)
         @author_name = args['author']['name']['label']
         @rating = args['im:rating']['label'].to_f
         @title = args['title']['label']
         @content = args['content']['label']
         @version = args['im:version']['label']
       end

       def to_hash
         {
           author_name: @author_name,
           rating: @rating,
           title: @title,
           content: @content,
           version: @version
         }
       end
    end
end
