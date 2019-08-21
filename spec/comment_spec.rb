require 'comment'

RSpec.describe Comment do

  describe '#.create' do
    it 'creates a comment' do
      comment = Comment.create('this is a comment')

      expect(comment).to be_instance_of(Comment) 
      expect(comment.id).to eq comment.id
      expect(comment.text).to eq('this is a comment')
    end
  end
end