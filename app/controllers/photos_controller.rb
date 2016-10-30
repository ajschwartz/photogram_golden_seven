class PhotosController < ApplicationController
  def index
    @list_of_photos = Photo.all
  end

  def show
    photo = Photo.find_by({ :id => params[:id]})

    @photo_source = photo.source
    @photo_caption = photo.caption
    @photo_id = photo.id
  end

  def new_form

  end

  def create_row
    p = Photo.new
    p.source = params[:the_source]
    p.caption = params[:the_caption]
    if p.source != nil && p.caption != nil
      p.save
    else
    end
    redirect_to("http://localhost:3000/photos")
  end

 def delete_row
   photo = Photo.find_by({ :id => params[:id]})
   photo.destroy
   redirect_to("http://localhost:3000/photos")
 end

 def edit_form
   photo = Photo.find_by({ :id => params[:id]})
   @photo_source = photo.source
   @photo_caption = photo.caption
   @photo_id = photo.id
 end

 def update_row

   photo = Photo.find_by({ :id => params[:id]})
   @photo_id = photo.id
   photo.source = params[:the_source]
   photo.caption = params[:the_caption]
   if photo.source != nil && photo.caption != nil
     photo.save
   else
   end
   redirect_to("http://localhost:3000/photos")
 end

end
