require "test_helper"

class SControllerTest < ActionDispatch::IntegrationTest
  setup do
    @configuracao = configuracaos(:one)
  end

  test "should get index" do
    get configuracaos_url
    assert_response :success
  end

  test "should get new" do
    get new_configuracao_url
    assert_response :success
  end

  test "should create configuracao" do
    assert_difference("Configuracao.count") do
      post configuracaos_url, params: { configuracao: { bigint: @configuracao.bigint, descricao: @configuracao.descricao, fator: @configuracao.fator, servico_urbano_por_atributo: @configuracao.servico_urbano_por_atributo, servicos_urbanos_id: @configuracao.servicos_urbanos_id } }
    end

    assert_redirected_to configuracao_url(Configuracao.last)
  end

  test "should show configuracao" do
    get configuracao_url(@configuracao)
    assert_response :success
  end

  test "should get edit" do
    get edit_configuracao_url(@configuracao)
    assert_response :success
  end

  test "should update configuracao" do
    patch configuracao_url(@configuracao), params: { configuracao: { bigint: @configuracao.bigint, descricao: @configuracao.descricao, fator: @configuracao.fator, servico_urbano_por_atributo: @configuracao.servico_urbano_por_atributo, servicos_urbanos_id: @configuracao.servicos_urbanos_id } }
    assert_redirected_to configuracao_url(@configuracao)
  end

  test "should destroy configuracao" do
    assert_difference("Configuracao.count", -1) do
      delete configuracao_url(@configuracao)
    end

    assert_redirected_to configuracaos_url
  end
end
