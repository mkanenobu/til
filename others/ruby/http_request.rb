require 'net/http'
require 'csv'
require 'excel2csv'

module UpdateCitiesCSV
  # 都道府県コード及び市区町村コードExcelファイル
  filename = '000618153.xls'
  tmp_file = 'tmp.xls'
  res = Net::HTTP.get('www.soumu.go.jp', "/main_content/#{filename}")
  File.write(tmp_file, res)

  csv_arr = Excel2CSV.read(tmp_file, encoding: 'windows-1252:utf-8')

  File.write('cities.csv', csv_arr.map { |row| row.join(',').delete("\n") }.join("\n"))
  File.unlink(tmp_file)
end
