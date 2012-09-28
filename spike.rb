base_path = ".git/refs/heads/"
branches = `ls -l #{base_path} | awk '{if($9 !~ /^$|master/) print $9}'`

branches.each do |branch_file|
	branch_file.sub!(/\n/,'')
	branch_hash = `cat #{base_path}#{branch_file}`.sub(/\n/,'')
	hash_status_file = `git ls-tree -r #{branch_hash} .kanban/#{branch_file} | awk '/.+/ {print $3}'`
	status = `git cat-file -p #{hash_status_file}`
	puts "#{branch_file} - #{status}"
end


