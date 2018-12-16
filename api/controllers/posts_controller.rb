module EAReviewApp
  class PostsController < Sinatra::Base
    get '/post/:post_id' do
      json({
        id: params['post_id'].to_i,
        title: 'Vivamus dictum dui suscipit dui euismod commodo a sit metus',
        content: 'Sed aliquet velit vel ornare ullamcorper. Sed eu ipsum ipsum. Vestibulum massa est, lobortis a consectetur id, viverra non eros. Phasellus placerat ante ut nunc ullamcorper, ac gravida felis auctor. Mauris hendrerit consectetur velit et malesuada. Nullam vitae maximus ex. Nulla interdum, mi ut tempus gravida, lacus sem rhoncus nisi, ac porttitor purus lectus ullamcorper orci. Aenean vulputate elementum mi, eget viverra ante condimentum at. Donec et enim quis dui accumsan cursus. Sed quis velit quis risus euismod tempor. Sed dapibus accumsan urna non ultricies. Nunc nec nunc quis justo venenatis rhoncus.
  Integer aliquam nulla eu sapien efficitur, sed finibus nunc lobortis. Nam in nisl risus. Sed facilisis tellus justo, id aliquam erat venenatis sed. Curabitur mattis luctus diam vitae ultricies. Quisque condimentum varius diam tempus elementum. Pellentesque posuere odio eu nisi condimentum, id porttitor metus fringilla. Vestibulum posuere at mi nec malesuada.
  Cras ante mi, pretium vel aliquet vitae, euismod id nisi. Aliquam vel tempor urna. Maecenas vitae viverra ante. Fusce sit amet augue vitae odio gravida euismod eu sed ante. Pellentesque scelerisque aliquam tortor eget imperdiet. Nulla facilisi. Aliquam dictum eget lectus vitae imperdiet.
  Vestibulum quis euismod lectus, at mollis ligula. Cras eu faucibus sapien, sed condimentum mauris. Proin sed nibh at arcu scelerisque elementum. Sed tempus bibendum posuere. Ut id enim non magna fermentum tincidunt fringilla ut est. Pellentesque ipsum diam, maximus at varius quis, auctor quis tortor. Etiam sed turpis sed nisi interdum ultrices. Donec nec bibendum lorem. Nunc vestibulum scelerisque hendrerit. Fusce non massa urna. Nunc porttitor commodo laoreet.
  Suspendisse sed diam viverra nulla pretium mollis. Nulla facilisi. Duis pharetra ante est, nec tincidunt justo fermentum eu. Aliquam vulputate nisl in molestie vulputate. Vivamus laoreet neque dictum, scelerisque est in, pretium urna. Pellentesque nisl eros, vehicula vitae velit non, luctus ultricies sapien. Cras feugiat dui lectus, vitae sollicitudin justo posuere nec. Aenean a urna non lorem laoreet laoreet. Maecenas pretium interdum sollicitudin. Duis cursus, ligula hendrerit elementum cursus, nibh magna posuere elit, et viverra turpis odio quis leo. Vestibulum eros enim, sollicitudin at massa sed, iaculis vehicula mi. Curabitur interdum, augue in semper vulputate, metus urna mollis turpis, eu varius massa enim a nisl. Vestibulum et elit at enim varius ornare gravida faucibus quam. In eu congue lectus. Fusce porta eros eu mauris faucibus, imperdiet vestibulum metus pretium.
  Phasellus pretium efficitur nibh eu fringilla. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Phasellus lacus dolor, blandit ut orci eget, aliquam auctor lacus. Aliquam vitae commodo lorem. In aliquam lobortis turpis, vitae viverra diam consectetur non. Fusce vitae facilisis mauris, a aliquet ante. In sit amet ullamcorper velit. Aenean nec quam varius, vulputate lacus vitae, sollicitudin turpis. Nam sollicitudin sagittis diam a fringilla.',
        author: {
          id: 1,
          name: 'Sed Viverra'
        },
        comments: [
          {
            id: 1,
            content: 'Vestibulum eget lacus amet. ',
            author: {
              id: 2,
              name: 'Aenean Viverra'
            }
          },
          {
            id: 2,
            content: 'Nam sollicitudin erat vel congue dictum. Vestibulum hendrerit nunc ac est pharetra, et ullamcorper magna volutpat. Cras pulvinar interdum tellus, nec faucibus nisi congue vitae. Morbi eget libero molestie, cursus nibh a, faucibus lectus. Mauris leo dui, pulvinar sed diam in, maximus sagittis orci. Aliquam tincidunt mi id maximus ullamcorper.
  Phasellus cursus malesuada neque, eu congue eros convallis ut.',
            author: {
              id: 1,
              name: 'Sed Viverra'
            }
          }
        ]
      })
    end
  end
end
