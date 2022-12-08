class SController < ApplicationController
  before_action :authenticate_usuario!
  before_action :autoriza_usuario!
  before_action :set_cadastro_servico_urbano, only: [:show, :edit, :update, :destroy, :imprimir]
  before_action only: [:destroy] do
    destroy_by_autorization(@cadastro_servico_urbano)
  end

  def index
    @q = Cadastro::ServicoUrbano.order("exercicio DESC, codigo ASC").ransack(params[:q])
    @cadastro_servicos_urbanos = @q.result.page(params[:page])

    respond_to do |format|
      format.html
      format.json
    end
  end

  def imprimir_lista
    @cadastro_servicos_urbanos = Cadastro::ServicoUrbano.all

    respond_to do |format|
      format.pdf do
        render pdf: "cadastro_servicos_urbanos", title: "Lista de cadastro_servicos_urbanos", orientation: "Landscape", header: { html: {template: "layouts/_cabecalho", locals: {titulo: "Lista de Servicos_urbanos"} }, spacing: 5 }, footer: { right: "[page]", font_size: 7, html: { template: "layouts/_rodape" }, spacing: 0 }
      end
      format.xlsx
    end
  end

  def show
  end

  def imprimir
    respond_to do |format|
      format.pdf do
        render pdf: "cadastro_de_cadastro_servico_urbano", title: "Cadastro de Servico_urbano", header: { html: {template: "layouts/_cabecalho", locals: {titulo: "Cadastro de Servicos_urbanos"} }, spacing: 5 }, footer: { right: "[page]", font_size: 7, html: { template: "layouts/_rodape" }, spacing: 0 }
      end
    end
  end

  def new
    @cadastro_servico_urbano = Cadastro::ServicoUrbano.new
  end

  def edit
  end

  def create
    @cadastro_servico_urbano = Cadastro::ServicoUrbano.new(cadastro_servico_urbano_params)

    if @cadastro_servico_urbano.save
      redirect_to @cadastro_servico_urbano, notice: 'Cadastro realizado com sucesso.'
    else
      render :new
    end
  end

  def update
    if @cadastro_servico_urbano.update(cadastro_servico_urbano_params)
      redirect_to @cadastro_servico_urbano, notice: 'Alteração realizada com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    if @cadastro_servico_urbano.destroy
      redirect_to cadastro_servicos_urbanos_path, notice: 'Cadastro removido com sucesso.'
    else
      redirect_to  cadastro_servicos_urbanos_path, danger: "#{@cadastro_servico_urbano.errors[:base].join(", ")}"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cadastro_servico_urbano
      @cadastro_servico_urbano = Cadastro::ServicoUrbano.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cadastro_servico_urbano_params
      params.require(:cadastro_servico_urbano).permit(:exercicio, :descricao, :peso, :tipo, :codigo, :object_type, :object_id)
    end
end
