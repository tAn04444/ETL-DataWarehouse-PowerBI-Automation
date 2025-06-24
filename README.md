# 📊 Sales Data Warehouse & Automated Reporting Pipeline

## 📌 Mô tả dự án
Dự án xây dựng hệ thống *Data Warehouse* kết hợp *ETL Pipeline tự động* để xử lý và phân tích dữ liệu bán hàng từ *AdventureWorks2022*. Báo cáo trực quan được thiết kế trên Power BI và cập nhật định kỳ thông qua Gateway.

---

## 🎯 Mục tiêu chính

### 1. Thiết kế Data Warehouse
- Mô hình dữ liệu: *Snowflake Schema*
- Tổ chức các bảng Fact và Dimension để phân tích doanh thu và số lượng sản phẩm

![image](https://github.com/user-attachments/assets/57d68af8-d4a5-4dcd-a81d-97e9ee26317d)

### 2. Xây dựng ETL Pipeline bằng SSIS
- ETL lần đầu:
  ![image](https://github.com/user-attachments/assets/71950a14-dec4-4dce-946a-6cfa9ae3ee96)
- Các lần ETL sau:
  ![image](https://github.com/user-attachments/assets/83bce897-74dc-4b11-8d6a-690736e743f3)
- Tự động hóa bằng SQL Server Agent:
  ![image](https://github.com/user-attachments/assets/8eb7388f-a267-4b77-aaca-228c49f3aa84)

### 3. Trực quan hóa với Power BI
- Revenue Overview by Territory and Year dashboard
  ![image](https://github.com/user-attachments/assets/1fd5cfb6-292f-428c-9266-3a0edef52673)
- Product Overview by Territory and Year dashboard
  ![image](https://github.com/user-attachments/assets/9d1a9621-ec10-4912-a502-f98d8dfcd8cb)

### 4. Tự động cập nhật dữ liệu báo cáo
- Kết nối Gateway + lên lịch refresh:
  ![image](https://github.com/user-attachments/assets/7d86cdd4-0f7b-4423-8bc6-15bf4d869939)

---

## 🛠️ Công nghệ sử dụng

| Thành phần | Công cụ |
|-----------|--------|
| Cơ sở dữ liệu | SQL Server (AdventureWorks2022) |
| ETL Pipeline | SQL Server Integration Services (SSIS) |
| Scheduling | SQL Server Agent |
| Dashboard | Power BI Desktop & Service |
| Data Gateway | Power BI Gateway |
| Modeling | Snowflake Schema, Surrogate Key, SCD |

---

## 🧱 Kiến trúc hệ thống

```mermaid
graph TD
    A[AdventureWorks2022] --> B[Staging Area]
    B --> C[Transform & Clean]
    C --> D[Data Warehouse]
    D --> E[Power BI Dashboard]
    D --> F[Power BI Service]
    F --> G[Gateway & Schedule Refresh]
