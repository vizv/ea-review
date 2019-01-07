describe Comment do
  before(:context) do
    @post = Post.new
    @post.id = 0

    @author = User.new name: 'FAKE_NAME'
    @author.id = 1

    @comment = Comment.new content: 'FAKE_CONTENT', post: @post, author: @author
    @comment.id = 2
  end

  it 'should belong to one post' do
    expect(Comment.association_reflections).to have_key(:post)
    expect(Comment.association_reflections[:post][:type]).to eq(:many_to_one)
  end

  it 'should belong to one author' do
    expect(Comment.association_reflections).to have_key(:author)
    expect(Comment.association_reflections[:author][:type]).to eq(:many_to_one)
  end

  it 'can be serialized' do
    expect(@comment.to_h).to eq(id: 2, content: 'FAKE_CONTENT', author: {id: 1, name: 'FAKE_NAME'})
  end
end
