require 'spec_helper'

describe 'Veritas::Algebra::Projection#wrap' do
  subject { projection.wrap(header) { |relation| relation } }

  let(:relation)   { Relation.new([ [ :id, Integer ] ], [ [ 1 ] ]) }
  let(:header)     { relation.header                               }
  let(:projection) { Algebra::Projection.new(relation, [ :id ])    }
  let(:yields)     { []                                            }

  it { should_not be_equal(projection) }

  it { should be_kind_of(Algebra::Projection) }

  it 'yields the relations' do
    expect {
      projection.wrap(header) { |relation| yields << relation; relation }
    }.to change { yields.dup }.from([]).to([ relation ])
  end

  it 'sets the relation with the block return values' do
    operation = projection.wrap(header) { relation }
    operation.operand.should equal(relation)
  end

  its(:header) { should == header }
end
