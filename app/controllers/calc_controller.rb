class CalcController < ApplicationController
  before_action :set_params, only: [:output]
  before_action :check, only: [:output]
  def input; end

  def output
    if @out.nil?
      @arr.save!
      @arr = @arr.decode_array
      @msg = 'Загружено в базу данных'
    else
      @arr = @out.decode_array
      @msg = 'Загружено из базы данных'
    end
  end

  private

  def set_params
    @out = Perfect.find_by(input: params[:array])
    @msg = ''
    @arr = Perfect.new(input: params[:array])
  end

  def check
    return if @arr.valid?
    redirect_to root_path, notice: @arr.errors.objects.map(&:message).first
  end
end
