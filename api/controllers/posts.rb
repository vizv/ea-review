class PostsController < Sinatra::Base
  get '/posts' do
    # FIXME: handle error
    json(Post.all.map(&:to_info_h))
  end

  get '/post/:post_id' do
    # FIXME: handle error
    json(Post[params['post_id'].to_i].to_h)
  end
end
