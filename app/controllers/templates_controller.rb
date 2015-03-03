class TemplatesController < ApplicationController
  def index
    @templates = Template.all
    render json:@templates
  end
  def new
  end
  def create
    @email = Template.new(template_params)
    if @email.save
      render json:@email, :status=>200
    else
      render json:{message:'Create fail'}, :status=>500
    end
  end

  def update
    @templates = Template.find(params[:id])
    if @templates.update(template_params)
      render json:@templates, :status=>200
    else
      render json:{message: 'update fail'}, :status=>400
    end
  end

  private
  def template_params
    params.require(:template).permit(:name, :site, :body)
  end
end
