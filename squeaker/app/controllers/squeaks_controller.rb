#controllers are always plural
class SqueaksController < ApplicationController
  # more detailed notes are on notes.md on W6D3

  before_action :ensure_logged_in

  def index #name of action
    @squeaks = Squeak.all.includes(:author)

    # render json: @squeaks 
    # render :tester
    render :index # rails knows to go to squeaks folder in views and then index.html.erb
    #passing argument of hash key json pointing to squeaks to render
  end

  def show
    #get /squeaks/:id
    # debugger #you will see this in your SERVER LOG
    
    @squeak = Squeak.find(params[:id])

    # render json: @squeak
    render :show

    # why do we make instance var here?
    # - instance vars are accessible by views 

    # What is params?
    # hashlike objects of ActionController::Parameters

  end

  def new # individual req-res cycle, submitting this form starts create req-res cycle
    @squeak = Squeak.new # this is empty, action will send over to create
    render :new
  end

  def create
    # POST   /squeaks(.:format) squeaks#create 
     #post cannot be done on the browser
    #  debugger
    # @squeak = Squeak.new(body: params[:body], author_id: params[:author_id])
    #this is dangerous
    # allowing client to manipulate the data
    # you want to whitelist specific attributes to be allowed to users
    @squeak = Squeak.new(squeak_params)
    if @squeak.save # save(boolean) vs save!(error) 
      # render json: @squeak
      # redirect_to 'https://www.youtube.com/watch?v=hrQdi7UGjvU'
      # can only redirect to show page if we have an id b/c it requires a wildcard id
      redirect_to squeak_url(@squeak)
      # redirect_to :show doesnt work!
    else
      flash.now[:errors] = @squeak.errors.full_messages
      render :new, status: 422

      # render json: @squeak.errors.full_messages, status: 422 #bad data
      #how we get errors on failing the validations 
    end
  end

  def destroy
    squeak = Squeak.find(params[:id])
    squeak.destroy
    redirect_to squeaks_url
    #squeaks_url: url helper method
    # prefix will produce path to url by putting url after prefix, which becomes the url helpter method. This url helper emtho


  end

  def edit # similar to new
    @squeak = Squeak.find(params[:id])
    render :edit
  end

  def update
    @squeak = Squeak.find(params[:id])
    if @squeak.update(squeak_params)
      redirect_to squeak_url(@squeak.id) # or squeak_url(id) coz rails is smart
    else
      render json: @squeak.errors.full_messages, status: 422
    end
  end

  # strong params (params with security)
  def squeak_params
    # {controller=>"squeaks", action=>"create", id=>3, squeak=>{body=>"this is the body", author_id=>7}}
    params.require(:squeak).permit(:body, :author_id)#with authentification, you wouldn't put author_id here
    # what this means:
    # top level of key in the hash, pointing to antoher hash of key of body and author_id pointing to corresponding values
    # params:
    # <ActionController::Parameters {"squeak"=>{"body"=>"I am a squeak", "author_id"=>"1"}, "controller"=>"squeaks", "action"=>"create"} permitted: false>
    # squeak_params:
    # <ActionController::Parameters {"body"=>"I am a squeak", "author_id"=>"1"} permitted: true>
    # 
  end

# flash = one req/res cycle +1
  # def set_cookie
  #   # debugger

  #   flash[:errors] = ["this is a error"]
    
  #   session[:my_session_cookie] = "this is my session cookie"

  #   cookies[:my_cookie] = "this is the cookie Patrick set"
  #   render plain: "I am setting your cookie #{cookies[:my_cookie]}"
  # end

  # def get_cookie
  #   # debugger

  #   # flash.now[:errors] = ["this is a error"]

  #   my_cookie = cookies[:my_cookie]
  #   if my_cookie 
  #     # render plain: "here is your cookie #{my_cookie}"
  #     render :get_cookie
  #   else
  #     render plain: "you have not set my cookie yet"
  #   end
  # end
  
end