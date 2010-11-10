require 'spec_helper'

describe 'Veritas::Optimizer::Relation::Operation::Offset::OffsetOperand#optimize' do
  subject { object.optimize }

  let(:klass)    { Optimizer::Relation::Operation::Offset::OffsetOperand    }
  let(:order)    { Relation.new([ [ :id, Integer ] ], [ [ 1 ] ].each).order }
  let(:relation) { order.drop(1).drop(2)                                    }
  let(:object)   { klass.new(relation)                                      }

  before do
    object.operation.should be_kind_of(Relation::Operation::Offset)
  end

  it { should eql(order.drop(3)) }

  its(:operand) { should equal(order) }
end
