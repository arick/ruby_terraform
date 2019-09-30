require 'spec_helper'

describe RubyTerraform::Commands::Clean do
  it 'deletes the .terraform directory in the current directory by default' do
    command = RubyTerraform::Commands::Clean.new

    expect(FileUtils).to(
        receive(:rm_r).with('.terraform', :secure => true))

    command.execute
  end

  it 'deletes the provided directory when specified' do
    command = RubyTerraform::Commands::Clean.new(directory: 'some/path')

    expect(FileUtils).to(
        receive(:rm_r).with('some/path', :secure => true))

    command.execute
  end

  it 'allows the directory to be overridden on execution' do
    command = RubyTerraform::Commands::Clean.new

    expect(FileUtils).to(
        receive(:rm_r).with('some/.terraform', :secure => true))

    command.execute(directory: 'some/.terraform')
  end
end
