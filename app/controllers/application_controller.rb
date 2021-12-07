require 'open-uri'
require 'ostruct'

class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def calculate(stock)
    before_price =  stock.array_stock[-2]
    current_price = stock.array_stock[-1]
    mms5_before = stock.array_stock[10..14].sum / 5
    mms5_current = stock.array_stock[11..15].sum / 5
    mms14_before = stock.array_stock[1..14].sum / 14
    mms14_current = stock.array_stock[2..15].sum / 14

    diff_stock_before = Array.new(14) { 0 }
    gain_stock_before = Array.new(14) { 0 }
    loss_stock_before = Array.new(14) { 0  }
    diff_stock_current = Array.new(14) { 0 }
    gain_stock_current = Array.new(14) { 0 }
    loss_stock_current = Array.new(14) { 0 }
    diff_stock_before.each_index do |i|
      diff_stock_before[i] = stock.array_stock[i + 1] - stock.array_stock[i]
      diff_stock_before[i].positive? ? gain_stock_before[i] = diff_stock_before[i] : gain_stock_before[i] = 0
      diff_stock_before[i].negative? ? loss_stock_before[i] = diff_stock_before[i].abs : loss_stock_before[i] = 0
      diff_stock_current[i + 1] = stock.array_stock[i + 2] - stock.array_stock[i + 1]
      diff_stock_current[i + 1].positive? ? gain_stock_current[i + 1] = diff_stock_current[i + 1] : gain_stock_current[i + 1] = 0
      diff_stock_current[i + 1].positive? ? loss_stock_current[i + 1] = diff_stock_current[i + 1].abs : loss_stock_current[i + 1] = 0
    end
    average_gain_before = gain_stock_before.sum / gain_stock_before.length
    average_loss_before = loss_stock_before.sum / loss_stock_before.length
    average_gain_current = gain_stock_current.sum / gain_stock_current.length
    average_loss_current = loss_stock_current.sum / loss_stock_current.length
    average_loss_before.zero? ? fr_before = 0 : fr_before = average_gain_before / average_loss_before
    average_loss_current.zero? ? fr_current = 0 : fr_current = average_gain_current / average_loss_current
    fr_before.zero? ? ifr_before = "" : ifr_before = 100 - (100 / (1 + fr_before))
    fr_current.zero? ? ifr_current = "" : ifr_current = 100 - (100 / (1 + fr_current))
    mms5_before < mms5_current ? mms5_status = "Down" : mms5_status = "Up"
    mms14_before < mms14_current ? mms14_status = "Down" : mms14_status = "Up"
    mms5_current > mms14_current ? mms5_mms14_status = "Up" : mms5_mms14_status = "Down"
    ifr_before < ifr_current ? ifr_status = "Down" : ifr_status = "Up"

    OpenStruct.new(mms5_before: mms5_before, mms5_current: mms5_current, mms14_before: mms14_before,
                   mms14_current: mms14_current, before_price: before_price, current_price: current_price,
                   ifr_current: ifr_current, ifr_before: ifr_before, mms5_status: mms5_status,
                   mms14_status: mms14_status, mms5_mms14_status: mms5_mms14_status, ifr_status: ifr_status)
  end
  helper_method :calculate
end
