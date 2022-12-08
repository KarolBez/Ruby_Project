class CreateConfiguracaos < ActiveRecord::Migration[7.0]
  def change
    create_table :configuracaos do |t|
      t.string :servico_urbano_por_atributo
      t.string :descricao
      t.string :servicos_urbanos_id
      t.string :bigint
      t.decimal :fator, precision: 18, scale: 2

      t.timestamps
    end
  end
end
