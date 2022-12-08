require "application_system_test_case"

class ConfiguracaosTest < ApplicationSystemTestCase
  setup do
    @configuracao = configuracaos(:one)
  end

  test "visiting the index" do
    visit configuracaos_url
    assert_selector "h1", text: "Configuracaos"
  end

  test "should create configuracao" do
    visit configuracaos_url
    click_on "New configuracao"

    fill_in "Bigint", with: @configuracao.bigint
    fill_in "Descricao", with: @configuracao.descricao
    fill_in "Fator", with: @configuracao.fator
    fill_in "Servico urbano por atributo", with: @configuracao.servico_urbano_por_atributo
    fill_in "Servicos urbanos", with: @configuracao.servicos_urbanos_id
    click_on "Create Configuracao"

    assert_text "Configuracao was successfully created"
    click_on "Back"
  end

  test "should update Configuracao" do
    visit configuracao_url(@configuracao)
    click_on "Edit this configuracao", match: :first

    fill_in "Bigint", with: @configuracao.bigint
    fill_in "Descricao", with: @configuracao.descricao
    fill_in "Fator", with: @configuracao.fator
    fill_in "Servico urbano por atributo", with: @configuracao.servico_urbano_por_atributo
    fill_in "Servicos urbanos", with: @configuracao.servicos_urbanos_id
    click_on "Update Configuracao"

    assert_text "Configuracao was successfully updated"
    click_on "Back"
  end

  test "should destroy Configuracao" do
    visit configuracao_url(@configuracao)
    click_on "Destroy this configuracao", match: :first

    assert_text "Configuracao was successfully destroyed"
  end
end
