class PeopleController < ApplicationController

    # before_action :set_authentication

    require 'rest-client'
    EMAIL = "sid@gmail.com"
    PASSWORD = "123456"
    API_BASE_URL = "http://localhost:3000"

    def index
        url_u = "#{API_BASE_URL}/people.json"
        rest_cli = RestClient::Resource.new(url_u)
        people = rest_cli.get
        @people = JSON.parse(people, :symbolize_names => true)
    end

    def new 
        
    end

    def create
        url = "#{API_BASE_URL}/people"
        payload = params.to_json
        rest_cli = RestClient::Resource.new(url)
        begin
            rest_cli.post payload, :content_type => "application/json"
             flash[:notice] = "Person is created "
            redirect_to people_path
         rescue Exception => e
             flash[:notice] = "Person is not created"

             render :new 
        end
    end

    def edit
        url = "#{API_BASE_URL}/people/#{params[:id]}.json"
        rest_cli = RestClient::Resource.new(url)
        people = rest_cli.get
        @people = JSON.parse(people, :symbolize_names => true)

    end

    def update
        url = "#{API_BASE_URL}/people/#params[:id].json"
        payload = params.to_json
        rest_cli = RestClient::Resource.new(url)
        begin
            rest_cli.put payload, :content_type => "aplication/json" 
            flash[:notice] = "User Updated successfully"
        rescue Exception => e
            flash[:error] = "User Failed to Update"
        end
        redirect_to people_path


    end

    def destroy
        # @people  = People.find(params[:id])
        # puts "1111111111111"
        uri = "#{API_BASE_URL}/people/#{params[:id]}"
        # puts "ccccccccccc"
        rest_cli = RestClient::Resource.new(uri)
        begin
            rest_cli.delete
            # puts "xxxxxxxxxxxxxxxxxxxxx"
            flash[:notice] = "Person Deleted successfully"
        rescue Exception => e
            flash[:error] = "Person Failed to Delete"
        end
        redirect_to people_path
    end

    # def set_authentication

    #     url = "#{API_BASE_URL}/auth/index"
    #     payload = params.to_json
    #     # rest_cli = RestClient::Resource.new(url, EMAIL, PASSWORD)
        
    #     rest_cli = RestClient::Resource.new(url)
    #     @user = rest_cli.post payload, :content_type => "application/json"
    #     render json: @user
    #     # begin
           
    #     #     @people = rest_cli.post payload, :content_type => "application/json"
    #     #     render json: @people
    #     #     flash[:notice] = "login successfully"
    #     # rescue Exception => e
    #     #     puts "ssssssssss"
    #     #     flash[:error] set_authentication= "Error"
    #     # end
    #     # people = rest_cli.get
    #     # @people = JSON.parse(people, :symbolize_names => true)
    # end

end
