describe Robot do 
  
  def stub_direction_once( first_return_value )
    allow(subject).to receive(:direction){
      allow(subject).to receive(:direction).and_call_original
      first_return_value
    }
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