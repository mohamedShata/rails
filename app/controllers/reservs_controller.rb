class ReservsController < ApplicationController
  # GET /reservs
  # GET /reservs.json
  def index
    @reservs = Reserv.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reservs }
    end
  end

  # GET /reservs/1
  # GET /reservs/1.json
  def show
    @reserv = Reserv.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @reserv }
    end
  end

  # GET /reservs/new
  # GET /reservs/new.json
  def new
    @reserv = Reserv.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @reserv }
    end
  end

  # GET /reservs/1/edit
  def edit
    @reserv = Reserv.find(params[:id])
  end

  # POST /reservs
  # POST /reservs.json
  def create
    @reserv = Reserv.new(params[:reserv])

    respond_to do |format|
      if @reserv.save
        format.html { redirect_to @reserv, notice: 'Reserv was successfully created.' }
        format.json { render json: @reserv, status: :created, location: @reserv }
      else
        format.html { render action: "new" }
        format.json { render json: @reserv.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /reservs/1
  # PUT /reservs/1.json
  def update
    @reserv = Reserv.find(params[:id])

    respond_to do |format|
      if @reserv.update_attributes(params[:reserv])
        format.html { redirect_to @reserv, notice: 'Reserv was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @reserv.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservs/1
  # DELETE /reservs/1.json
  def destroy
    @reserv = Reserv.find(params[:id])
    @reserv.destroy

    respond_to do |format|
      format.html { redirect_to reservs_url }
      format.json { head :no_content }
    end
  end

	def reserv

		data={"user_id"=>1,
			"room_id"=>params[:roomid],
			"checkin"=>$checkin,
			"checkout"=>$checkout
		}

	  @reserv = Reserv.new(data)

		respond_to do |format|
      if @reserv.save
        format.html { render json: @reserv, notice: 'Reserv was successfully.' }
      else
				format.json { render json: @reserv.errors, status: :unprocessable_entity }
      end
    end
	end
end
