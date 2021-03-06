class RubyClass end;
main = self

describe RubyClass do
  it 'keeps a reference to self' do
    block = lambda {
      # add code to RubyClass here
    }

    expect { block.call }.to output('RubyClass').to_stdout
  end

  it 'returns the value of the last statement' do
    result = class RubyClass
               # write code here
             end
    expect(result).to be RubyClass
  end
end

describe 'Current class' do
  it 'has a class at the top level scope' do
    this = nil
    # change the assignment of this
    expect(this.class).to be Object
  end

  it 'has a class inside nested methods' do
    class RubyClass
      def a_method
        def b_method
          # write code here
        end

        b_method
      end
    end

    expect(RubyClass.new.a_method).to be RubyClass
  end
end

describe Module do
  describe '#class_eval' do
    it 'evaluates a block in the context of an existing class' do
      # use class_eval or module_eval here
      expect({key: 'value'}.hello_world).to eq 'Hello World'
      expect('Earth'.hello_world).to eq 'Hello World'
      expect(1.hello_world).to eq 'Hello World'
      expect((1..10).hello_world).to eq 'Hello World'
      expect(true.hello_world).to eq 'Hello World'
    end
  end
end

describe 'Two kinds of class variables' do
  describe 'Class instance variable' do
    it 'belongs solely to the class' do
      class PokemonTrainer
        @pokemon = %w(Squirtle Ivysaur Charizard)

        class << self
          attr_reader :pokemon
        end

        attr_reader :pokemon

        def initialize
          @pokemon = nil
        end
      end

      class Red < PokemonTrainer; end

      # fix expectations below
      expect(Red.pokemon).to eq PokemonTrainer.pokemon
      expect(PokemonTrainer.new.pokemon).to eq PokemonTrainer.pokemon
    end
  end

  describe 'Class variable' do
    it 'belongs to a class hierarchy' do
      class PokemonTrainer
        @@pokemon = %w(Squirtle Ivysaur Charizard)

        def self.pokemon
          @@pokemon
        end
      end

      class Red < PokemonTrainer; end

      # fix expectation below
      expect(Red.pokemon).to_not eq PokemonTrainer.pokemon
    end
  end
end

describe 'Singleton method' do
  it 'can be defined on self' do
    # write code here
    expect(String.singleton_methods).to include(:hello_world)
    expect { 'LOL'.hello_world }.to_not raise_error
    expect { String.hello_world }.to_not raise_error
    # why do these expectations pass?
  end

  it 'can be defined on a constant class name' do
    anonymous_class = Class.new {}
    Momo = anonymous_class
    # write code here
    expect(Momo.has_knife).to be true
  end

  it 'can be defined on an object' do
    mj = 'Michael Jordan'
    # write code here
    expect(mj.is_goat?).to be true
    expect { 'Lebron James'.is_goat? }.to raise_error NoMethodError
  end
end

describe 'Ruby object' do
  it 'has a Singleton class' do
    object = 'Ruby string'
    # write code here
    expect(object.singleton_class).to be singleton_class
  end
end

describe 'Class method' do
  it 'is a singleton method in the singleton class of the class' do
    Dawg = Class.new
    # write code here
    expect(Dawg.singleton_methods).to include(:bark, :run, :give_bone)
    expect(Dawg.singleton_class.singleton_methods).to include(:cat_lover)
  end
end
