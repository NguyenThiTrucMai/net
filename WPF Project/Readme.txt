Library Management System ==> WPF
==> The project solution is inside the LibraryManagementSystem folder. 

https://github.com/sanojcr/Library-Management-System-WPF

# Chức năng

- Book : store procedure + lấy danh sách tất cả (Bình) 
- Book : lấy thông tin chi tiết 1 cuốn sách(Bình)
- Book : store procedure + xóa (Bình) 

- Book : store procedure +  thêm (MaiNguyen) 
    + Book : chức năng lưu hình ảnh vào thư mục Images trên code (MaiNguyen)
- Book : store procedure +  sửa (MaiNguyen) 
    + Book : chức năng lưu hình ảnh vào thư mục Images trên code (MaiNguyen)
    + Book : chức năng hiển thị hình ảnh của cuốn sách sau khi lưu thành công (MaiNguyen)

user + admin
    + tắt màn hình đăng nhập sau khi đăng nhập thành công(MaiNguyen)

- đăng ký
- tối ưu: chỉ tạo 1 bảng account có trường role phân biệt là user hay admin
- đăng nhập thì dựa vào role để biết chuyển đến màn hình nào
+ user > chuyển đến màn hình sách đã đang mượn của user
+ admin > chuyển đến màn hình quản lí sách, quản lí sách đang mượn để duyệt, v.v

tblRequestedUsers : table đăng ký mượn sách của user

tblRecievedUsers : table ghi nhận sách được mượn của user

tblReturnedUsers : table ghi nhận sách được trả về cho nhà sách của user