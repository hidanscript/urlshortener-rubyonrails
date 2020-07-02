class UrlsController < ApplicationController
  before_action :set_url, only: [:update, :destroy]

  # GET /urls
  def index
    @urls = Url.all

    render json: @urls
  end

  # GET /urls/1
  @override
  def show
    url = Url.where(key: params['id'])
    url = url == [] ? nil : url #If there is no record with the provided key, returns nil
    
    if(url)
      destiny_url = url[0]['destiny']
      redirect_to destiny_url
    else
      render json: { error: true, message: 'Invalid url key' }, status: :unprocessable_entity
    end
  end

  # POST /urls
  def create
    destiny_url = url_params['destiny']
    key = SecureRandom.hex(5)

    url = Url.new({ key: key, destiny: destiny_url})
    final_path = request.protocol + request.host_with_port + '/' + url['key']

    if url.save
      render json: { url: url, url: final_path}, status: :created, location: url
    else
      render json: url.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /urls/1
  def update
    if @url.update(url_params)
      render json: @url
    else
      render json: @url.errors, status: :unprocessable_entity
    end
  end

  # DELETE /urls/1
  def destroy
    @url.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_url
      @url = Url.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def url_params
      params.require(:url).permit(:key, :destiny)
    end
end
