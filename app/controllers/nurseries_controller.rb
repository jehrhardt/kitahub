# frozen_string_literal: true
# Actions to show and filter nurseries in the registration process.
class NurseriesController < ApplicationController
  skip_before_action :require_login,
                     only: [:index, :results, :show]
  skip_before_action :require_admin,
                     only: [:index, :results, :show]

  def index
    @nurseries = Nursery.all
    @districts = Nursery.uniq.pluck(:district)
  end

  def show
    @nursery = Nursery.find_by url_name: params[:url_name]
  end

  def new
    @nursery = Nursery.new
    @nursery.address = Address.new('', '', '')
  end

  def create
    @nursery = Nursery.new(nursery_params)
    if @nursery.save
      redirect_to @nursery
    else
      render 'new'
    end
  end

  def edit
    @nursery = Nursery.find_by url_name: params[:url_name]
  end

  def update
    @nursery = Nursery.find_by url_name: params[:url_name]
    if @nursery.update(nursery_params)
      redirect_to @nursery
    else
      render 'edit'
    end
  end

  def destroy
    @nursery = Nursery.find_by url_name: params[:url_name]
    @nursery.destroy
    render 'delete_confirmation' if @nursery.destroy
  end

  def results
    @nurseries = Nursery.where(district: params[:district])
    render partial: 'results'
  end

  private

  def nursery_params
    address = params.require(:address)
    params.require(:nursery).permit!.merge(
      address_street: address[:street],
      address_zip: address[:zip],
      address_city: address[:city]
    )
  end
end
