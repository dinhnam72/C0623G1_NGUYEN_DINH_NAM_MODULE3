USE furama;

-- 21.	Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là “ Huế” 
-- và đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”.
	CREATE VIEW v_nhan_vien AS
    SELECT 
    nv.ma_nhan_vien,
    nv.ho_ten,
    nv.ngay_sinh,
    nv.so_cmnd,
    nv.luong,
    nv.so_dien_thoai,
    nv.email,
    nv.dia_chi,
    nv.ma_vi_tri,
    nv.ma_trinh_do,
    nv.ma_bo_phan
    FROM nhan_vien nv
    JOIN hop_dong hd ON nv.ma_nhan_vien = hd.ma_nhan_vien
    WHERE nv.dia_chi like '%Huế' 
    AND hd.ngay_lam_hop_dong = '2020-07-14';
    
-- 22.	Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Quảng Bình” đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này.    
    UPDATE v_nhan_vien vnv
    SET vnv.dia_chi = 'Quảng BÌnh';
    
-- 23.	Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó với ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang.
	delimiter //
    CREATE PROCEDURE sp_xoa_khach_hang ( sp_ma_khach_hang INT, sp_delete_flag INT)
    BEGIN
    UPDATE khach_hang kh
    SET kh.delete_flag = sp_delete_flag
    WHERE kh.ma_khach_hang = sp_ma_khach_hang;
    END //
    delimiter ;
    CALL sp_xoa_khach_hang( 9,1);
-- 24.	Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong với yêu cầu sp_them_moi_hop_dong 
-- phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung, với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.
	delimiter //
    CREATE PROCEDURE sp_them_moi_hop_dong ( 
    -- sp_ma_hop_dong INT, 
    sp_ngay_lam_hop_dong VARCHAR(20), 
    sp_ngay_ket_thuc VARCHAR(20),
    sp_tien_dat_coc DOUBLE, 
    sp_ma_nhan_vien INT, 
    sp_ma_khach_hang INT, 
    sp_ma_nhan_vien INT, 
    sp_delete_flag INT)
    BEGIN
    
   INSERT INTO hop_dong (ngay_lam_hop_dong ,ngay_ket_thuc ,tien_dat_coc ,ma_nhan_vien ,ma_khach_hang ,ma_dich_vu ,delete_flag)
   VALUES (sp_ngay_lam_hop_dong,sp_ngay_ket_thuc,sp_tien_dat_coc,sp_ma_nhan_vien,sp_ma_khach_hang,sp_ma_nhan_vien,sp_delete_flag)
    ;
    END //
    delimiter ;
    CALL sp_them_moi_hop_dong( 9,1);
    
    
    