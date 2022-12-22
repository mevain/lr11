class PerfectsController < ApplicationController
        before_action :set_answer, only: %i[ show edit update destroy ]
    
        # GET /answers or /answers.json
        def index
            @perfects = Perfect.all
        end
    
        # GET /answers/1 or /answers/1.json
        def show
        end
    
        # GET /answers/new
        def new
            @perfect = Perfect.new
        end
    
        # GET /perfects/1/edit
        def edit
        end
    
        # POST /answers or /answers.json
        def create
            @perfect = Perfect.new(perfect_params)
    
            respond_to do |format|
                if @perfect.save
                    format.html { redirect_to perfect_url(@perfect), notice: "Answer was successfully created." }
                    format.json { render :show, status: :created, location: @perfect }
                else
                    format.html { render :new, status: :unprocessable_entity }
                    format.json { render json: @perfect.errors, status: :unprocessable_entity }
                end
            end
        end
    
        # PATCH/PUT /answers/1 or /answers/1.json
        def update
            respond_to do |format|
                if @perfect.update(perfect_params)
                    format.html { redirect_to perfect_url(@perfect), notice: "Answer was successfully updated." }
                    format.json { render :show, status: :ok, location: @perfect }
                else
                    format.html { render :edit, status: :unprocessable_entity }
                    format.json { render json: @perfect.errors, status: :unprocessable_entity }
                end
            end
        end
    
    # DELETE /answers/1 or /answers/1.json
        def destroy
        @perfect.destroy
    
        respond_to do |format|
        format.html { redirect_to perfects_url, notice: "Answer was successfully destroyed." }
        format.json { head :no_content }
        end
    end
    
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
    @perfect = Perfect.find(params[:id])
    end
    
    # Only allow a list of trusted parameters through.
    def perfect_params
    params.require(:perfect).permit(:input, :cuts)
    end
    end