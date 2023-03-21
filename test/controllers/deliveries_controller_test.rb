require 'test_helper'

class DeliveriesControllerTest < ActionDispatch::IntegrationTest
  test 'render a list of deliveries' do
    # Se realiza la petición a la ruta
    get deliveries_path

    # Se comprueba que sea exitosa.
    assert_response :success
    
    # Se selecciona por medio de la clase y se le dice la cantidad de productos que va leer
    assert_select '.delivery', 2
  end

  test 'render a new delivery form' do
    get new_delivery_path

    assert_response :success
    assert_select 'form'
  end

  test 'allows to create a new delivery' do
    post deliveries_path, params: {
      delivery: {
        quantity: '23.45',
        observation: 'Delivery'
      }
    }

    assert_redirected_to deliveries_path
    assert_equal flash[:notice], 'Created success delivery'
  end

  test 'does not allow to create a new delivery with empty fields' do
    post deliveries_path, params: {
      delivery: {
        quantity: '',
        observation: 'Delivery'
      }
    }

    assert_response :unprocessable_entity
  end

  test 'render an edit delivery form' do
    get edit_delivery_path(deliveries(:one))

    assert_response :success
    assert_select 'form'
  end

  test 'allows to update a delivery' do
    patch delivery_path(deliveries(:one)), params: {
      delivery: {
        quantity: '23',
        observation: 'Delivery'
      }
    }

    assert_redirected_to deliveries_path
    assert_equal flash[:notice], 'Update success delivery'
  end

  test 'does not allow to update a delivery with an invalid field' do
    patch delivery_path(deliveries(:one)), params: {
      delivery: {
        quantity: nil
      }
    }

    assert_response :unprocessable_entity
  end

  test 'can delete deliveries' do
    assert_difference('Delivery.count', -1) do
      delete delivery_path(deliveries(:one))
    end

    assert_redirected_to deliveries_path
    assert_equal flash[:notice], 'Delete success delivery'
  end

end
