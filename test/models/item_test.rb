require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  def setup
    @item = Item.new(code: SecureRandom.hex(8), name: 'Test Item')
  end

  test 'should have many invoice_items' do
    assoc = Item.reflect_on_association(:invoice_items)
    assert_equal :has_many, assoc.macro
  end

  test 'should validate presence of code' do
    @item.code = nil
    assert_not @item.valid?
    assert_includes @item.errors[:code], "can't be blank"
  end

  test 'should validate presence of name' do
    @item.name = nil
    assert_not @item.valid?
    assert_includes @item.errors[:name], "can't be blank"
  end

  test 'should validate uniqueness of code' do
    @item.save!
    duplicate = Item.new(code: @item.code, name: 'Another Item')
    assert_not duplicate.valid?
    assert_includes duplicate.errors[:code], 'has already been taken'
  end
end
