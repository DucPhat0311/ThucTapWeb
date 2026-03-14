function showHiddenPassword(inputId, iconId) {
    const input = document.getElementById(inputId);
    const icon = document.getElementById(iconId);

    if (input && icon) {
        icon.addEventListener("click", () => {
            if (input.type === "password") {
                input.type = "text";
                icon.innerHTML = '<i class="bi bi-eye-slash"></i>';
            } else {
                input.type = "password";
                icon.innerHTML = '<i class="bi bi-eye"></i>';
            }
        });
    }
}

//Kiểm tra và nhận code ở signup

function sendData() {

         const email = document.getElementById("email_signup").value;
		 const msgEmail = document.getElementById("msg_email");

		if(email === null || email.trim() === ""){
			return;
		}
		 const contextPath = window.location.pathname.split("/")[1];

         // Gửi POST request đến servlet
         fetch(`/${contextPath}/verifyCode`, {
             method: "POST",
             headers: {
                 "Content-Type": "application/x-www-form-urlencoded"
             },
             body: `email=${encodeURIComponent(email)}`
         })
         .then(response => {
             if(!response.ok) {
                 throw new Error("Lỗi HTTP: " + response.status);
             }
             return response.json();
         })
         .then(data => {
			console.log("Response data:", data.status); // Kiểm tra log để xem data trả về gì

			if (data.status === "failed") {
			           msgEmail.textContent = "Email already exists";
			           msgEmail.classList.add("text-danger");
			       } else if (data.status === "success") {
			           msgEmail.textContent = "Verification code sent";
			           msgEmail.classList.add("text-success");
					   
					   setTimeout(() => {
					           msgEmail.textContent = "";
					           msgEmail.classList.remove("text-success");
					       }, 5000); // 5 giây
			       }else if(data.status =="error"){
					msgEmail.textContent = "Error Send Mail";
					msgEmail.classList.add("text-danger");
				   }
             
         })
         .catch(error => {
             console.error("Error:", error);
             msgEmail.textContent = "Lỗi hệ thống khi gửi mail. Vui lòng check server console " + error.message;
			 msgEmail.classList.add("text-danger");
         });
     }
function timeCodeVerify() {
    try {
        const btn = document.getElementById("btn_verify");

        //Kiểm tra xem nút có tồn tại không
        if (!btn) {
            throw new Error("Không tìm thấy nút #btn_verify trên trang!");
        }

        btn.addEventListener("click", function () {
            btn.style.fontSize = "12px";

            let timeLeft = 60;

            btn.disabled = true;
            btn.textContent = `Wait (${timeLeft})`;

            const timer = setInterval(() => {
                try {
                    timeLeft--;
                    btn.textContent = `Wait (${timeLeft})`;

                    if (timeLeft <= 0) {
                        clearInterval(timer);
                        btn.disabled = false;
                        btn.textContent = "Send";
                    }
                } catch (err) {
                    //Nếu lỗi xảy ra trong interval, log ra nhưng không crash toàn trang
                    console.error("Lỗi trong setInterval:", err);
                    clearInterval(timer);
                }
            }, 1000);
        });
    } catch (e) {
        console.error("Có lỗi trong timeCodeVerify:", e);
    }
}

//Check pass realtime
function checkPasswordRealtime(pwdId, confirmId, msgId, btnId) {
    try {
        const password = document.getElementById(pwdId);
        const confirmPassword = document.getElementById(confirmId);
        const msg = document.getElementById(msgId);
        const btn = document.getElementById(btnId);

        // Nếu không tồn tại element nào => thoát
        if (!password || !confirmPassword || !msg || !btn) return;

        const validate = () => {
            const pwd = password.value.trim();
            const confirm = confirmPassword.value.trim();

            if (!pwd && !confirm) {
                msg.textContent = "";
                btn.disabled = true;
                return;
            }

            if (pwd.length < 6) {
                msg.style.color = "red";
                msg.innerHTML = '<i class="fa fa-times-circle" style="color:red"></i> Password must be at least 6 characters';
                btn.disabled = true;
                return;
            }

            if (pwd === confirm) {
                msg.style.color = "green";
                msg.innerHTML = '<i class="fa fa-check-circle" style="color:green"></i> Passwords match!';
                btn.disabled = false;
            } else {
                msg.style.color = "red";
                msg.innerHTML = '<i class="fa fa-times-circle" style="color:red"></i> Passwords do not match';
                btn.disabled = true;
            }
        };

        // Gắn sự kiện realtime
        password.addEventListener("input", validate);
        confirmPassword.addEventListener("input", validate);
    } catch (error) {
        console.error("Error in checkPasswordRealtime:", error);
    }
}

timeCodeVerify();