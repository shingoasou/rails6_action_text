class Post < ApplicationRecord
  has_rich_text :content

  validates :title, length: { maximum: 32 }, presence: true

  validate :validate_content_length

  MAX_CONTENT_LENGTH = 50

  def validate_content_length
    current_content_length = content.to_plain_text.length

    if current_content_length > MAX_CONTENT_LENGTH
      errors.add(
        :content,
        :too_long,
        max_content_length: MAX_CONTENT_LENGTH,
        current_content_length: current_content_length
      )
    end
  end
end
