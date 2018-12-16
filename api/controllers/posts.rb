class PostsController < Sinatra::Base
  get '/posts' do
    json([
      {
        id: 1,
        title: 'Vivamus dictum dui suscipit dui euismod commodo a sit metus',
        author: {
          id: 1,
          name: 'Sed Viverra'
        },
        comments_count: 2
      },
      {
        id: 2,
        title: 'Duis ac ipsum ullamcorper bibendum sed',
        author: {
          id: 2,
          name: 'Aenean Viverra'
        },
        comments_count: 0
      },
      {
        id: 3,
        title: 'Vivamus elementum nunc sed ultricies turpis duis',
        author: {
          id: 3,
          name: 'Aenean Nisi'
        },
        comments_count: 1
      }
    ])
  end

  get '/post/:post_id' do
    json(Post[params['post_id'].to_i].to_h)
  end
end
