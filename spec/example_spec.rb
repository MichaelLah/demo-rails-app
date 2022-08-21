RSpec.describe 'Example Timecop' do

  # context 'timecop!' do
  #   Timecop.travel(Date.parse(2020, 1, 1))
  # end
  it 'works' do
    puts "Time: #{Time.now}"
    expect(true).to eq(true)
  end
end
