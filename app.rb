require_relative 'config/environment'

class App < Sinatra::Base

  # This is a sample dynamic route.
  get "/hello/:name" do
    @user_name = params[:name]
    "Hello #{@user_name}!"
  end

  # goodbye name
  get "/goodbye/:name" do
    @user_name = params[:name]
    "Goodbye #{@user_name}!"
  end

  #   Create a dynamic route at get '/reversename/:name' that
  #   accepts a name and renders the name backwards.

  #reverse name
  get "/reversename/:name" do
    @user_name = params[:name].reverse #reverse string of :name parameter
    "Goodbye #{@user_name}!"
  end

  #   Create a dynamic route at get '/square/:number' that
  #   accepts a number and returns the square of that number.
  #   Note: Remember that values in params always
  #   come in as strings, and your return value
  #  for the route should also be a string (use .to_i and .to_s).

  #square number
  get "/square/:number" do
    @number = params[:number].to_i #turn number string to i
    @square = @number * @number #square number
    "#{@square}"
  end

  #   Create a dynamic route at get '/say/:number/:phrase' that
  #   accepts a number and a phrase and returns
  #   that phrase in a string the number of times given.

  #say number and phrase
  get "/say/:number/:phrase" do
    @number = params[:number].to_i #turn number string to i
    @phrase = params[:phrase]
    "#{@phrase}\n" * @number
  end


  #   Create a dynamic route at
  #   get '/say/:word1/:word2/:word3/:word4/:word5' that
  #   accepts five words and returns a string with them
  #   formatted as a sentence.

  #say five words as a sentence
  get "/say/:word1/:word2/:word3/:word4/:word5" do
    @sentence = @params[:captures].join(" ")
    "#{@sentence}."
  end


  #   Create a dynamic route at
  #   get '/:operation/:number1/:number2' that accepts
  #   an operation (add, subtract, multiply or divide) and
  #   performs the operation on the two numbers provided.
  #   For example, going to /add/1/2 should render 3.

  #perform math on two numbers
  get "/:operation/:number1/:number2" do
    @operation = params[:operation] #add, subtract, multiply or divide
    @number1 = params[:number1].to_i #these are strings!
    @number2 = params[:number2].to_i #these are strings!
    #binding.pry
    if @operation == "add"
      "#{@number1 + @number2}"
    elsif @operation == "subtract"
      "#{@number1 - @number2}"
    elsif @operation == "multiply"
      "#{@number1 * @number2}"
    else @operation == "divide"
      "#{@number1 / @number2}"
    end #end if..else statment
  end

end #end class
