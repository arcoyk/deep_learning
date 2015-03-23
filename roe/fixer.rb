f = open('train.csv')
class_id = Array.new()
nvis = 0
f.each do |line|
	class_id.push line.split(',').first
	nvis = line.split(',').length -  1
end
n_classes = class_id.uniq.length
batch_size = 2
puts "nvis: #{nvis}"
puts "n_classes: #{n_classes}"
puts "batch_size: #{batch_size}"

File.write 'dae_l1.yaml', File.read('dae_l1.yaml').gsub(/nvis: \d+/, "nvis: #{nvis}")
File.write 'dae_mlp.yaml', File.read('dae_mlp.yaml').gsub(/nvis: \d+/, "nvis: #{nvis}")

File.write 'dae_mlp.yaml', File.read('dae_mlp.yaml').gsub(/n_classes: \d+/, "n_classes: #{n_classes}")
File.write 'test.py', File.read('test.py').gsub(/test_data, model, \d+/, "test_data, model, #{nvis}")

File.write 'dae_l1.yaml', File.read('dae_l1.yaml').gsub(/batch_size: \d+/, "batch_size: #{batch_size}")
File.write 'dae_l2.yaml', File.read('dae_l2.yaml').gsub(/batch_size: \d+/, "batch_size: #{batch_size}")
File.write 'dae_mlp.yaml', File.read('dae_mlp.yaml').gsub(/batch_size: \d+/, "batch_size: #{batch_size}")

puts "fixed dae_l1.yaml dae_mlp.yaml"
