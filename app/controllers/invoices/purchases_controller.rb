class Invoices::PurchasesController < ApplicationController

  def index
    @purchases = Purchase.all
  end

  def show
  end

  def new
    @invoice = Invoice.find(params[:invoice_id])
    @purchase = Purchase.new
  end

  def edit
  end

 def create
   @invoice = Invoice.find(params[:invoice_id])
   @purchase = Purchase.new(purchase_params)
   @purchase.invoice = @invoice

    respond_to do |format|
      if @purchase.save
        format.html { redirect_to @invoice, notice: 'Purchase was successfully created.' }
        format.json { render action: 'show', status: :created, location: @invoice }
      else
        format.html { render action: 'new' }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @purchase.update(purchase_params)
        format.html { redirect_to @purchase, notice: 'Purchase was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

 def destroy
   @invoice = Invoice.find(params[:invoice_id])
   @purchase = Purchase.find(params[:id])
   title = @purchase.name
   
   if @purchase.destroy
     flash[:notice] = "\"#{title}\" was deleted successfully."
     redirect_to @invoice
   else
     flash[:error] = "There was an error deleting the purchase."
     render :show
   end
 end

  private
    def set_purchase
      @purchase = Purchase.find(params[:id])
    end

    def purchase_params
      params.require(:purchase).permit(:name, :category, :quantity, :invoice_id, :price)
    end
end
