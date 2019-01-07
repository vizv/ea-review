class PostsController < Sinatra::Base
  get '/posts' do
    # simple filter
    params['page'] ||= 1
    page = params['page'].to_i

    limit = 20
    curr = page < 1 ? 1 : page
    last = (Post.count - 1) / limit + 1
    last = 1 if last < 1
    offset = (curr - 1) * limit

    posts = Post.limit(limit, offset).all

    json(posts: posts.map(&:to_info_h), page: {curr: curr, last: last})
  end

  get '/post/:post_id' do
    post = Post[params['post_id'].to_i]
    halt 404, json(error: 'post not found') if post.nil?

    json(post.to_h)
  end
end
