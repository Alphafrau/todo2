class ItemsController < ApplicationController
  def index
    @items = Item.all.order("created_at DESC") #notwendig damit auf der index-seite auf die Items zugreifen können
  end

  def new
    @item = Item.new
  end


  def create
    @item = Item.new(item_params)
    if @item.save #wenn das neue Item gepeichert wird, dann gehe wieder auf die index(root_path)
      redirect_to root_path
    else
      render 'new' #falls nicht bleibe auf dieser Seite
    end
  end

  private

  def item_params #das ist notwendig, damit die Daten auch in der Datenbank gespeichert werden können
    params.require(:item).permit(:title, :description)
  end
end
