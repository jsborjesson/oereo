class ChangeAgreementToStringInLicenses < ActiveRecord::Migration
  def change
    # reference documentation instead of supplying it
    change_column :licenses, :agreement, :string
    rename_column :licenses, :agreement, :agreement_url
  end
end
