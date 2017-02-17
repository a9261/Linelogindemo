﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="Line_Login_Example._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="Content/toastr.min.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/toastr.min.js"></script>
    <script src="Scripts/vue.min.js"></script>
    <script src="Scripts/isRockFx.js"></script>
    <script>
        //建立OAuth 身分驗證頁面並導入
        function Auth() {
            var URL = 'https://access.line.me/dialog/oauth/weblogin?';
            URL += 'response_type=code';
            URL += '&client_id=1501413885';   //TODO:這邊要換成你的client_id
            URL += '&redirect_uri=https://lineloginexample20170215054649.azurewebsites.net/callback.aspx';   //TODO:要將此redirect url 填回你的 LineLogin後台設定
            URL += '&state=abcde';
            window.location.href = URL;
        }

        //Button1 click
        function Button1_click() {
            Auth();
        }

        //hook event
        $(document).ready(function () {
            $('#Button1').click(Button1_click);
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="row" style="margin: 12px">
                <div class="col-lg-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            範例 : Line Login Example
                        </div>
                        <div class="panel-body">
                            說明: 
                        <ol>
                            <li>使用此範例Source code，請先更換程式碼中《你的Client_id》<br/> (位於default.aspx) </li>
                            <li>並且調整你申請好的LineLogin設定的callback url <br/> (測試階段應為http://localhost:17615/Callback.aspx) </li>
                            <li>同時Callback.aspx.cs中的client_id與client_secret必須改為你申請LineLogin後取得的正確資料</li>
                            <li>相關說明請參考 : http://studyhost.blogspot.tw/2016/12/linebot7-line-loginoauth-sso.html </li>
                        </ol>
                            使用: 
                        <ol>
                            <li>請點選《使用Line登入》，將會取得該登入用戶的access_token</li>
                            <li>接著按下《取得用戶資訊》，可透過access_token取得用戶資訊</li>
                        </ol>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            測試
                        </div>
                        <div class="panel-body">
                            <button class="btn btn-primary" id="Button1" type="button">使用Line登入</button>
                            <br /><br />
                            <div class="form-group">
                                <label>取回的token:</label>
                                <input runat="server" id="txb_token" class="form-control" /><br />
                                <asp:Button CssClass="btn btn-primary" OnClick="ButtonGetUserProfile_Click" ID="ButtonGetUserProfile" runat="server" Text="取得用戶資訊" />
                             <br />
                                <textarea runat="server" rows="5"  class="form-control" id="textarea1"> </textarea>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
