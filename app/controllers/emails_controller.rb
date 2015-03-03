class EmailsController < ApplicationController
  def create
    @email = Email.new(email_params)
    if @email.save
      render json:@email, :status=>200
    else
      render json:{message:'Create fail'}, :status=>500
    end
  end

  def index
    @emails = Email.all
    render json:@emails
  end

  def update
    @email = Email.find(params[:id])
    if @email.update(email_params)
      render json:@email, :status=>200
    else
      render json:{message: 'update fail'}, :status=>400
    end
  end

  private
  def email_params
    params.require(:email).permit(:name, :cline, :story_id, :story_url, :launch_date, :template_body, :body)
  end
end
