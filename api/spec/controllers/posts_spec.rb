describe PostsController do
  before(:each) do
    DB[:users].truncate
    DB[:posts].truncate
    DB[:comments].truncate
  end

  it 'should list empty posts list' do
    get '/posts'
    expect(last_response).to be_ok
    expect(last_response.status).to eq(200)
    expect(JSON.parse(last_response.body)).to eq({
      'posts' => [],
      'page' => {
        'curr' => 1,
        'last' => 1
      }
    })
  end

  it 'should report page not found' do
    get '/post/1'
    expect(last_response).not_to be_ok
    expect(last_response.status).to eq(404)
    expect(JSON.parse(last_response.body)).to eq({'error' => 'post not found'})
  end

  it 'should report page not found' do
    author = User.new name: 'FAKE_NAME'
    author.save
    post = Post.new title: 'FAKE_TITLE', content: 'FAKE_CONTENT', author: author
    post.save

    get '/post/1'
    expect(last_response).to be_ok
    expect(last_response.status).to eq(200)
    expect(JSON.parse(last_response.body)).to eq({
      'id' => 1,
      'title' => 'FAKE_TITLE',
      'content' => 'FAKE_CONTENT',
      'author'  =>  {
        'id' => 1,
        'name' => 'FAKE_NAME'
      },
      'comments' => []
    })
  end
end
