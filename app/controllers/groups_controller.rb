class GroupsController < ApplicationController
  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @groups }
    end
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    @group = Group.find(params[:id])
    @units = Unit.all
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @group }
    end
  end

  def join
    @group = Group.find(params[:id])
    @unit = Unit.find(params[:format])
    
    unless @group.unit?(@unit.id)
      @collection = Collection.new("group_id" => @group.id, "unit_id" => @unit.id)
      @collection.save
    else
      @collection = Collection.find(@group.unit?(@unit.id))
      @collection.destroy
    end
    redirect_to @group
  end
  
  def toggle
    @group = Group.find(params[:id])
    if @group[:is_in]
      if all_in?
        logout()
        respond_to do |format|
          format.html
          format.json { render json: @group }
        end
      else
        respond_to do |format|
            format.html { redirect_to @group, notice: 'One or more units in this group is still out. Can\'t log out group.' }
            format.json { head :ok }
        end
      end
      
    else  #login
      login()
      redirect_to @group
    end
  end

  # GET /groups/new
  # GET /groups/new.json
  def new
    @group = Group.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @group }
    end
  end

  # GET /groups/1/edit
  def edit
    @group = Group.find(params[:id])
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(params[:group])

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render json: @group, status: :created, location: @group }
      else
        format.html { render action: "new" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /groups/1
  # PUT /groups/1.json
  def update
    @group = Group.find(params[:id])

    respond_to do |format|
      if @group.update_attributes(params[:group])
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    respond_to do |format|
      format.html { redirect_to groups_url }
      format.json { head :ok }
    end
  end
private
  def all_in?
    @group.units.each do |unit|
      unless unit[:is_in]
        return false
      end
    end
    return true
  end

  def logout
    @group.units.each do |unit|
      unit[:is_in] = false
      unit[:remarks] = "logged out with group: " + @group.name
      unit.save
    end
    @group[:is_in] = false
    @group.save
  end
  def login
    @group.units.each do |unit|
      unit[:is_in] = true
      unit.save
    end
    @group[:is_in] = true
    @group.save
  end
end
