class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  def index
    @companies = Company.all
    
     respond_to do |format|
      format.html
      format.csv { render text: @companies.to_csv }
    end
  end
  

  def show
   # respond_with(@company)
  end

  def new
    @company = Company.new
    
  end

  def edit
  end

  def create
    @company = Company.new(company_params)
    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render action: 'show', status: :created, location: @company }
      else
        format.html { render action: 'new' }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @company.update(company_params)
    respond_with(@company)
  end

  def destroy
    @company.destroy
    respond_with(@company)
  end

  def import
    Company.import(params[:file])
    redirect_to companies_path, notice: "Companies Added Successfully"
  end
  
  private
    def set_company
      @company = Company.find(params[:id])
    end

    def company_params
      params.require(:company).permit(:name, :manager, :status, :terms)
    end
end
