# -*- encoding: utf-8 -*-
require 'spec_helper'

RSpec.describe Brcobranca::Util::Empresa do

  context 'com zero' do
    it 'CPF returns 01' do
      ['179.461.278-55', '17946127855', 17946127855].each do |documento|
        expect(Brcobranca::Util::Empresa.new(documento, true).tipo).to eq('01')
        expect(Brcobranca::Util::Empresa.new(documento).tipo).to eq('01')
      end
    end

    it 'CNPJ returns 02' do
      ['25.716.376/0001-28', '25716376000128', 25716376000128].each do |documento|
        expect(Brcobranca::Util::Empresa.new(documento, true).tipo).to eq('02')
        expect(Brcobranca::Util::Empresa.new(documento).tipo).to eq('02')
      end
    end
  end

  context 'sem zero' do
    it 'CPF returns 1' do
      ['179.461.278-55', '17946127855', 17946127855].each do |documento|
        expect(Brcobranca::Util::Empresa.new(documento, false).tipo).to eq('1')
      end
    end

    it 'CNPJ returns 2' do
      ['25.716.376/0001-28', '25716376000128', 25716376000128].each do |documento|
        expect(Brcobranca::Util::Empresa.new(documento, false).tipo).to eq('2')
      end
    end
  end
end