require_relative '../../app/models/user'

describe User do
  it 'should have many posts' do
    expect(User.association_reflections).to have_key(:posts)
    expect(User.association_reflections[:posts][:type]).to eq(:one_to_many)
  end

  it 'should have many comments' do
    expect(User.association_reflections).to have_key(:comments)
    expect(User.association_reflections[:comments][:type]).to equal(:one_to_many)
  end

  it 'can be serialized' do
    user = User.new name: 'FAKE_NAME'
    user.id = 0

    expect(user.to_h).to eq(id: 0, name: 'FAKE_NAME')
  end
end
