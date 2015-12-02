before_script do
  run 'npm install'
  run 'npm install -g leaves'
end

serve 'leaves'
port 9000
