Before do 
   @cadastrocliente = Cadastrocliente.new
   @paineldousuario = Paineldousuario.new
end 

After do |scenario|
   Dir.mkdir("data") unless Dir.exist?("data")
   sufix = ("error" if scenario.failed?) || "success"
   name = scenario.name.tr(" ", "_").downcase
   image_name = "data/img/#{sufix}-#{name}.png"
   temp_shot = page.save_screenshot(image_name)
   file_shot = File.open(temp_shot, "rb").read
   final_shot = Base64.encode64(file_shot)
   embed(temp_shot, "image/png", "Clique aqui para ver a evidência!")
 
   # Set reset session hook
   page.execute_script("sessionStorage.clear()")
 end

 at_exit do
   time = Time.now
   data = time.strftime("%d/%m/%Y") #=> "Data 04/09/2011"
   hora = time.strftime("at %I:%M%p") #=> "08:56AM"
   ReportBuilder.configure do |config|
     config.input_path = "data/report.json"
     config.report_path = "data/cucumber_web_report_e2e"
     config.report_types = [:html]
     config.color = "indigo"
     config.report_tabs = %w[Overview Features Scenarios Errors]
     config.report_title = "Automação de Testes - Report"
     config.compress_images = true
     config.additional_info = { "Projeto" => "Luma", "Funcionalidade" => "Cadastro Cliente", "Canal/Ambiente" => "Homolog", "Data de execução" => "#{data}" " #{hora}", "QA" => "Thamyris Gregorio" }
  end
  ReportBuilder.build_report
end