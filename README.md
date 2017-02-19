BASIC WEB EXERCISES
Dùng Sinatra để tạo website như sau:
1. HTML Template
Mục đích của bài này là để giúp hiểu cách làm việc của template engine.
Yêu cầu: Trả về các website đã cắt HTML, các file HTML cần sửa lại thành template theo các template để render bằng template engine. Cần dùng ít nhất 2 template engine (đề xuất: ERB/Erubis và HAML).
Trong các template trả về cần có các dữ liệu thuộc dạng chuỗi & mảng.
Ví dụ như trang web này:
https://huuth.github.io/coursera_assignment/bislite-business-website/
có thể định nghĩa 1 mảng các latest work và dùng loop để render.
Thời gian đề xuất: 2 ngày.
2. CRUD User:
Tạo các trang CRU cho user (GET URL là new, show, update)
- First name, last name, email, password, avatar, about_me
Trong đó: - email phải là duy nhất.
- avatar chỉ được có đuôi là jpg, png, bmp.
Trang tạo user thì avatar được upload lên theo form, trang update user thì avatar được upload mà trang web không được refresh lại.
Tạo thêm 1 trang index có chức năng search và có thêm nút delete để xóa user, lưu ý khi xóa thì không được refresh lại trang (phải dùng ajax).
Thời gian đề xuất cho bài này : 3 ngày.
3. CRUD Books:
Tương tự, tạo các trang CRUD cho các cuốn sách (Book) như sau:
- Các thuộc tính: title, authors, publisher, year.
Authors lấy từ user.
Tạo trang CRUD cho các book review như sau:
- Các thuộc tính: star (1-5), reviewer, subject, content.
Reviewer lấy từ user.
Thời gian đề xuất cho bài này: 3 ngày.
4. Thực hiện việc login và phân quyền
Phần này yêu cầu 1 số kiến thức như sau:
- Hiểu về session, cookies.
- Hiểu về các HTTP Header.
- Nắm được cơ bản về web server interface nói chung, và cấu trúc của rack nói riêng.
Yêu cầu: bổ sung vào phần code đã làm trong bài 2, thêm các trang sau:
-    Register page & Email Confirmation Success/Fail. 
-        Login page.
-        Update trang show & update của user, chỉ cho phép user đã login được phép nhìn thấy thông tin của mình..
-        Trang update user: chỉ login user đã verìfy email update thông tin, nếu chưa verify email thì thông tin là read only . 

Thời gian đề xuất: 5 ngày.             

 


