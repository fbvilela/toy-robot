describe Robot do 
  
  def stub_direction_once(first_return_value)
    allow(subject).to receive(:direction){
      allow(subject).to receive(:direction).and_call_original
      first_return_value
    }
  end

  describe '#move' do
    let(:robot){ Robot.new }
    subject{ lambda{ robot.move } }
    
    it{ should_not change{ robot.direction } }

    context 'when facing north'
    context 'when facing south' 
    context 'when facing east' 
    context 'when facing west' 
    
  end

  describe '#place' do 
    let(:robot){ Robot.new }
    subject{ lambda{ robot.place(1,1,:north) } }
    
    it{ should change{ robot.x }.from(nil).to(1) }
    it{ should change{ robot.y }.from(nil).to(1) }
    it{ should change{ robot.direction }.from(nil).to(:north) }                                             
  end

  describe '#left' do 
    context 'when facing NORTH' do 
      before do 
        stub_direction_once(:north)
        subject.left
      end 
      it{ should be_facing_west }
    end

    context 'when facing SOUTH' do 
      before do 
        stub_direction_once(:south)
        subject.left
      end 
      it{ should be_facing_east }
    end

    context 'when facing EAST' do 
      before do 
        stub_direction_once(:east)
        subject.left
      end 
      it{ should be_facing_north }
    end

    context 'when facing WEST' do 
      before do 
        stub_direction_once(:west)
        subject.left
      end 
      it{ should be_facing_south }  
    end

  end

  describe '#right' do 
    context 'when facing NORTH' do 
      before do 
        stub_direction_once(:north)
        subject.right
      end 
      it{ should be_facing_east }
    end

    context 'when facing SOUTH' do 
      before do 
        stub_direction_once(:south)
        subject.right
      end 
      it{ should be_facing_west }
    end

    context 'when facing EAST' do 
      before do 
        stub_direction_once(:east)
        subject.right
      end 
      it{ should be_facing_south }
    end

    context 'when facing WEST' do 
      before do 
        stub_direction_once(:west)
        subject.right
      end 
      it{ should be_facing_north }  
    end

  end

end