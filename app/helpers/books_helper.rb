module BooksHelper

  def image_for(book)
    if book.image_file_name.blank?
      image_tag('placeholder.png')
    else
      link_to image_tag(book.image.url(:med)), book.image.url
    end
  end
end
