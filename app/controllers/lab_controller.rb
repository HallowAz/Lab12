# frozen_string_literal: true

# Controller for main logic
class LabController < ApplicationController
  include LabHelper
  before_action :check_params, only: :show

  def input; end

  def show
    @res = if params[:numb] == ''
             0
           else
             LabHelper.palin([params[:numb]])
           end
  end

  private

  def check_params
    # logic for check for digits
    msg = if params[:numb].nil?
            'Nil class'
          elsif params[:numb].match?(/\D/)
            'Были введены не только цифры'
          end

    redirect_to root_path, notice: msg if msg
  end
end
