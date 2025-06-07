require 'test_helper'

class CustomersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customer = customers(:one)
  end

  test 'should get index' do
    get customers_url
    assert_response :success
  end

  test 'should show customer' do
    get customer_url(@customer)
    assert_response :success
  end

  test 'should create customer with valid params' do
    assert_difference('Customer.count') do
      post customers_url, params: { customer: { code: 'unique_code', name: 'New Name' } }
    end
    assert_redirected_to customer_url(Customer.last)
  end

  test 'should not create customer with invalid params' do
    assert_no_difference('Customer.count') do
      post customers_url, params: { customer: { code: '', name: '' } }
    end
    assert_response :success
    assert_select 'div#error_explanation'
  end

  test 'should update customer with valid params' do
    patch customer_url(@customer), params: { customer: { name: 'Updated Name' } }
    assert_redirected_to customer_url(@customer)
    @customer.reload
    assert_equal 'Updated Name', @customer.name
  end

  test 'should not update customer with invalid params' do
    patch customer_url(@customer), params: { customer: { code: '' } }
    assert_response :success
    assert_select 'div#error_explanation'
  end

  test 'should destroy customer' do
    assert_difference('Customer.count', -1) do
      delete customer_url(@customer)
    end
    assert_redirected_to customers_url
  end
end
