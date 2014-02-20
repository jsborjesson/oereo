class Api::V1::LicensesController < Api::ApiController
  def index
    respond_with License.all
  end

  def show
    respond_with License.find(params[:id])
  end
end
