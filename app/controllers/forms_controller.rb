class FormsController < ApplicationController
  def index
    @forms = Form.where(company_id: params[:company_id])
  end

  def create
    @form = Company.find(params[:company_id]).forms.create(form_params)
  end

  def show
    
  end

  def update
    
  end

  def delete
    
  end

  private

  def form_params
    
  end
end
