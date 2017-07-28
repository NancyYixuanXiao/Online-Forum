<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
	<title>Login</title>
	<style>
		.mainDiv {
			top: 150px;
			width: 330px;
			height: 420px;
			background-color: #beeae8;
			border: groove;
			padding: 25px;
			margin: auto;
		}
		.text {
			text-align: center;
			font-family: Lucida Sans Unicode;
			color: #565C5A;
		}
	</style>
</head>
<body>
	<form id="form1" runat="server">
		<div class="mainDiv">
			<h1 class="text"> Login </h1>
			<label for="TextBoxName" class="text"> Username </label>
			<br/><br/>
			<asp:TextBox ID="TextBoxName" runat="server" style="padding: 12px 16px; width: 250px; margin-left: 25px; font-family: Lucida Sans Unicode"></asp:TextBox>
			<br/><br/>
			<label for="TextBoxPW" class="text"> Password </label>
			<br/><br/>
			<asp:TextBox ID="TextBoxPW" runat="server" style="padding: 12px 16px; width: 250px; margin-left: 25px; font-family: Lucida Sans Unicode" TextMode="Password"></asp:TextBox>
			<br/>
			<br/>
			<asp:Button ID="Login_button" runat="server" style="width: 110px; background-color:white; padding: 10px; color: #565C5A; margin-left: 95px; border-radius: 5px; font-size: medium; cursor: pointer" text="Login"  OnClick="Login_click"/>
			<br/>
			<br/>
			<asp:Button ID="Home_button" runat="server" style="width: 110px; background-color:white; padding: 10px; color: #565C5A; margin-left: 95px; border-radius: 5px; font-size: medium; cursor: pointer" text="Homepage" OnClick="GoHome"/>
			<br/>
			<asp:Label ID="status" runat="server" style="font-family: Lucida Sans Unicode"></asp:Label>
			<br />
			<br />
			<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>" SelectCommand="SELECT Id, UserName, Password FROM Users WHERE (UserName = @UserName)">
				<SelectParameters>
					<asp:ControlParameter ControlID="TextBoxName" Name="UserName" PropertyName="Text" />
				</SelectParameters>
			</asp:SqlDataSource>
		</div>
	</form>
</body>
</html>
