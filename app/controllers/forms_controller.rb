class FormsController < ApplicationController
  def index
    @forms = current_user.forms.includes(:contents)
  end

  def create
    @form = current_user.forms.create(form_params)
  end

  def show
    @form = Form.find(params[:id]).includes(:contents)
  end

  def update
    @form = Form.find(params[:id])
    if @form.nil?
      render json: {message: "Cannot find form"}, status: :not_found
    else
      @form.update(form_params)
      render json: {updated: true}, status: :success
    end
  end

  def delete
    @form = Form.find(params[:id])
    if @form.nil?
      render json: {message: "Cannot find form"}, status: :not_found
    else
      @form.destroy
      render json: {deleted: true}, status: :success
    end
  end

  private

  def form_params
    params.require(:form).permit(:name)
  end
end
