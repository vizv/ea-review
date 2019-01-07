describe Post do
  before(:context) do
    @author = User.new name: 'FAKE_NAME'
    @author.id = 0

    @author1 = User.new name: 'FAKE_NAME_1'
    @author1.id = 1

    @author2 = User.new name: 'FAKE_NAME_2'
    @author2.id = 2

    @comment1 = Comment.new content: 'FAKE_CONTENT_1', author: @author1
    @comment1.id = 0

    @comment2 = Comment.new content: 'FAKE_CONTENT_2', author: @author2
    @comment2.id = 1

    @post = Post.new(
      title: 'FAKE_TITLE',
      content: 'FAKE_CONTENT',
      author: @author,
    )
    @post.id = 0
    @post.comments << @comment1
    @post.comments << @comment2
  end

  it 'should have many comments' do
    expect(Post.association_reflections).to have_key(:comments)
    expect(Post.association_reflections[:comments][:type]).to equal(:one_to_many)
  end

  it 'should belong to one author' do
    expect(Post.association_reflections).to have_key(:author)
    expect(Post.association_reflections[:author][:type]).to eq(:many_to_one)
  end

  it 'can be serialized' do
    expect(@post.to_h).to eq(
      id: 0,
      title: 'FAKE_TITLE',
      content: 'FAKE_CONTENT',
      author: {id: 0, name: 'FAKE_NAME'},
      comments: [
        {id: 0, content: 'FAKE_CONTENT_1', author: {id: 1, name: 'FAKE_NAME_1'}},
        {id: 1, content: 'FAKE_CONTENT_2', author: {id: 2, name: 'FAKE_NAME_2'}}
      ]
    )
  end

  it 'can be serialized as info' do
    expect(@post.to_info_h).to eq(
      id: 0,
      title: 'FAKE_TITLE',
      author: {id: 0, name: 'FAKE_NAME'},
      comments_count: 2
    )
  end
end
