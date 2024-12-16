# Sales Data Warehouse & Automated Reporting Pipeline
## Mô tả dự án
Dự án này xây dựng Data Warehouse để quản lý và phân tích dữ liệu bán hàng từ file AdventureWorks2012.bak. Dữ liệu được xử lý thông qua ETL pipeline, lên lịch chạy định kỳ và kết nối với Power BI để tạo báo cáo tự động, đáp ứng nhu cầu cập nhật thông tin bán hàng thường xuyên.
## Mục tiêu chính
### 1. Xây dựng Data Warehouse:
- Tổ chức dữ liệu từ file AdventureWorks2012.bak vào mô hình dữ liệu chuẩn cho báo cáo.
![image](https://github.com/user-attachments/assets/51a8f9c2-7df6-4c5f-8424-5eda7ed54248)
### 2. ETL Pipeline:
- Trích xuất, chuyển đổi trên DW_STAGGING và tải dữ liệu vào DW_SALES_REPORT.
- ETL lần đầu
![image](https://github.com/user-attachments/assets/5746e5d2-0f22-4dc7-a64c-50ae202cff4a)
- ETL lần những lần sau
![image](https://github.com/user-attachments/assets/568bb66a-bc6b-4a3d-be6b-2411db7d5d39)
- Lên lịch chạy ETL định kỳ để tự động hóa quy trình cập nhật dữ liệu.
![image](https://github.com/user-attachments/assets/b9cb86c6-fc56-4942-aa3b-67211908d51f)
### 3. Tạo báo cáo trên Power BI:
- Xây dựng báo cáo Sales Dashboard trực quan trên Power BI dựa trên dữ liệu đã xử lý.
![image](https://github.com/user-attachments/assets/1274cfef-68de-4049-a2ff-a7b02d051f6c)
- Triển khai báo cáo lên Power BI Service.
### 4. Tự động cập nhật báo cáo:
- Sử dụng Gateway để kết nối Power BI Service với DW_SALES_REPORT và cập nhật dữ liệu định kỳ.
![image](https://github.com/user-attachments/assets/a544fea6-f5d2-44b5-9a4f-9a2d3751c1b9)
## Công nghệ sử dụng
- SQL Server: Xử lý và lưu trữ dữ liệu Data Warehouse.
- SQL Server Integration Services (SSIS): Xây dựng các package ETL 
- SQL Server Agent: Lên lịch chạy các tác vụ ETL định kỳ.
- Power BI: Xây dựng báo cáo và dashboard bán hàng.
- Power BI Gateway: Kết nối dữ liệu giữa Power BI Service và Data Warehouse.
