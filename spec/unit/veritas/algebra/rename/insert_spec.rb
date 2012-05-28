# encoding: utf-8

require 'spec_helper'

describe Algebra::Rename, '#insert' do
  subject { object.insert(other) }

  let(:object)   { described_class.new(relation, aliases)                      }
  let(:relation) { Relation.new([ [ :id,       Integer ] ], [ [ 1 ] ].each)    }
  let(:other)    { Relation.new([ [ :other_id, Integer ] ], [ [ 2 ] ].each)    }
  let(:aliases)  { described_class::Aliases.coerce(relation, :id => :other_id) }

  it { should be_instance_of(described_class) }

  its(:operand) { should be_kind_of(Relation) }

  its(:header) { should == [ [ :other_id, Integer ] ] }

  its(:aliases) { should eql(aliases) }

  it 'inserts the tuples' do
    should == [ [ 1 ], [ 2 ] ]
  end
end
