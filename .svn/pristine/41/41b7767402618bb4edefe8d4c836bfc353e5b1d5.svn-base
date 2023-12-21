<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>메일상세내역</title>
    <style>
        /* 기본 스타일 초기화 */
        body, h1, h2, h3, h4, h5, h6, p, ul, ol, li, table, th, td {
            margin: 0;
            padding: 0;
        }

        /* 컨테이너 스타일 */
        .container {
            width: 100%;
            height: 90%;
            margin: 0 auto;
            padding: 20px;
            background-color: white;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .container-fluid {
            width: 100%;
            height: 100%;
            padding-right: 0.75rem;
            padding-left: 0.75rem;
            margin-right: auto;
            margin-left: auto;
        }

        /* 테이블 스타일 */
        .details-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        .details-table th,
        .details-table td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }

        .details-table th {
            text-align: left;
            width: 30%;
        }

        .details-table td {
            text-align: left;
            white-space: normal;
            word-wrap: break-word;
            width: 70%;
        }
        
        .button-center {
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
    	<div class="container-fluid">
        <h4>메일상세내역</h4>
        <table class="details-table">
            <tr>
                <th>보낸 사람</th>
                <td>${mail.receiveMailSender}</td>
            </tr>
            <tr>
                <th>받은 사람</th>
                <td>${mail.receiveMailReceiver}</td>
            </tr>
            <tr>
                <th>수신일</th>
                <td>${mail.receiveMailDate}</td>
            </tr>
            <tr>
                <th>제목</th>
                <td>${mail.receiveMailTitle}</td>
            </tr>
            <tr>
                <th>내용</th>
                <td>
                     ${mail.receiveMailContent}
                </td>
            </tr>
        </table>
        </div>
    </div>
    <div class="button-center" style="margin-top: 20px;">
        <a href="/BSS/mailDelete/wasteDeleteOne.do?mailNo=${mail.receiveMailNo}" class="btn btn-danger">완전 삭제</a>
    </div>
</body>
</html>