# frozen_string_literal: true

require 'spec_helper'

describe Matrix::GaussianElimination do
  subject { Matrix::GaussianElimination.new(matrix).build_echelon_form }

  context 'validations' do
    let(:matrix) { '1, 2, 4, 5' }

    it 'Returns valid head' do
      expect { subject }.to raise_error("please input matrix data as array obj")
    end
  end

  context 'it should not change original array' do
    let(:matrix) do
      [
        [1, 2, 3, 1],
        [2, -1,  2, 6],
        [1,  1,  5, -1]
      ]
    end

    it 'Returns valid head' do
      subject

      expect(matrix).to eql(matrix)
    end
  end

  context '3x3' do
    let(:matrix) do
      [
        [1, 2, 3, 1],
        [2, -1,  2, 6],
        [1,  1,  5, -1]
      ]
    end

    let(:expected_output) do
      [
        [1.0, 2.0, 3.0, 1.0],
        [-0.0, 1.0, 0.8, -0.8],
        [0.0,  0.0, 1.0, -1.0]
      ]
    end

    it 'Returns valid head' do
      expect(subject).to eql(expected_output)
    end
  end

  context '3x3 (2)' do
    let(:matrix) do
      [
        [4, 2, -1,  1],
        [5, 3, -2,  2],
        [3, 2, -3,  0]
      ]
    end

    let(:expected_output) do
      [
        [1.0,   0.5, -0.25, 0.25],
        [0.0,   1.0, -1.5,  1.5],
        [-0.0,  -0.0, 1.0, 1.0]
      ]
    end

    it 'Returns valid head' do
      expect(subject).to eql(expected_output)
    end
  end

  context '2x2' do
    let(:matrix) do
      [
        [1, -1, -5],
        [2,  1, -7]
      ]
    end

    let(:expected_output) do
      [
        [1.0, -1.0, -5.0],
        [0.0, 1.0, 1.0]
      ]
    end

    it 'Returns valid head' do
      expect(subject).to eql(expected_output)
    end
  end
end
