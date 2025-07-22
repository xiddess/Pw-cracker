require_relative 'cracker_lib'

# Fungsi untuk cracking file
def crack_file(file_path, dictionary_file)
  case File.extname(file_path).downcase
  when '.pdf'
    crack_pdf(file_path, dictionary_file)
  when '.docx'
    crack_docx(file_path, dictionary_file)
  when '.xls', '.xlsx', '.csv'
    crack_excel(file_path, dictionary_file)
  else
    puts "Jenis file tidak didukung untuk cracking."
  end
end

# Fungsi untuk cracking halaman login
def crack_login(url, dictionary_file, login_form)
  brute_force_login(url, dictionary_file, login_form)
end

# Pilih mode: cracking file atau login
puts "Pilih mode: 1. Crack file 2. Crack login"
mode = gets.chomp.to_i

if mode == 1
  puts "Masukkan path file yang ingin dicrack:"
  file_path = gets.chomp
  crack_file(file_path, 'rockyou.txt')
elsif mode == 2
  puts "Masukkan URL halaman login:"
  url = gets.chomp
  puts "Masukkan username untuk login:"
  username = gets.chomp
  login_form = {
    action: 'login',
    username_field: 'username',
    password_field: 'password',
    username: username
  }
  crack_login(url, 'rockyou.txt', login_form)
else
  puts "Pilihan tidak valid"
end
