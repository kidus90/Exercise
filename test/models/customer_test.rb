require "test_helper"

class CustomerTest < ActiveSupport::TestCase
  def setup
    @customer = Customer.new(code: SecureRandom.hex(8), name: 'Test Customer')
  end

  test 'should have many invoices' do
    assoc = Customer.reflect_on_association(:invoices)
    assert_equal :has_many, assoc.macro
  end

  test 'should validate presence of code' do
    @customer.code = nil
    assert_not @customer.valid?
    assert_includes @customer.errors[:code], "can't be blank"
  end

  test 'should validate presence of name' do
    @customer.name = nil
    assert_not @customer.valid?
    assert_includes @customer.errors[:name], "can't be blank"
  end

  test 'should validate uniqueness of code' do
    @customer.save!
    duplicate = Customer.new(code: @customer.code, name: 'Another Customer')
    assert_not duplicate.valid?
    assert_includes duplicate.errors[:code], 'has already been taken'
  end
end
