class UnitsController < ApplicationController
  # GET /units
  # GET /units.json
  def index
    @item = Item.find(params[:id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @item }
    end
  end

  # GET /units/1
  # GET /units/1.json
  def show
    @unit = Unit.find(params[:id])
    @item = Item.find(@unit.item_id)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @unit }
    end
  end

  # GET /units/new
  # GET /units/new.json
  def new
    @unit = Unit.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @unit}
    end
  end

  # GET /units/1/edit
  def edit
    @unit = Unit.find(params[:id])
    @item = Item.find(@unit.item_id)
  end

  # POST /units
  # POST /units.json
  def create
    @item = Item.find(params[:item_id])
    @unit = @item.units.create(params[:unit])
    
    redirect_to item_path(@item)
  end

  # PUT /units/1
  # PUT /units/1.json
  def update
    @unit = Unit.find(params[:id])
    @item = Item.find(@unit.item_id)
    respond_to do |format|
      if @unit.update_attributes(params[:unit])
        format.html { redirect_to @item, notice: 'Unit was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @unit.errors, status: :unprocessable_entity }
      end
    end
  end

  def toggle
    @unit = Unit.find(params[:id])
    @item = Item.find(@unit.item_id)
    if @unit.in
      @unit[:in] = false
      respond_to do |format|
        format.html
        format.json { render json: @unit }
      end
    else
      @unit[:in] = true
      respond_to do |format|
        if @unit.save
          format.html { redirect_to @item, notice: 'Unit status was successfully updated.' }
          format.json { head :ok }
        else
          format.html { render action: "show" }
          format.json { render json: @unit.errors, status: :unprocessable_entity }
        end
      end
    end
  end
  # DELETE /units/1
  # DELETE /units/1.json
  def destroy
    @unit = Unit.find(params[:id])
    @unit.destroy

    respond_to do |format|
      format.html { redirect_to units_url }
      format.json { head :ok }
    end
  end
end
