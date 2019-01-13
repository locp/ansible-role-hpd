ports = [
  8032,
  8042,
  9864,
  9870,
  19_888
]

ports.each do |port|
  describe port(port) do
    it { should be_listening }
  end
end

describe group('hadoop') do
  it { should exist }
end

describe user('hadoop') do
  it { should exist }
  its('group') { should eq 'hadoop' }
end

describe user('yarn') do
  it { should exist }
  its('group') { should eq 'hadoop' }
end

describe user('mapred') do
  it { should exist }
  its('group') { should eq 'hadoop' }
end
