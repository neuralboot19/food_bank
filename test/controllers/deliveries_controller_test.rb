require 'test_helper'

class DeliveriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @delivery = deliveries(:one)
  end

  test 'should get index' do
    # Se realiza la petición a la ruta
    get deliveries_path

    # Se comprueba que sea exitosa.
    assert_response :success
    
    # Se selecciona por medio de la clase y se le dice la cantidad de productos que va leer
    assert_select '.delivery', 3
  end

  test 'should get new' do
    get new_delivery_path
    assert_response :success
    assert_select 'form'
  end

  test 'should create delivery' do
    post deliveries_path, params: {
      delivery: {
        quantity: @delivery.quantity,
        observation: @delivery.observation,
        beneficiary_id: @delivery.beneficiary.id
      }
    }

    assert_redirected_to deliveries_path
    assert_equal flash[:notice], 'Delivery was successfully created.'
  end

  test 'does not allow to create a new delivery with empty fields' do
    post deliveries_path, params: {
      delivery: {
        quantity: '',
        observation: @delivery.observation,
        beneficiary_id: @delivery.beneficiary.id
      }
    }

    assert_response :unprocessable_entity
  end

  test 'should get edit' do
    get edit_delivery_path(@delivery)

    assert_response :success
    assert_select 'form'
  end

  test 'should update delivery' do
    patch delivery_path(@delivery), params: {
      delivery: {
        quantity: @delivery.quantity,
        observation: @delivery.observation,
        beneficiary_id: @delivery.beneficiary.id
      }
    }

    assert_redirected_to deliveries_path
    assert_equal flash[:notice], 'Delivery was successfully updated.'
  end

  test 'does not allow to update a delivery with an invalid field' do
    patch delivery_path(@delivery), params: {
      delivery: {
        quantity: nil
      }
    }

    assert_response :unprocessable_entity
  end

  test 'should destroy delivery' do
    assert_difference('Delivery.count', -1) do
      delete delivery_path(@delivery)
    end

    assert_redirected_to deliveries_path
    assert_equal flash[:notice], 'Delivery was successfully destroyed.'
  end

end
