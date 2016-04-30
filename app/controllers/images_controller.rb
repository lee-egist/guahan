class ImagesController < ApplicationController


  def new
    @image = Image.new
  end

  def create
    s3 = Aws::S3::Resource.new(
    credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY'])
    )

    user = User.first
    file = params[:image][:image]
    mybucket = s3.bucket('eg84-projects').object(file.original_filename)
    mybucket.upload_file(file.tempfile, acl:'public-read')

    # create an object for the image
    image = Image.create(user_id: user.id, word_id: word.id, image_url: mybucket.public_url)

    # save the image
    if image.save
      word.images << image
      redirect_to word_path(word), success: 'File successfully uploaded'
    else
      flash.now[:notice] = 'There was an error'
      render :new
    end
  end

  private

end
