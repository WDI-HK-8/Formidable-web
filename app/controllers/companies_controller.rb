class CompaniesController < ApplicationController
  def create
    code = String.random_alphanumeric(8) 
    while Company.where(code: code).length != 0
      code = String.random_alphanumeric(8)
    end
    @company = Company.create(name: params[:company][:name], code: code)
  end

  def show
    @company = Company.find(params[:id])
  end

  def update
    code = String.random_alphanumeric(8) 
    while Company.where(code: code).length != 0
      code = String.random_alphanumeric(8)
    end
    @company = Company.find(params[:id])
    if @company.nil?
      render json: {message: "Cannot find company"}, status: :not_found
    else
      if @company.update(code: code)
        render 'show'
      else
        render json: {updated: false}, status: :bad_request
      end
    end
  end

  def destroy
    @company = Company.find(params[:id])
    if @company.nil?
      render json: {message: "Cannot find company"}, status: :not_found
    else
      if @company.destroy
        render json: {deleted: true}
      else
        render json: {deleted: false}, status: :bad_request
      end
    end
  end

  private

  def String.random_alphanumeric(size=16)
    chars = ('a'..'z').to_a + ('A'..'Z').to_a
    (0...size).collect { chars[Kernel.rand(chars.length)] }.join
  end
end
