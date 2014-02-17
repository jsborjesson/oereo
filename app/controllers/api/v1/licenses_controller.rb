class Api::V1::LicensesController < Api::ApiController
  def index
    respond_with License.all
  end

  def show
    respond_with License.find(params[:id])
  end

  def create
    respond_with License.create(params[:user])
  end

  def update
    respond_with License.update(params[:id], params[:user])
  end

  def destroy
    respond_with License.destroy(params[:id])
  end
end
