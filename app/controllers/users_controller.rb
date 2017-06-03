class UsersController < ApplicationController
    
    
    
    def my_friends
        @friendships = current_user.friends
    end 
    
    def search
       @users = User.search(params[:search_param])
       
       if @users
         @users = current_user.except_current_user(@users)
         render partial: "friends/lookup"
       else
         render status: :not_found, nothing: true
       end
    end
   
   def add_friend
      @friend = User.find(params[:friend])
                                    #friend_id: refers to the column in the database friendships
      current_user.friendships.build(friend_id: @friend.id)
            
            if current_user.save
                  redirect_to my_friends_path, notice: "Friend was succesfully added"
            else
               redirect_to my_friends_path, flash[:error] = "There was an error adding friend"
            end
   end 
   
   
   
end