<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script>
    const login = () => {
        let userId = $('input[name=userId]').val();
        let userPw = $('input[name=userPw]').val();

        let values = {
            'userId': userId,
            'userPw': userPw
        };

        console.log(values);

        axios.post('http://localhost:8098/login', values)
            .then(res => {
                console.log(res);
            })
            .catch(err => {
                console.log(err);
            });
    }
</script>

<h2>로그인</h2>
    <span style="color:red;">${map.message}</span>
    <table>
        <tr>
            <td>아이디</td>
            <td><input type="text" name="userId"></td>
        </tr>
        <tr>
            <td>비밀번호</td>
            <td><input type="password" name="userPw"></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="button" value="로그인" onclick="login()">
                <input type="button" value="회원가입" onclick="location.href='/create'">
            </td>
        </tr>
    </table>
</body>
</html>