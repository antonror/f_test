module BooksHelper

  def image_for(book)
    if book.image_file_name.blank?
      image_tag('placeholder.png')
    else
      link_to image_tag(book.image.url(:med)), book.image.url
    end
  end

  def format_average_stars(book)
    average = number_with_precision(book.average_stars, precision: 1)
    if average
      pluralize(average, 'star')
    else
      content_tag(:span, 'No reviews', { class: 'text-muted' })
    end
  end
end
