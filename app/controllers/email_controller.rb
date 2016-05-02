require 'mailgun'

class EmailController < ApplicationController
    def index
    end
    
    def write
        @apple = params[:title]
        @airplane = params[:content]
        @cherry = params[:email2]   
        
        new_post = Post.new
        new_post.title = @apple
        new_post.content = @airplane
        new_post.save 
    
        
        redirect_to "/list"
        
        mg_client = Mailgun::Client.new("key-04aa9adcf015d9a729fb8a4b5dd36a4f")

        message_params =  {
                   from: 'yoonisus@yoonseo.net',
                   to:   @cherry,
                   subject: @apple,
                   text:   @airplane
                  }

        result = mg_client.send_message('sandbox70e0d65ce89a45ada11bc72d065d8e73.mailgun.org', message_params).to_h!

        message_id = result['id']
        message = result['message']
        
    end
    def list
        @every_post = Post.all.order("id desc")
    end
    
    def update_view
        @one_post = Post.find(params[:post_id])
        
    end
    
    def siljae
        @one_post = Post.find(params[:post_id])
        @one_post.title = params[:title]
        @one_post.content = params[:content]
        @one_post.save
        
        redirect_to "/list"
    end
    
    def destroy
        @one_post = Post.find(params[:post_id])
        @one_post.destroy
        
        redirect_to "/list"
    end
    
end
