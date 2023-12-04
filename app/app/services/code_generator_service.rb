class CodeGeneratorService

  def initialize(object, options)
    @object = object
    @options = options
  end

  def call
    loop do
      code = generate_code
      @object.code = code
      break unless Item.exists?(code: @object.code)
    end
  end

  private

  def generate_code
    random_string = generate_random_string
    random_number = generate_random_number

    random_string.upcase + random_number
  end

  def generate_random_string
    SecureRandom.alphanumeric(@options[:letters])
  end

  def generate_random_number
    SecureRandom.random_number(10**@options[:numbers]).to_s.rjust(@options[:numbers], '0')
  end
end
