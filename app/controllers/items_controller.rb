class ItemsController < ApplicationController
  before_action :find_item, only: [:show, :edit, :update, :destroy, :complete]


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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render 'edit' #falls nicht bleibe auf dieser Seite, damit die Daten nicht verloren gehen
    end
  end

  def destroy #um einen datensatz zu löschen
    @item.destroy
    redirect_to root_path
  end

def complete
  @item.update_attribute(:completed_at, Time.now)
  redirect_to root_path # damit die Seite neu geladen wird
end



  private

  def item_params #das ist notwendig, damit die Daten auch in der Datenbank gespeichert werden können
    params.require(:item).permit(:title, :description)
  end

  def find_item
    @item = Item.find(params[:id])
  end

end
