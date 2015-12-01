before_script do
  run 'npm install -g leaves'
  run 'leaves install'
end

serve 'leaves'
port 9000
