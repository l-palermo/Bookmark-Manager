class Comment

  def self.create(comment, bookmark_id)
    result = Database.query("INSERT INTO comments (text, bookmark_id) VALUES ('#{comment}', '#{bookmark_id}') RETURNING id, text, bookmark_id;")
    Comment.new(result[0]['id'], result[0]['text'], result[0]['bookmark_id'])
  end

  attr_reader :id, :text, :bookmark_id

  def initialize
    @id = id
    @text = text
    @bookmark_id = bookmark_id
  end
end