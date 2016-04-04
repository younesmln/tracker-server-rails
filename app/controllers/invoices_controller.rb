class InvoicesController < ApplicationController
  before_action :load_client
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]

  # GET /invoices
  # GET /invoices.json
  def index
    @invoices = @client.invoices
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
  end

  # GET /invoices/1/edit
  def edit
  end

  # POST /invoices
  # POST /invoices.json
  def create
    render nothing: nil and return unless params[:client_id].present?
    @invoice = Invoice.new(invoice_params)
    @client.invoices << @invoice
    respond_to do |format|
      if @invoice.save
        format.html { redirect_to client_invoices_url(@client, @invoice), notice: 'Invoice was successfully created.' }
        format.json { render :show, status: :created, location: client_invoices_url(@client, @invoice) }
      else
        format.html { render :new }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoices/1
  # PATCH/PUT /invoices/1.json
  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to client_invoice_url(@client,@invoice), notice: 'Invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: client_invoices_url(@client, @invoice) }
      else
        format.html { render :edit }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to client_invoices_url(@client), notice: 'Invoice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = @client.invoices.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_params
      params.require(:invoice).permit(:total, :remaining, products: [:product_id, :label, :count])
    end

  def load_client
    @client = Client.find(params[:client_id])
  end
end
