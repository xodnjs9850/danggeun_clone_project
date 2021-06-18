<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    const msg = '${result}';
    if(msg === 'idFail') {
        alert('회원가입을 먼저 진행해주세요.');
        history.back();

    } else if (msg === 'pwFail') {
        alert('비밀번호를 확인해주세요.');
        history.back();
    }
</script>