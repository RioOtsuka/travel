class TweetsController < ApplicationController
    before_action :authenticate_user!, only: [:index, :show, :new, :create]

    
    def index
        if params[:search] != nil && params[:search] != ''
            
            search = params[:search]
            @tweets = Tweet.joins(:user).where("spot LIKE ? OR name LIKE ?", "%#{search}%", "%#{search}%").page(params[:page]).per(3)
          else
            @tweets = Tweet.all.page(params[:page]).per(3)
          end
    end

    def new
        @tweet = Tweet.new

    end

    def create
        tweet = Tweet.new(tweet_params)
        tweet.user_id = current_user.id
         if tweet.save
            redirect_to :action => "index"
         else
            redirect_to :action => "new"
         end
    end

    def show
        @tweet = Tweet.find(params[:id])
        @comments = @tweet.comments
        @comment = Comment.new
    end

    def edit
        @tweet = Tweet.find(params[:id])
    end

    def update
        tweet = Tweet.find(params[:id])
        if tweet.update(tweet_params)
            redirect_to :action => "show", :id => tweet.id
        else
            redirect_to :action => "new"
        end
    end

    def destroy
        tweet = Tweet.find(params[:id])
        tweet.destroy
        redirect_to action: :index
    end

    private
    def tweet_params
      params.require(:tweet).permit(:score, :image, :spot, :body, :address)
    end

end
