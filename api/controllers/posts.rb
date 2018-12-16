class PostsController < Sinatra::Base
  get '/posts' do
    # FIXME: add pagination
    posts = Post.all

    json(posts: posts.map(&:to_info_h))
  end

  get '/post/:post_id' do
    post = Post[params['post_id'].to_i]
    halt 404, json(error: 'post not found') if post.nil?

    json(post.to_h)
  end
end
