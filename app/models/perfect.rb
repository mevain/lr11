class Perfect < ApplicationRecord
    validates :input, presence: {
        message: 'Введите непустой массив'
    }

    validates :input, format: {
        with: /\A[0-9\-\s]+\z/,
        message: 'Ошибка: разрешены только цифры'
    }

    before_create :set_params

  def calc
    @result = @array.split(' ').select do |i|
      (1..(i.to_i / 2)).to_a.select do |j|
        (i.to_i % j).zero?
      end.sum.eql? i.to_i
    end
    @indexs = @result.map { |i| @array.split(' ').index(i) }
    @cuts = Array.new
    @cuts[0] = []
    @cuts[0][0] = @result[0]
    ind = 0
    1.upto(@result.size - 1) do |i|
      if @indexs[i] != @indexs[i - 1] + 1
        ind += 1
        @cuts[ind] = []
      end
      @cuts[ind].append(@result[i])
    end
    if @result.size == 0 then
        @cuts = 'Нет таких отрезков'
    end
    @cuts
  end


  def set_params
    @array = input
    self.cuts = encode_output
  end

  def decode_array
    ActiveSupport::JSON.decode(cuts)
  end

  def encode_output
    ActiveSupport::JSON.encode(calc)
  end
end
