require File.expand_path('../../../../../../spec_helper', __FILE__)

describe 'Veritas::Algebra::Difference::Set#each' do
  before do
    @header = [ [ :id, Integer ] ]

    @left = Relation.new(@header, [ [ 1 ] ])

    @yield = []
  end

  subject { @set.each { |tuple| @yield << tuple } }

  describe 'with relations having similar bodies' do
    before do
      @set = Algebra::Difference::Set.new(@left, @left.dup)
    end

    it { should equal(@set) }

    it 'should yield the difference' do
      method(:subject).should_not change { @yield.dup }
    end
  end

  describe 'with relations having different bodies' do
    before do
      @right = Relation.new(@header, [ [ 2 ] ])

      @set = Algebra::Difference::Set.new(@left, @right)
    end

    it { should equal(@set) }

    it 'should yield the difference' do
      method(:subject).should change { @yield.dup }.from([]).to([ [ 1 ] ])
    end
  end
end
