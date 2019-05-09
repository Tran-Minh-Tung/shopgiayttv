
$(function(){
	$.validator.setDefaults({
		errorClass:'help-block',
		highlight: function(element){
			$(element)
				.closest('.form-group')
				.addClass('has-error');
		},
		unhighlight: function(element){
			$(element)
				.closest('.form-group')
				.removeClass('has-error');
		}
		
	});
	$("#register-form").validate({
		rules:{
			name:{
				required: true,
			},
			email:{
				required:true,
				email: true
			},
			numberphone:{
				required:true,
				minlength:10
			},
			addresshome:{
				required:true,
			},
			username:{
				required:true,
				nowhitespace: true
			},
			password: {
				required:true,
				minlength: 6,
				maxlength: 45,
			},
			password2:{
				required: true,
				equalTo:"#password1"
			}
		},	
		messages:{
			name:{
				required: 'Hãy nhập họ và tên của bạn.',
			},
			email:{
				required: 'Hãy nhập địa chỉ email.',
				email:'Vui lòng nhập đúng email.'
			},
			numberphone:{
				required: 'Hãy nhập số điện thoại.',
				minlength: 'Số điện thoại của bạn ngắn quá.'
			},
			addresshome:{
				required:'Hãy nhập địa chỉ nhà bạn.'
			},
			username:{
				required: 'Hãy nhập tên đăng nhập.',
				nowhitespace:'Vui lòng nhập tên đăng nhập không có dấu cách.'
			},
			password:{
				required: 'Hãy nhập mật khẩu của bạn.',
				minlength:'Mật khẩu ít nhất 6 ký tự',
				maxlength: 'Mật khẩu quá dài',
			},
			password2:{
				required: 'Vui lòng xác nhận lại mật khẩu.',
				equalTo: 'Xác nhận không đúng mật khẩu.'
			}
		}
	});
	$("#forgot-fomr").validate({
		rules:{
			email:{
				required:true,
				email: true
			},
			username:{
				required:true,
				nowhitespace: true
			}
		},	
		messages:{
			email:{
				required: 'Hãy nhập địa chỉ email.',
				email: 'Vui lòng nhập đúng email.'
			},
			username:{
				required: 'Hãy nhập tên đăng nhập.',
				nowhitespace: 'Vui lòng nhập tên đăng nhập không có dấu cách.'
			}
		}
	});
	$("#LienHe-form").validate({
		rules:{
			name:{
				required: true,

			},
			email:{
				required:true,
				email: true
			},
			subject:{
				required:true,
			},
			comment:{
				required:true,
			}
		},
		messages:{
			name:{
				required: 'Hãy nhập họ và tên của bạn.',

			},
			email:{
				required: 'Hãy nhập địa chỉ email.',
				email:'Vui lòng nhập đúng email.'
			},
			subject:{
				required:'Nhập tên tiêu đề',

			},
			comment:{
				required:'Nhập vào nôi dung cần hổ trợ.',
				
			}
		}
			
	});
	
	$("#login-admin").validate({
		rules:{
			username:{
				required: true,
				nowhitespace: true
			},
			pass:{
				required:true,
			},
		},
		messages:{
			username:{
				required: 'Vui lòng nhập Username.',
				nowhitespace: 'Tên đăng nhập sai.'
			},
			pass:{
				required: 'Vui lòng nhập password.'
			},
		}		
	});
	$("#login-form").validate({
		rules:{
			username:{
				required: true,
				nowhitespace: true
			},
			password:{
				required:true,
			},
		},
		messages:{
			username:{
				required: 'Vui lòng nhập tên đăng nhập.',
				nowhitespace: 'Tên đăng nhập sai.'
			},
			password:{
				required: 'Vui lòng nhập mật khẩu.'
			},
		}		
	});
	$("#ttcn-fomr").validate({
		rules:{
			name:{
				required: true,
			},
			email:{
				required:true,
			},
			numberphone:{
				required:true,
			},
			addresshome:{
				required:true,
			},
		},
		messages:{
			name:{
				required: 'Vui lòng điền họ tên',
			},
			email:{
				required: 'Vui lòng điền email',
			},
			numberphone:{
				required: 'Vui lòng điền số điện thoại',
			},
			addresshome:{
				required: 'Vui lòng điền địa chỉ',
			},
		}		
	});
	$("#infomation-order-form").validate({
		rules:{
			name:{
				required: true,
			},
			numberphone:{
				required:true,
			},
			addresshome:{
				required:true,
			},
		},
		messages:{
			name:{
				required: 'Vui lòng điền họ tên',
			},
			numberphone:{
				required: 'Vui lòng điền số điện thoại',
			},
			addresshome:{
				required: 'Vui lòng điền địa chỉ',
			},
		}		
	});
	$("#change-pass-form").validate({
		rules:{
			oldpassword: {
				required:true,
				minlength: 6,
			},
			password1: {
				required:true,
				minlength: 6,
				maxlength: 45,
			},
			password2:{
				required: true,
				equalTo:"#password1",
			},
		},	
		messages:{
			oldpassword: {
				required: 'Hãy điền mật khẩu cũ',
				minlength: 'Mật khẩu quá ngắn',
			},
			password1:{
				required: 'Hãy nhập mật khẩu của bạn.',
				minlength:'Mật khẩu ít nhất 6 ký tự',
				maxlength: 'Mật khẩu quá dài'
			},
			password2:{
				required: 'Vui lòng xác nhận lại mật khẩu.',
				equalTo: 'Xác nhận không đúng mật khẩu.',
			}
		}
	});
	$("#nhom-quyen-form").validate({
		rules:{
			mieuta: {
				required:true,
			},
		},	
		messages:{
			mieuta: {
				required:'Hãy nhập miêu tả',
			},
		}
	});
	$("#fix-nv-form").validate({
		rules:{
			manv:{},
			password: {
				required:true,
			},
			name:{
				required:true,
			},
			phone:{
			},
			mail:{
				required:true,
				email:true
			},
		},	
		messages:{
			manv:{},
			password: {
				required: 'Hãy nhập mật khẩu.',
			},
			name:{
				required: 'Hãy điền họ tên.',
			},
			phone:{
			},
			mail:{
				required: 'Hãy điền email.',
				email: 'Hãy nhập đúng email.'
			},
		}
	});
	$("#add-nv-form").validate({
		rules:{
			name:{
				required: true,
			},
			mail:{
				required:true,
				email: true
			},
			phone:{
				required:true,
			},
			username:{
				required:true,
				nowhitespace: true
			},
			password1: {
				required:true,
			},
			password2:{
				required: true,
				equalTo:"#password1"
			}
		},	
		messages:{
			name:{
				required: 'Hãy nhập họ và tên của bạn.',
			},
			mail:{
				required: 'Hãy nhập địa chỉ email.',
				email:'Vui lòng nhập đúng email.'
			},
			phone:{
				required: 'Hãy nhập số điện thoại.',
			},
			username:{
				required: 'Hãy nhập tên đăng nhập.',
				nowhitespace:'Vui lòng nhập tên đăng nhập không có dấu cách.'
			},
			password1:{
				required: 'Hãy nhập mật khẩu của bạn.',
			},
			password2:{
				required: 'Vui lòng xác nhận lại mật khẩu.',
				equalTo: 'Xác nhận không đúng mật khẩu.'
			}
		}
	});
	$("#suatk-form").validate({
		rules:{
			username:{},
			quyen:{},
			name:{
				required:true,
			},
			phone:{
				required:true,
			},
			mail:{
				required:true,
				email:true
			},
		},	
		messages:{
			username:{},
			quyen:{},
			name:{
				required: 'Hãy điền họ tên.',
			},
			phone:{
				required: 'Hãy điền số điện thoại của bạn',
			},
			mail:{
				required: 'Hãy điền email.',
				email: 'Hãy nhập đúng email.'
			},
		}
	});
	$("#doimk-form").validate({
		rules:{
			oldpassword: {
				required:true,
			},
			password1: {
				required:true,
			},
			password2:{
				required: true,
				equalTo:"#password1",
			},
		},	
		messages:{
			oldpassword: {
				required: 'Hãy điền mật khẩu cũ',
			},
			password1:{
				required: 'Hãy nhập mật khẩu của bạn.',
			},
			password2:{
				required: 'Vui lòng xác nhận lại mật khẩu.',
				equalTo: 'Xác nhận không đúng mật khẩu.',
			}
		}
	});
	$("#Them_SanPham").validate({
		rules:{
			MaSanPham:{
				required:true,
			},
			TenSanPham:{
				required:true,
			},
			KhuyenMai:{
				required:true,
			},
			GiaBan:{
				required:true,
			},
			HinhAnh1:{
				
			},
			HinhAnh2:{
				
			},
			HinhAnh3:{
				
			},
			HinhAnh4:{
				
			},
			
		},
		message:{
			MaSanPham:{
				required:'Nhập mã sản phẩm .',
			},
			TenSanPham:{
				required:'Nhập tên sản phẩm',
			},
			KhuyenMai:{
				required:'Nhập giá khuyến mãi',
			},
			GiaBan:{
				required:'Nhập giá bán .',
			},
			HinhAnh1:{
				
			},
			HinhAnh2:{
				
			},
			HinhAnh3:{
				
			},
			HinhAnh4:{
				
			},
		}
	})
	$("#ss").validate({
		rules:{
			TieuDe: {
				required:true,
			},
			NoiDung: {
				required:true,
			},
			HinhAnh:{
			},
		},	
		messages:{
			TieuDe: {
				required: 'Hãy nhập tiêu đề tin tức.',
			},
			NoiDung:{
				required: 'Hãy nhập nội dung tin tức.',
			},
			HinhAnh:{
			}
		}
	});
});

