class EmailController < ApplicationController
    def index
        
    end
    def write
        @apple = params[:title]
        @airplane = params[:content]
        @cherry = params[:email2]
        
    end
end
