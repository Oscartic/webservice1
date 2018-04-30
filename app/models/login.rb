class Login
  include ActiveModel::Model
  attr_accessor :mail, :image
  validates_presence_of :mail, :image, presence: true

  def self.image_capture(uploaded_io)
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end
    read_img = open("./public/uploads/#{uploaded_io.original_filename}") {|f| f.read}
    file_contents = Base64.strict_encode64(read_img)
    file_contents
  end
end