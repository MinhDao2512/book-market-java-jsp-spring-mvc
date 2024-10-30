$(document).ready(() => {

    //Save Time Out
    let typingTimer;
    const doneTypingInterval = 100;

    //Check Author Name
    $('#name').on('input blur', function () {
        const authorName = this.value;
        const authorNameRegex = /^\p{L}+(?:[\s-]\p{L}+)*$/u;

        clearTimeout(typingTimer);
        typingTimer = setTimeout(() => {
            if (authorName.length === 0) {
                $(this).addClass('is-invalid');
                $(this).siblings('.invalid-feedback').remove();
                $(this).after('<div class="invalid-feedback">Bạn chưa nhập "Họ và Tên" của tác giả !</div>').show();
            } else if (!authorNameRegex.test(authorName)) {
                $(this).addClass('is-invalid');
                $(this).siblings('.invalid-feedback').remove();
                $(this).after('<div class="invalid-feedback">Lỗi định dạng: "Họ và Tên" chứa số, ký tự đặc biệt hoặc thừa khoảng trắng !</div>').show();
            } else if (authorName.length > 100) {
                $(this).addClass('is-invalid');
                $(this).siblings('.invalid-feedback').remove();
                $(this).after('<div class="invalid-feedback">"Họ và Tên" quá dài: Tối đa 100 ký tự</div>').show();
            } else {
                $(this).removeClass('is-invalid');
                $(this).siblings('.invalid-feedback').remove();
            }
        }, doneTypingInterval);
    });

    //Check Birth Date
    $('#birthDate').on('input blur', function () {
        const birthDate = new Date(this.value);
        const today = new Date();

        if (!this.value) {
            $(this).addClass('is-invalid');
            $(this).siblings('.invalid-feedback').remove();
            $(this).after('<div class="invalid-feedback">Bạn chưa nhập "Ngày Sinh" của tác giả !</div>').show();
        } else if (birthDate > today) {
            $(this).addClass('is-invalid');
            $(this).siblings('.invalid-feedback').remove();
            $(this).after('<div class="invalid-feedback">"Ngày Sinh" không được lớn hơn ngày hiện tại !</div>').show();
        } else {
            $(this).removeClass('is-invalid');
            $(this).siblings('.invalid-feedback').remove();
        }
    });

    //Check Nationality
    $('#nationality').on('input blur', function () {
        const nationality = this.value;
        const nationalityRegex = /^[\p{L}\s-]+$/u;

        clearTimeout(typingTimer);
        typingTimer = setTimeout(() => {
            if (nationality.length === 0) {
                $(this).addClass('is-invalid');
                $(this).siblings('.invalid-feedback').remove();
                $(this).after('<div class="invalid-feedback">Bạn chưa nhập "Quốc Tịch" của tác giả !</div>').show();
            } else if (!nationalityRegex.test(nationality)) {
                $(this).addClass('is-invalid');
                $(this).siblings('.invalid-feedback').remove();
                $(this).after('<div class="invalid-feedback">Lỗi định dạng: "Quốc Tịch" không được chứa ký tự đặc biệt và số !</div>').show();
            } else {
                $(this).removeClass('is-invalid');
                $(this).siblings('.invalid-feedback').remove();
            }
        }, doneTypingInterval);
    });

    //Check Biography
    $('#biography').on('input blur', function () {
        const biography = this.value;

        if (biography.length === 0) {
            $(this).addClass('is-invalid');
            $(this).siblings('.invalid-feedback').remove();
            $(this).after('<div class="invalid-feedback">Bạn chưa nhập "Tiểu Sử" của tác giả !</div>').show();
        } else {
            $(this).removeClass('is-invalid');
            $(this).siblings('.invalid-feedback').remove();
        }
    });

    //Form Submit
    $("#formCreateAuthor").submit(function (event) {
        event.preventDefault();
        var form = document.getElementById('formCreateAuthor');
        var formData = new FormData(form);
        var inValid = false;

        $("input[required], select[required], textarea[required]").each(function () {
            // check exists div.invalid-feedback 
            if ($(this).next('.invalid-feedback').length) {
                inValid = true;
            }
        });

        if (inValid) {
            alert('Có lỗi xảy ra: " BẠN CHƯA ĐIỀN ĐẦY ĐỦ THÔNG TIN HOẶC THÔNG TIN SAI ĐỊNH DẠNG !"');
            event.stopPropagation()
            $("input[required], select[required], textarea[required]").each(function () {
                if ($(this).next('.invalid-feedback').length) {
                    $(this).addClass('is-invalid');
                    $(this).next('.invalid-feedback').show();
                }
            });
        } else {
            sendAjaxRequest(formData);
        }
    });

    // Call API using FormData
    function sendAjaxRequest(formData) {
        $.ajax({
            type: 'POST',
            url: 'http://localhost:8082/api/admin/authors',
            data: formData,
            contentType: false,
            processData: false,
            success: function (response, textStatus, xhr) {
                alert("Thành công! Bạn đã tại mới một tác giả.");
                window.location.href = '/admin/authors';
            },
            error: function (xhr, status, error) {
                if (xhr.status == 400) {
                    alert('Lỗi phía Server: Thông tin không hợp lệ hoặc đã tồn tại trước đó');
                    // Clear previous errors
                    $('.is-invalid').removeClass('is-invalid');
                    $('.invalid-feedback').removeAll();

                    // Display validation errors
                    var errors = JSON.parse(xhr.responseText);
                    Object.keys(errors).forEach(function (key) {
                        var inputField = $('#' + key);
                        inputField.addClass('is-invalid');
                        inputField.after('<div class="invalid-feedback">' + errors[key] + '</div>').show();
                    });
                } else if (xhr.status == 409) {
                    alert("Thất bại! Tác giả đã tồn tại.");
                } else {
                    alert('Lỗi khi tạo mới tác giả: ' + xhr.responseText);
                }
            }
        });
    }
});