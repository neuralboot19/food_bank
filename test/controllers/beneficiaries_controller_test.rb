require "test_helper"

class BeneficiariesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @beneficiary = beneficiaries(:maria)
  end

  test "should get index" do
    get beneficiaries_path

    assert_response :success
    assert_select '.beneficiary', 3
  end

  test "render a list of beneficiaries filtered by email" do
    get beneficiaries_path(query_text: @beneficiary.email)

    assert_response :success
    assert_select '.beneficiary', 1
    assert_select 'p', 'Maria Carrizo'
  end

  test 'render a list of beneficiaries filtered by names' do
    get beneficiaries_path(query_text: @beneficiary.names)

    assert_response :success
    assert_select '.beneficiary', 1
    assert_select 'p', 'Maria Carrizo'
  end

  test 'render a list of beneficiaries filtered by identity' do
    get beneficiaries_path(query_text: @beneficiary.identity)

    assert_response :success
    assert_select '.beneficiary', 1
    assert_select 'p', 'Maria Carrizo'
  end

  test 'sort beneficiaries by expensive created at' do
    get beneficiaries_path(order_by: 'created_at')

    assert_response :success
    assert_select '.beneficiary', 3
    assert_select '.beneficiaries .beneficiary:first-child p', 'Maria Carrizo'
  end

  test 'sort beneficiaries by expensive updated last' do
    get beneficiaries_path(order_by: 'updated_last')

    assert_response :success
    assert_select '.beneficiary', 3
    assert_select '.beneficiaries .beneficiary:first-child p', 'Maria Carrizo'
  end

  test "should get new" do
    get new_beneficiary_path

    assert_response :success
    assert_select 'form'
  end

  test "should create beneficiary" do
    post beneficiaries_path, params: {
      beneficiary: {
        identity: @beneficiary.identity,
        born: @beneficiary.born,
        cel_phone: @beneficiary.cel_phone,
        email: @beneficiary.email,
        expiration_date_document: @beneficiary.expiration_date_document,
        family_unit: @beneficiary.family_unit,
        first_surname: @beneficiary.first_surname,
        names: @beneficiary.names,
        other_address: @beneficiary.other_address,
        second_surname: @beneficiary.second_surname,
        status_document: @beneficiary.status_document,
        terms_conditions: @beneficiary.terms_conditions
      }
    }

    assert_redirected_to beneficiaries_path
    assert_equal flash[:notice], 'Beneficiary was successfully created.'
  end

  test "should get edit" do
    get edit_beneficiary_path(@beneficiary)

    assert_response :success
    assert_select 'form'
  end

  test "should update beneficiary" do
    patch beneficiary_path(@beneficiary), params: {
      beneficiary: {
        identity: @beneficiary.identity,
        born: @beneficiary.born,
        cel_phone: @beneficiary.cel_phone,
        email: @beneficiary.email,
        expiration_date_document: @beneficiary.expiration_date_document,
        family_unit: @beneficiary.family_unit,
        first_surname: @beneficiary.first_surname,
        names: @beneficiary.names,
        other_address: @beneficiary.other_address,
        second_surname: @beneficiary.second_surname,
        status_document: @beneficiary.status_document,
        terms_conditions: @beneficiary.terms_conditions
      }
    }

    assert_redirected_to beneficiaries_path
    assert_equal flash[:notice], 'Beneficiary was successfully updated.'
  end

  test "should destroy beneficiary" do
    assert_difference("Beneficiary.count", -1) do
      delete beneficiary_path(beneficiaries(:pedro))
    end

    assert_redirected_to beneficiaries_path
    assert_equal flash[:notice], 'Beneficiary was successfully destroyed.'
  end
end
